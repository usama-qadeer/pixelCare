import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SplashScreen.dart';

class RevokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: _buildChild(context),
          ),
        ],
      ),
    );
  }

  _buildChild(BuildContext context) => Container(
        height: 350,
        decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  'assets/images/splashlogo.svg',
                  height: 100.h,
                  width: 100.w,
                ),
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
            ),
            SizedBox(
              height: 100.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Account Has Been Revoked.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 39.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48.h,
                  width: 300.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent, // Background color
                    ),
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      FirebaseAuth.instance.signOut();
                      preferences.remove("profileStatus");
                      preferences.remove("token");
                      //   preferences.remove("Submitted");

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SplashPage(),
                        ),
                      );
                      ;
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
