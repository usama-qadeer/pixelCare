// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixel_app/Application_Form/Starting_Form.dart';
import 'package:pixel_app/Model/UserModel.dart';
import 'package:pixel_app/screens/SignUp.dart';
import 'package:pixel_app/screens/status_screen/pending_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/AuthController.dart';
import '../widgets/bottomNavigationBar/BottomNavigation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  @override
  void initState() {
    getData();
    super.initState();
    controller = AnimationController(
        vsync: this,
        lowerBound: 0.8,
        upperBound: 1.2,
        duration: const Duration(seconds: 1));

    controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller!.dispose();

    super.dispose();
  }

  UserModel? _userModel;

  Future<void> getData() async {
    try {
      final user = await AuthController().GetUserData();
      setState(() {
        _userModel = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    // _userModel != null
    //     ? print("rrrrrrrrr${_userModel!.data!.status.toString()}")
    //     : print("Loading..");
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10.h),
            AnimatedBuilder(
              animation: controller!,
              child: const Icon(
                Icons.notifications,
                size: 35,
                color: Colors.white,
              ),
              builder: (context, widget) => Transform.scale(
                scale: controller!.value,
                child: Container(
                  height: 200.h,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "assets/images/splashlogo.svg",
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
              child: InkWell(
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  token = pref.getString('token');
                  var profileSt = pref.getString("profileStatus");
                  var appSts = pref.getBool("Submitted");
                  print("0000000000000 " + profileSt.toString());
                  print("1111111111111 " + appSts.toString());
                  if (pref.getBool('Logined') == true &&
                      pref.getString("profileStatus") == "1" &&
                      pref.getBool("Submitted") == true) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const bottomNavigationBar()),
                    );
                  }
                  // else if (pref.getBool('Logined') == true &&
                  //     pref.getString("profileStatus") == "0" &&
                  //     pref.getBool("Submitted") == false) {
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => StartingFormPage()),
                  //   );
                  // }
                  // else if (pref.getString("profileStatus") == "6") {
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => PendingUser()),
                  //   );
                  // }
                  else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  }
                },
                child: Container(
                  height: 60.h,
                  width: 600.w,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'GET STARTED',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
