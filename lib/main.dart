import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/common_components/custom_appbar/controller/app_bar_controller.dart';
import 'package:sale_crm/services/api_service.dart';
import 'package:sale_crm/splash_screen.dart';

import 'authentication/login.dart';
import 'authentication/login_ios.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiService());
  runApp(SalesCRM());
}

class SalesCRM extends StatelessWidget {
  const SalesCRM({super.key});

  @override
  Widget build(BuildContext context) {
    // if (Platform.isAndroid) {
    //   return GetMaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Sales CRM App',
    //     home: LoginPage(),
    //   );
    // }
    // else{
    //   return GetCupertinoApp(
    //     debugShowCheckedModeBanner: false,
    //     title: "Sales CRM IOS",
    //     home: LoginPageIos(),
    //   );
    // }

    return GetCupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "Sales CRM IOS",
      home: LoginPageIos(),
    );

  }
}
