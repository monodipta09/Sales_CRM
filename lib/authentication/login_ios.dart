import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/authentication/UI_utils_ios.dart';
import '../Controllers/auth_controller.dart';
import '../Controllers/language_controller.dart';
// import 'UI_utils.dart';
import 'UI_utils_ios.dart';

class LoginPageIos extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  final LanguageController languageController = Get.put(LanguageController());
  final Map<String, String> languageFlags = {
    'EN': '🇺🇸', // English - USA flag
    'FR': '🇫🇷', // French - France flag
    'DE': '🇩🇪', // German - Germany flag
    'ES': '🇪🇸', // Spanish - Spain flag
  };


  LoginPageIos({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            buildBackgroundImageIos(),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildLogoSectionIos(),

                    buildLanguageDropdownIos(languageController, languageFlags),
                    buildTaglineIos(),
                    SizedBox(height: 20),
                    buildLoginFormIos(context, _formKey, usernameController, passwordController, authController),

                    buildFooterIos(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
