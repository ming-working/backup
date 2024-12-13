import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/models/circler_of_support.dart';
import 'package:smartage_care/models/user.dart';

class CircleOfSupportScreen extends StatefulWidget {
  const CircleOfSupportScreen({super.key});

  @override
  State<CircleOfSupportScreen> createState() => _CircleOfSupportScreenState();
}

class _CircleOfSupportScreenState extends State<CircleOfSupportScreen> {
  List<SmartAgeUserModel> users = [
    SmartAgeUserModel(
      uid: '12345',
      fullName: 'Alice Smith',
      email: 'alice.smith@example.com',
      phoneNo: '123-456-7890',
      password: 'password123',
      deviceRegistrationToken: 'token123',
    ),
    SmartAgeUserModel(
      uid: '67890',
      fullName: 'Bob Johnson',
      email: 'bob.johnson@example.com',
      phoneNo: '987-654-3210',
      password: 'password456',
      deviceRegistrationToken: 'token456',
    ),
    SmartAgeUserModel(
      uid: '11223',
      fullName: 'Charlie Brown',
      email: 'charlie.brown@example.com',
      phoneNo: '555-555-5555',
      password: 'password789',
      deviceRegistrationToken: 'token789',
    ),
  ];

  late CircleModel circle;

  @override
  void initState() {
    super.initState();
    circle = CircleModel('Alice\'s Mom', users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: smartAgeDefaultSize * 0.5,
              horizontal: smartAgeDefaultSize * 0.75,
            ),
            child: Text(
              "CoSTitle".tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: smartAgeDefaultSize * 0.2,
              horizontal: smartAgeDefaultSize * 0.75,
            ),
            width: double.infinity,
            color:
                Colors.green.withOpacity(0.2), // Assuming green300 is a color
            child: Text(
              "CoSMember".tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: circle.members.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            circle.members[index].fullName,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Spacer(),
                          Text(
                            circle.members[index].uid.toString(),
                            style:Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          //Call button section
                          CircleIconContainer(
                              backgroundColor: const Color.fromRGBO(0, 76, 56, 1),
                              borderColor: const Color.fromRGBO(0, 76, 56, 1),
                              iconColor: Colors.white,
                              icon: Icons.phone_in_talk_outlined,
                              onTap: () { print("Call Tapped"); }),
                          const SizedBox(width: 10),
                          Text(
                            "globalCall".tr,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),

                          //Setting button section
                          const SizedBox(width: 20),
                          CircleIconContainer(
                              backgroundColor: const Color.fromRGBO(0, 76, 56, 1),
                              borderColor: const Color.fromRGBO(0, 76, 56, 1),
                              iconColor: Colors.white,
                              icon: Icons.close_outlined,
                              onTap: () { print("Setting Tapped"); }),
                          const SizedBox(width: 10),
                          Text(
                            "globalSetting".tr,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(width: 20),


                          //Kick button Section
                          CircleIconContainer(
                              backgroundColor: Colors.white,
                              borderColor: Colors.red,
                              iconColor: Colors.red,
                              icon: Icons.close_outlined,
                              onTap: () { print("Kick Tapped"); }),
                          const SizedBox(width: 10),
                          Text(
                            "CoSKickMember".tr,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(width: 20),

                          //End of Button Row
                        ],
                      ),

                      //Divider line
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0), // Adjust the padding as needed
                        child: const Divider(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CircleIconContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final Color borderColor;
  final IconData icon;
  final VoidCallback onTap; // Add this line

  const CircleIconContainer({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.icon,
    required this.borderColor,
    required this.onTap, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // Modify this line
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
        ),
        child: Icon(
          icon,
          size: 25.0,
          color: iconColor,
        ),
      ),
    );
  }
}
