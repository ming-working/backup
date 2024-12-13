import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/screens/authenticate/sign_up_screen.dart';
import 'package:smartage_care/services/authentication/signIn/sign_in_controller.dart';
import 'package:smartage_care/themes/widget_themes/elevated_button_theme.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key});

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _showPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(SignInController());
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          /*  */
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "globalEmail".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 5),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
            style: Theme.of(context).textTheme.bodyMedium,
            validator: (val) => // email format validator
                val?.isEmpty ?? true ? 'Enter an email' : null,
            // Decoration for the email field
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(18),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: green900,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: green900,
                  width: 3,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusColor: green900,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              fillColor: grey000,
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "globalPassword".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 5),
          // TextFormField for Password
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,

            style: Theme.of(context).textTheme.bodyMedium,
            controller: controller.password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: _showPassword ? false : true, // need to implmen
            validator: (val) =>
                val?.isEmpty ?? true ? 'Enter a password' : null,
            // Decoration for the password field
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(18),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: green900,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusColor: grey000,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(
                Icons.password,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  // TODO: implement the password show hide function.
                  setState(
                    () {
                      _showPassword = !_showPassword;
                    },
                  );
                },
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: smartAgeDefaultSize * 2),
          SmartAgeElevatedButton(
            onPressed: () {
              controller.signInUser();
            },
            light: false,
            text: "Sign In",
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Get.off(() => const SignUp());
            },
            child: const Text(
              'Register',
              style: TextStyle(
                color: green900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
