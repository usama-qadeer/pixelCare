import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/screens/Profile.dart';

import '../../chat_module/chat_app.dart';
import '../../screens/Home.dart';
import '../../screens/Notifications.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  bottomNavigationBarState createState() => bottomNavigationBarState();
}

class bottomNavigationBarState extends State<bottomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  var smallHeading = 15.0;
  var largeHeading = 20.0;
  static var selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const NotificationsPage(),
    const ChatApp(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (bottomNavigationBarState.selectedIndex == 0) {
          return true;
        } else {
          bottomNavigationBarState.selectedIndex = 0;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const bottomNavigationBar()),
          );
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          elevation: 50,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: const Color.fromARGB(255, 255, 17, 1),
          onTap: _onTap,
          currentIndex: selectedIndex,
          // selectedLabelStyle: GoogleFonts.poppins(fontSize: 10),
//Arow changing and Name Sellection
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400.withOpacity(0.7),
                              spreadRadius: 1,
                              blurRadius: 5)
                        ]),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.house_fill,
                          size: 16.r,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: selectedIndex == 0 ? Colors.red : Colors.white),
                  )
                ],
              ),
              label: "Home",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400.withOpacity(0.7),
                                spreadRadius: 1,
                                blurRadius: 5)
                          ],
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.notifications_none, size: 18.r),
                          ],
                        )),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Notification',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color:
                              selectedIndex == 1 ? Colors.red : Colors.white),
                    )
                  ],
                ),
                label: "Booking"),
            BottomNavigationBarItem(
                backgroundColor: Colors.red,
                icon: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400.withOpacity(0.7),
                                spreadRadius: 1,
                                blurRadius: 5),
                          ],
                        ),
                        child: Column(
                          children: [
                            Icon(CupertinoIcons.chat_bubble_text, size: 18.r),
                          ],
                        )),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Messages',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color:
                              selectedIndex == 2 ? Colors.red : Colors.white),
                    )
                  ],
                ),
                label: "Calender"),
            BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400.withOpacity(0.7),
                                spreadRadius: 1,
                                blurRadius: 5)
                          ]),
                      child: Column(
                        children: [
                          Icon(
                            CupertinoIcons.person,
                            size: 18.r,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color:
                              selectedIndex == 3 ? Colors.red : Colors.white),
                    )
                  ],
                ),
                label: "profile"),
          ],
        ),
        body: _widgetOptions.elementAt(selectedIndex),
      ),
    );
  }

  void _onTap(int index) {
    selectedIndex = index;
    setState(() {});
  }
}
