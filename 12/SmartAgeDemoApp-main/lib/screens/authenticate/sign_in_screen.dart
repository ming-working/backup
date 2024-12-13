import 'package:flutter/material.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/widgets/authenticate/form/sign_in_form.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = GetX.put(SignInController());
    final width = MediaQuery.of(context).size.width; // get the screen width

    // two text fields for email and password
    // one button for login
    // need to be able to change the mode between sign in and sign up
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey000,
        surfaceTintColor: grey000,
        iconTheme: const IconThemeData(
          color: Colors.black, // Change this to your desired color
        ),
      ),
      backgroundColor: grey000,
      body: SingleChildScrollView(
        // width: _width,
        // height: _height,
        padding: const EdgeInsets.symmetric(
          // Let's edit this
          vertical: 10,
          horizontal: 30,
        ),
        // Title and SignInFormWidget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: width / 10),
            const SignInFormWidget(),
          ],
        ),
      ),
    );
  }
}
