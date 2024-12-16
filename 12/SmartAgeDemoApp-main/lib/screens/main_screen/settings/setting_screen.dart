/*
* This file contains the setting and profile screen.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/models/user.dart';
import 'package:smartage_care/services/authentication/signout/sign_out_controller.dart';
import 'package:smartage_care/services/authorization/profile_controller.dart';
import 'package:smartage_care/services/localization/translation_controller.dart';
import 'package:smartage_care/themes/widget_themes/elevated_button_theme.dart';
import 'package:smartage_care/widgets/authenticate/pop_up/sign_out_pop_up.dart';
import 'package:smartage_care/screens/main_screen/settings/settings.dart';
class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final TranslationController _t = Get.put(TranslationController());
  final ProfileController _p = Get.put(ProfileController());

  final _controller = Get.put(SignOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Settings",
                style: context.theme.textTheme.titleLarge,
              ),
              const SizedBox(
                height: smartAgeDefaultSize * 2,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                padding: const EdgeInsets.all(smartAgeDefaultSize / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: _p.getUserData(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator(
                            color: green900,
                          );
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          SmartAgeUserModel userData =
                              snapshot.data as SmartAgeUserModel;
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: smartAgeDefaultSize),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Text(
                                      userData.email,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Text(
                                      userData.fullName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Text(
                                      userData.phoneNo,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                      ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                            MaterialPageRoute(
                                              builder: (context) => Settings(),
                                            ),
                                          );
                                        },
                                        child: Text('Language'),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                        if (snapshot.hasError) {
                          return const Text("Error");
                        }

                        return const CircularProgressIndicator(
                          color: green900,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: smartAgeDefaultSize * 2,
              ),
              SmartAgeElevatedButton(
                text: "profileScreenLogout".tr,
                light: false,
                onPressed: () async {
                  await smartAgeSignOutPopUp(
                    context,
                    _controller,
                  );
                },
              ),
              const SizedBox(
                height: smartAgeDefaultSize,
              ),
              //languageChooser(_t),
            ],
          ),
        ),
      ),
    );
  }
}
