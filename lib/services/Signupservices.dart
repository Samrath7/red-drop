import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:red_drop/screen/login.dart';

SignupUser(String username, String dob, String bloodtype, String phonenum,
    String useremail, String userpassword, String confirmpassword) async {
  User? Userid = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection("Users").doc(Userid!.uid).set({
      'username': username,
      'dob': dob,
      'bloodtype': bloodtype,
      'phonenum': phonenum,
      'useremail': useremail,
      'password': userpassword,
      'confirmpassword': confirmpassword,
      'Createdate': DateTime.now(),
      'UserID': Userid.uid,
    }).then((value) => {
          FirebaseAuth.instance.signOut(),
          Get.to(() => login()),
        });
  } on FirebaseAuthException catch (e) {
    print("ERROR $e");
  }
  // log("User details been added to the Database"),
}

class Get {
  static to(login Function() param0) {}
}
