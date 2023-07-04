import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Application_Form/Starting_Form.dart';
import 'package:pixel_app/screens/Booking1.dart';
import 'package:pixel_app/widgets/bottomNavigationBar/BottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/AuthController.dart';
import '../Model/UserModel.dart';
import 'DownloadsScreen.dart';
import 'Pay_Outs_Screen.dart';
import 'SignUp.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({Key? key}) : super(key: key);

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xfffaeaea),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: 844.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
                    height: 70.h,
                    width: 700.w,
                    decoration: BoxDecoration(
                      color: const Color(0xfff9bfc8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FutureBuilder<UserModel>(
                        future: AuthController().GetUserData(),
                        builder: (context, snapshot) {
                          return snapshot.connectionState ==
                                  ConnectionState.waiting
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    bottomNavigationBarState.selectedIndex = 3;
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const bottomNavigationBar()),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      snapshot.data?.data!.avatar == null
                                          ? Container(
                                              margin:
                                                  EdgeInsets.only(left: 10.w),
                                              height: 50.h,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                //  color: const Color(0xfffaeaea),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/avatar.png"),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            )
                                          : Container(
                                              margin:
                                                  EdgeInsets.only(left: 10.w),
                                              height: 50.h,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: const Color(0xfffaeaea),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${snapshot.data?.data?.avatar}'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                      SizedBox(width: 10.w),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${snapshot.data?.data?.name}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20.sp,
                                              ),
                                            ),
                                            SizedBox(height: 5.h),
                                            Text(
                                              'View Profile',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        }),
                  ),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {
                      bottomNavigationBarState.selectedIndex = 0;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const bottomNavigationBar()),
                      );
                    },
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: const Color(0xff969bc5),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {
                      bottomNavigationBarState.selectedIndex = 3;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const bottomNavigationBar()),
                      );
                    },
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: const Color(0xff969bc5),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => StartingFormPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Application Form',
                      style: TextStyle(
                        color: const Color(0xff969bc5),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Booking1Page()),
                      );
                    },
                    child: Text(
                      'Shifts & Schedules (Bookings)',
                      style: TextStyle(
                        color: const Color(0xff969bc5),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DownLoadsPage()));
                    },
                    child: Text(
                      'Downloads',
                      style: TextStyle(
                        color: const Color(0xff969bc5),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PayOutsScreen()));
                    },
                    child: Text(
                      'Pay-outs',
                      style: TextStyle(
                        color: const Color(0xff969bc5),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  // SizedBox(height: 30.h),
                  // InkWell(
                  //   onTap: () {
                  //     bottomNavigationBarState.selectedIndex = 2;
                  //     Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => bottomNavigationBar()),
                  //     );
                  //   },
                  //   child: Text(
                  //     'Settings',
                  //     style: TextStyle(
                  //       color: Color(0xff969bc5),
                  //       fontWeight: FontWeight.w500,
                  //       fontSize: 20.sp,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 30.h),
                  // InkWell(
                  //   onTap: () {
                  //     bottomNavigationBarState.selectedIndex = 2;
                  //     Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => bottomNavigationBar()),
                  //     );
                  //   },
                  //   child: Text(
                  //     'Support',
                  //     style: TextStyle(
                  //       color: Color(0xff969bc5),
                  //       fontWeight: FontWeight.w500,
                  //       fontSize: 20.sp,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setBool('Logined', false);
                      // pref.setString('token', 'asdf');
                      pref.remove('token');
                      pref.remove("profileStatus");
                      //  pref.remove("Submitted");

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: const Color(0xff969bc5),
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
