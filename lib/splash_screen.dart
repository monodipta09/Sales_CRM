import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sale_crm/services/api_service.dart';
import '../authentication/login.dart';
import 'Sales_CRM_android/sales_crm_entry_point_android/screen/sales_crm_entry_point_android.dart'; // Import your ApiService

class SplashScreen extends StatelessWidget {
  final SplashController _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/keross-logo.png'), // Your logo asset
            SizedBox(height: 20),
            const Text(
              "Sales CRM",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(), // Loading indicator
          ],
        ),
      ),
    );
  }
}

class SplashController extends GetxController {
  final ApiService _apiService = Get.find<ApiService>();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 5)); // Splash delay

    String? savedTicket = await _storage.read(key: "ticket");
    String? savedSoftwareId = await _storage.read(key: "softwareId");

    if (savedTicket != null && savedTicket.isNotEmpty) {
      bool isValid = await _apiService.validateSession(savedTicket);
      if (isValid) {
        if (savedSoftwareId != null && savedSoftwareId.isNotEmpty) {
          _apiService.softwareId.value = savedSoftwareId;
        }
        Get.offAll(() => SalesCrmEntryPointAndroid());
      } else {
        _apiService.logout();
        Get.off(() => LoginPage());
      }
    } else {
      Get.off(() => LoginPage());
    }
  }
}
