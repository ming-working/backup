// _auth Firebase Authentication instance for status check
// signed in or not.

class SmartAgeUserModel {
  // return user id assigned from the backend system.
  // SmartAgeUserModel Parameters
  final String? uid; // user Id
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  String deviceRegistrationToken;

  // Constructor
  SmartAgeUserModel({
    this.uid,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    this.password = "",
    this.deviceRegistrationToken = "",
  });

  // will not contain the password
  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "phoneNo": phoneNo,
      "deviceRegistrationToken": deviceRegistrationToken,
    };
  }
}
