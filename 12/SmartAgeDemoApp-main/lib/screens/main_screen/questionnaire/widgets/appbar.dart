import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:smartage_care/src/features/core/screens/profile/update_profile_screen.dart';
//import 'package:smartage_care/src/repository/authentication_repository/authentication_repository.dart';
import 'package:smartage_care/constants/colors.dart';
import 'package:smartage_care/constants/image_strings.dart';
import 'package:smartage_care/constants/text_strings.dart';
//import '../../../profile/profile_screen.dart';
import 'package:smartage_care/i18n/strings.g.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({
    Key? key,
    required this.isDark,
  }) : super(key: key);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: Icon(Icons.menu,
          color: isDark ? smartAgeWhite : smartAgeDarkGreyColor),
      title: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 35, maxWidth: 200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(smartAgeSplashImage),
              height: 25,
            ),
            const SizedBox(width: 10),
            Text(
              tAppName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDark ? smartAgeSecondaryColor : smartAgeCardBgColor,
          ),
          /*
          child: IconButton(
            onPressed: () => Get.to(() => const ProfileScreen()),
            // onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Image(image: AssetImage(tUserProfileImage)),
          ),*/
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 35, maxWidth: 200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(smartAgeSplashImage),
              height: 25,
            ),
            const SizedBox(width: 10),
            Text(
              tAppName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
