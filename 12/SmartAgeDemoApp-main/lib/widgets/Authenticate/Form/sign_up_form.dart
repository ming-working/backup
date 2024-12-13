import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/models/user.dart';
import 'package:smartage_care/screens/authenticate/sign_in_screen.dart';
import 'package:smartage_care/services/authentication/signUp/sign_up_controller.dart';
import 'package:smartage_care/themes/widget_themes/elevated_button_theme.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool _showPassword1 = false;
  bool _showPassword2 = false;

  void setInit() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.put(SignUpController());
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "globalFullName".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // Fullname
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.name,
            style: Theme.of(context).textTheme.bodyMedium,
            controller: controller.fullName,
            validator: (val) => val?.isEmpty ?? true ? 'Enter a name' : null,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: green900,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusColor: Colors.white,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: smartAgeDefaultSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "globalPhoneNo".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // Phone Number
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: Theme.of(context).textTheme.bodyMedium,
            controller: controller.phoneNo,
            validator: (val) =>
                val?.isPhoneNumber ?? true ? 'Enter a phone number' : null,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: green900,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusColor: Colors.white,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(
                Icons.phone,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: smartAgeDefaultSize),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "globalEmail".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // Email
          TextFormField(
            style: Theme.of(context).textTheme.bodyMedium,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            //controller should be implemented
            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
            validator: (val) => // TODO: Email format validator
                val?.isEmail ?? false ? null : 'Enter an email',
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: green900,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusColor: Colors.white,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: smartAgeDefaultSize),
          // TextFormField for password
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "globalPassword".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // Password: text obscure functionality has been enabled
          TextFormField(
            style: Theme.of(context).textTheme.bodyMedium,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: _showPassword1 ? false : true,
            controller: controller.password,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: green900,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusColor: Colors.white,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(
                Icons.password,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _showPassword1 = !_showPassword1;
                  });
                },
                icon: Icon(
                  _showPassword1 ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                color: Colors.grey,
              ),
            ),
            validator:
                (val) => // TODO: need to figure out the password format regex
                    (val!.isEmpty && val.length > 8) // not empty and length > 8
                        ? 'Enter a password'
                        : null,
          ),
          const SizedBox(height: smartAgeDefaultSize),
          // TextFormField for password
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "globalRepeatPassword".tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // Repeated Password
          TextFormField(
            style: Theme.of(context).textTheme.bodyMedium,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: _showPassword2 ? false : true,
            controller: controller.checkPassword,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: green900,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusColor: Colors.white,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(
                Icons.password,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _showPassword2 = !_showPassword2;
                  });
                },
                icon: Icon(
                  _showPassword2 ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                color: Colors.grey,
              ),
            ),
            validator:
                (val) => // TODO: need to figure out the password format regex
                    val != controller.password.text
                        ? 'Password does not match'
                        : null,
          ),
          const SizedBox(height: smartAgeDefaultSize * 2),
          SmartAgeElevatedButton(
            onPressed: () async {
              // construct the SmartAgeUserModel using values in the controller.
              final user = SmartAgeUserModel(
                fullName: controller.fullName.text.trim(),
                email: controller.email.text.trim(),
                phoneNo: controller.phoneNo.text.trim(),
                password: controller.password.text.trim(),
              );

              // if the form is valid, register the user wusing controller
              if (formKey.currentState!.validate()) {
                controller.registerUser(user);
              }
            }, // need to deal with the data and upload to the server.
            light: false,
            text: "Sign Up",
          ),
          const SizedBox(
            height: smartAgeDefaultSize,
          ),
          TextButton(
            onPressed: () {
              Get.off(() => const SignIn());
            },
            child: const Text(
              'Login',
              style: TextStyle(color: green900),
            ),
          ),
        ],
      ),
    );
  }
}
