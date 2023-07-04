import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixel_app/Application_Form/Starting_Form.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SplashScreen.dart';

class RejectedScreen extends StatelessWidget {
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
            color: Colors.pink,
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
                      'Ooops your account is rejected :( ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 16, left: 16),
                    //   child: Text(
                    //     'Your Account is Under Review',
                    //     style: TextStyle(color: Colors.white),
                    //     textAlign: TextAlign.center,
                    //   ),
                    // ),
                    SizedBox(
                      height: 24,
                    ),
                    // Text("PLease Con")
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 41.h,
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
                      primary: Colors.blue, // Background color
                    ),
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      FirebaseAuth.instance.signOut();
                      preferences.remove("profileStatus");
                      preferences.remove("token");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartingFormPage(),
                        ),
                      );
                      ;
                    },
                    child: Text(
                      'Apply Again',
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
