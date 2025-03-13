import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_crm/components/custom_input_IOS.dart';
import '../Controllers/auth_controller.dart';
import '../Controllers/language_controller.dart';
import 'auth_utils.dart';
import 'forgot_password.dart';

Widget buildBackgroundImageIos() {
  return SizedBox.expand(
    child: Image.asset(
      'assets/loginPageBackgroundImage.gif',
      fit: BoxFit.cover,
    ),
  );
}

Widget buildLogoSectionIos() {
  return Column(
    children: [
      const SizedBox(height: 40),
      Image.asset('assets/keross-logo.png', height: 40),
      const SizedBox(height: 10),
    ],
  );
}

Widget buildLanguageDropdownIos(
    LanguageController languageController, Map<String, String> languageFlags) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Spacer(),
      Obx(() => buildDropdownIos(languageController, languageFlags)),
      const Spacer(),
    ],
  );
}


Widget buildDropdownIos(
    LanguageController languageController, Map<String, String> languageFlags) {
  // return Container(
  //   padding: const EdgeInsets.symmetric(horizontal: 12),
  //   decoration: BoxDecoration(
  //     color: CupertinoColors.systemBackground,
  //     borderRadius: BorderRadius.circular(8),
  //     border: Border.all(color: CupertinoColors.inactiveGray),
  //   ),
  //   child: CupertinoPicker(
  //     scrollController: FixedExtentScrollController(
  //       initialItem: languageController.languages.indexOf(languageController.selectedLanguage.value),
  //     ),
  //     itemExtent: 32.0,
  //     onSelectedItemChanged: (int index) {
  //       languageController.updateLanguage(languageController.languages[index]);
  //     },
  //     children: languageController.languages.map((String language) {
  //       return Center(
  //         child: Text(
  //           '${languageFlags[language] ?? '🏳️'} $language',
  //           style: const TextStyle(fontSize: 16, color: CupertinoColors.systemGrey),
  //         ),
  //       );
  //     }).toList(),
  //   ),
  // );
  return Container(
    width: 200, // Set a fixed width for the picker
    child: CupertinoPicker(
      scrollController: FixedExtentScrollController(
        initialItem: languageController.languages.indexOf(
            languageController.selectedLanguage.value),
      ),
      itemExtent: 32.0,
      onSelectedItemChanged: (int index) {
        languageController.updateLanguage(languageController.languages[index]);
      },
      children: languageController.languages.map((String language) {
        return Center(
          child: Text(
            '${languageFlags[language] ?? '🏳️'} $language',
            style: const TextStyle(
                fontSize: 16, color: CupertinoColors.systemGrey),
          ),
        );
      }).toList(),
    ),
  );
}

// Widget buildLanguageDropdownIos(LanguageController languageController, Map<String, String> languageFlags) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       const Spacer(),
//       Obx(() => buildDropdownIos(languageController, languageFlags)),
//       const Spacer(),
//     ],
//   );
// }

// Widget buildDropdownIos(LanguageController languageController, Map<String, String> languageFlags) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 12),
//     decoration: BoxDecoration(
//       color: CupertinoColors.systemGrey5,
//       borderRadius: BorderRadius.circular(8),
//       border: Border.all(color: CupertinoColors.systemGrey),
//     ),
//     child: CupertinoButton(
//       padding: EdgeInsets.zero,
//       onPressed: () async {
//         // Open a CupertinoPicker to select language
//         var context;
//         await showCupertinoModalPopup(
//           context: context,
//           builder: (BuildContext context) {
//             return CupertinoActionSheet(
//               title: const Text('Select Language'),
//               actions: languageController.languages.map((String language) {
//                 return CupertinoActionSheetAction(
//                   onPressed: () {
//                     languageController.updateLanguage(language);
//                     Navigator.pop(context); // Close the action sheet
//                   },
//                   child: Text('${languageFlags[language] ?? '🏳️'} $language'),
//                 );
//               }).toList(),
//               cancelButton: CupertinoActionSheetAction(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the action sheet
//                 },
//                 isDestructiveAction: true,
//                 child: const Text('Cancel'),
//               ),
//             );
//           },
//         );
//       },
//       child: Row(
//         children: [
//           Text(
//             '${languageFlags[languageController.selectedLanguage.value] ?? '🏳️'} ${languageController.selectedLanguage.value}',
//             style: const TextStyle(fontSize: 16, color: CupertinoColors.black),
//           ),
//           const Icon(CupertinoIcons.chevron_down),
//         ],
//       ),
//     ),
//   );
// }


