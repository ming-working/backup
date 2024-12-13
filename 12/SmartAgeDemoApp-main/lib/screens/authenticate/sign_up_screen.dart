import 'package:flutter/material.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/widgets/authenticate/form/sign_up_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // final _width = MediaQuery.of(context).size.width; // get the screen width
    // final _height = MediaQuery.of(context).size.height; // get the screen height
    // final _logoSize = _width * 0.33; // get the logo size: can be changed later
    // two text fields for email and password
    // one button for login
    // need to be able to change the mode between sign in and sign up
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: grey000,
          surfaceTintColor: grey000,
          iconTheme: const IconThemeData(
            color: Colors.black, // Change this to your desired color
          ),
        ),
        backgroundColor: grey000,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              // Let's edit this
              vertical: 10,
              horizontal: 20,
            ),
            child: Column(
              children: [
                Text(
                  "Register",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: smartAgeDefaultSize),
                const SignUpFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
