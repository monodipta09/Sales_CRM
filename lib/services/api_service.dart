import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../authentication/login.dart';

class ApiService extends GetxService {
  final String restUrl = "https://ikoncloud-dev.keross.com/rest";

  // Observables
  var tempTicket = ''.obs;
  var ticket = ''.obs;
  var softwareId = "".obs;

  final String _globalAccountId = 'b8bbe5c9-ad0d-4874-b563-275a86e4b818';
  final String _softwareName = "Sales CRM";
  final String _versionNumber = "1";

  final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Hashes password using SHA-512
  Future<String> _hashPassword(String content) async {
    final bytes = utf8.encode(content);
    final digest = sha512.convert(bytes);
    return digest.toString();
  }

  // Login API
  Future<bool> login(String username, String password) async {
    try {
      final hashedPassword = await _hashPassword(password);

      final headers = {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
      };

      final params = {
        "inZip": "false",
        "outZip": "true",
        "inFormat": "xml",
        "outFormat": "typedjson",
        "service": "loginService",
        "operation": "login",
        "locale": "en_US",
      };

      final credential = '''
<list>
  <string>
    <content><![CDATA[$username]]></content>
  </string>
  <string>
    <content><![CDATA[$hashedPassword]]></content>
  </string>
</list>
'''
          .trim()
          .replaceAll(RegExp(r'\s+'), '');

      final uri = Uri.parse(restUrl).replace(queryParameters: params);
      final body = {'arguments': credential};

      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final ticketValue = responseData['value']?['ticket']?['value'];

        if (ticketValue != null && ticketValue is String) {
          ticket.value = ticketValue; // Ensure ticket is RxString

          // Get software ID
          softwareId.value = await _getSoftwareId(_softwareName, _versionNumber);


          await _storage.write(key: "ticket", value: ticketValue);
          await _storage.write(key: "softwareId", value:  softwareId.value);

          return true;
        } else {
          print("Error: Ticket not found in response");
          return false;
        }
      } else {
        print("Login failed with status code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }


  //softwareId API
  Future<String> _getSoftwareId(String softwareName,String versionNumber ) async {
    var headers = {
      'User-Agent': 'IKON Job Server',
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    // Define query parameters
    final params = {
      "inZip": "false",
      "outZip": "false",
      "inFormat": "freejson",
      "outFormat": "freejson",
      "service": "softwareService",
      "operation": "mapSoftwareName",
      "locale":"en_US",
      "activeAccountId":this._globalAccountId,
      "ticket": ticket.value
    };

    final uri = Uri.parse(restUrl).replace(queryParameters: params);

    final body = {
      'arguments': jsonEncode([softwareName,versionNumber])
    };

    // Make the POST request
    final response = await http.post(
      uri,
      headers: headers,
      body: body,
    );

    print(response);
    try{
      if (response.statusCode == 200) {
        // Optionally, you can parse the response data here
        // For example:
        // final responseData = json.decode(response.body);
        // return responseData;
        return response.body.replaceAll('\"', "");
      }else if(response.statusCode == 401){
        await logout();
        return "";
      } else {
        // Handle non-200 responses
        return 'false';
      }
    } catch (error) {
      print("Error during getSoftwareId API call: $error");
      throw error;
    }

  }

  Future<void> logout({Function? callback}) async {
    try {
      // Clear stored credentials
      await _storage.delete(key: "ticket");
      await _storage.delete(key: "softwareId");
      await _storage.delete(key: "locale");
      await _storage.delete(key: "version");
      await _storage.delete(key: "theme");
      await _storage.delete(key: "userpagetype");

      // Reset observables
      ticket.value = "";
      softwareId.value = "";

      final headers = {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
      };

      final params = {
        "inZip": "false",
        "outZip": "false",
        "inFormat": "freejson",
        "outFormat": "freejson",
        "service": "loginService",
        "operation": "logout",
      };

      final uri = Uri.parse(restUrl).replace(queryParameters: params);
      final response = await http.post(uri, headers: headers);

      if (response.statusCode == 200) {
        print("Logout successful.");
      } else {
        print("Logout failed with status code: ${response.statusCode}");
      }

      if (callback != null) {
        callback();
      } else {
        // Navigate to LoginPage using GetX
        Get.offAll(() => LoginPage());
      }
    } catch (e) {
      print("Logout error: $e");

      // Navigate to LoginPage in case of error
      Get.offAll(() => LoginPage());
    }
  }


  //session validation API
  Future<bool> validateSession(String savedTicket) async {
    try {
      final headers = {
        "Content-Type": "application/x-www-form-urlencoded",
      };

      final params = {
        "inZip": "false",
        "outZip": "false",
        "inFormat": "freejson",
        "outFormat": "freejson",
        "service": "loginService",
        "operation": "getLoggedInUserProfile",
        "ticket": savedTicket,
        "activeAccountId": _globalAccountId
      };

      final uri = Uri.parse(restUrl).replace(queryParameters: params);
      final response = await http.post(uri, headers: headers);

      if (response.statusCode == 200) {
        ticket.value = savedTicket; // Update observable

        // Retrieve stored softwareId
        String? savedSoftwareId = await _storage.read(key: "softwareId");

        if (savedSoftwareId != null && savedSoftwareId.isNotEmpty) {
          softwareId.value = savedSoftwareId; // Update observable
        } else {
          // Re-fetch if not found
          String newSoftwareId = await _getSoftwareId(_softwareName, _versionNumber);
          softwareId.value = newSoftwareId;
          await _storage.write(key: "softwareId", value: newSoftwareId);
        }

        return true;
      } else {
        await logout();
        return false;
      }
    } catch (error) {
      print("Error validating session: $error");
      return false;
    }
  }

  // Reset Password API
  Future<bool> resetPassword(String userName) async {
    try {
      final headers = {
        "User-Agent": "Human",
        "Content-Type": "application/x-www-form-urlencoded",
      };

      final params = {
        "inZip": "false",
        "outZip": "false",
        "inFormat": "freejson",
        "outFormat": "freejson",
        "service": "loginService",
        "operation": "resetPassword",
      };

      final data = jsonEncode([userName]);
      final uri = Uri.parse(restUrl).replace(queryParameters: params);
      final body = {'arguments': data};

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );

      print(response);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("Error during resetPassword API call: $error");
      throw error;
    }
  }

  Future<List<dynamic>> getAllUsers() async {
    try {
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      final params = {
        "inZip": "false",
        "outZip": "false",
        "inFormat": "freejson",
        "outFormat": "freejson",
        "service": "userService",
        "operation": "getAllUsers",
        "ticket": ticket.value,
        "activeAccountId": _globalAccountId
      };

      final uri = Uri.parse(restUrl).replace(queryParameters: params);


      final arguments = [
        _globalAccountId,
      ];

      // Empty body as per original request
      final body = {
        'arguments': jsonEncode(arguments),
      };

      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final userProfile = jsonDecode(response.body);

        if (userProfile != null && userProfile is List) {
          return userProfile;
        } else {
          print('Get user profile failed: Invalid response data');
          throw Exception('Invalid response format');
        }
      }else if(response.statusCode == 401){
        await logout();
        return [];
      } else {
        print('API Error: ${response.statusCode} - ${response.reasonPhrase}');
        print(response.body);
        throw Exception('Failed to get user profile: ${response.reasonPhrase}');
      }
    } catch (error) {
      print("Error during getLoggedInUserProfileDetails API call: $error");
      throw error;
    }
  }

}