Widget buildTaglineIos() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Text(
      'Transforming complexity\ninto opportunity with AI',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: CupertinoColors.white,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

Widget buildFooterIos() {
  return Column(
    children: [
      const SizedBox(height: 40),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(color: CupertinoColors.white, fontSize: 16),
          ),
          SizedBox(width: 5),
          Text(
            'Sign Up',
            style: TextStyle(
              color: CupertinoColors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: CupertinoColors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
      const SizedBox(height: 30),
      const Text('Looking for Support?',
          style: TextStyle(color: CupertinoColors.white, fontSize: 14)),
      const SizedBox(height: 5),
      const Text('Version 6.5.2',
          style: TextStyle(color: CupertinoColors.white, fontSize: 14)),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Powered By ',
              style: TextStyle(color: CupertinoColors.white, fontSize: 16)),
          Image.asset('assets/keross-footer.png', height: 16),
          const Text(' | © 2025',
              style: TextStyle(color: CupertinoColors.white, fontSize: 16)),
          const SizedBox(width: 10),
          const Icon(CupertinoIcons.line_horizontal_3,
              color: CupertinoColors.white, size: 30),
        ],
      ),
      const SizedBox(height: 20),
    ],
  );
}

// Forgot Password Section
Widget buildResetButtonIos(TextEditingController usernameController) {
  return SizedBox(
    width: double.infinity,
    height: 48,
    child: CupertinoButton.filled(
      onPressed: () {
        usernameController.clear();
      },
      child: const Text('Reset', style: TextStyle(fontSize: 16)),
    ),
  );
}

Widget buildGenerateNewPasswordButtonIos(BuildContext context,
    AuthController authController, GlobalKey<FormState> formKey, TextEditingController usernameController) {
  return Obx(() {
    return authController.isLoading.value
        ? const CupertinoActivityIndicator()
        : SizedBox(
            width: double.infinity,
            height: 48,
            child: CupertinoButton.filled(
              onPressed: () {
                handleResetPasswordIos(formKey, usernameController, authController);
              },
              child: const Text('Generate New Password', style: TextStyle(fontSize: 16)),
            ),
          );
  });
}

Widget buildResetPasswordFormIos(BuildContext context, GlobalKey<FormState> formKey,
    TextEditingController usernameController, AuthController authController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: CupertinoFormSection.insetGrouped(
      children: [
        CustomInputIOS(
          controller: usernameController,
          labelText: 'Username',
          hintText: 'Enter your username',
          isMandatory: true,
          prefixIcon: const Icon(CupertinoIcons.person),
        ),
        buildGenerateNewPasswordButtonIos(context, authController, formKey, usernameController),
        buildResetButtonIos(usernameController),
      ],
    ),
  );
}

// Login Section
Widget buildLoginFormIos(BuildContext context, GlobalKey<FormState> formKey,
    TextEditingController usernameController, TextEditingController passwordController, AuthController authController) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoColors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: CupertinoColors.transparent,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/ikon-logo.png', height: 40),
            const SizedBox(height: 10),
            const Text(
              'Harness the Power of Data',
              style: TextStyle(color: CupertinoColors.black, fontSize: 14),
            ),
            const SizedBox(height: 20),
            CustomInputIOS(
              controller: usernameController,
              labelText: 'Username',
              hintText: 'Enter your username',
              isMandatory: true,
              prefixIcon: const Icon(CupertinoIcons.person),
            ),
            const SizedBox(height: 10),
            CustomInputIOS(
              controller: passwordController,
              labelText: 'Password',
              hintText: 'Enter your password',
              isMandatory: true,
              prefixIcon: const Icon(CupertinoIcons.lock),
              inputType: InputType.password,
            ),
            buildForgotPasswordIos(),
            buildLoginButtonIos(context, authController, usernameController, passwordController),
            const SizedBox(height: 10),
            buildResetButtonInLoginIos(usernameController, passwordController),
          ],
        ),
      ),
    ),
  );


}

Widget buildResetButtonInLoginIos(TextEditingController usernameController, TextEditingController passwordController) {
  return SizedBox(
    width: double.infinity,
    height: 48,
    child: CupertinoButton.filled(
      onPressed: () {
        usernameController.clear();
        passwordController.clear();
      },
      child: const Text('Reset', style: TextStyle(fontSize: 16)),
    ),
  );
}

Widget buildForgotPasswordIos() {
  return Align(
    alignment: Alignment.centerRight,
    child: CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Get.to(ForgotPassword());
      },
      child: const Text('Forgot Password?', style: TextStyle(color: CupertinoColors.activeBlue)),
    ),
  );
}

Widget buildLoginButtonIos(BuildContext context, AuthController authController, TextEditingController usernameController, TextEditingController passwordController) {
  return Obx(() {
    return authController.isLoading.value
        ? const CupertinoActivityIndicator()
        : SizedBox(
            width: double.infinity,
            height: 48,
            child: CupertinoButton.filled(
              onPressed: () {
                handleLoginIos(context, usernameController, passwordController,authController);
              },
              child: const Text('Login', style: TextStyle(fontSize: 16)),
            ),
          );
  });
}


