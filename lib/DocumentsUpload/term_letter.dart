import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Constants/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/DocumentController.dart';
import '../widgets/bottomNavigationBar/BottomNavigation.dart';
import 'document_upload.dart';

class Term_Letter extends StatefulWidget {
  const Term_Letter({Key? key}) : super(key: key);

  @override
  State<Term_Letter> createState() => _Term_LetterState();
}

class _Term_LetterState extends State<Term_Letter> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey();
  List<File> images = [];
  var date;
  var date2;
  var number;
  var name;
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    var month1 = 'September';
    var day1 = '1';
    var year1 = '2022';
    var month2 = 'September';
    var day2 = '1';
    var year2 = '2022';
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => DocumentsUpload()));
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
            size: 20.sp,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        title: Text(
          'Terms & Letter',
          style: TextStyle(
              fontSize: 19.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.grey.shade50,
            padding: EdgeInsets.all(17),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Date',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50.h,
                                width: 90.w,
                                child: DropdownButtonFormField<String>(
                                  value: day1,
                                  items: List.generate(
                                      31,
                                      (index) => DropdownMenuItem(
                                            child: Text('${index + 1}'),
                                            value: '${index + 1}',
                                          )),
                                  onChanged: (String? value) {
                                    day1 = value!;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                height: 50.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DropdownButtonFormField<String>(
                                  value: month1,
                                  items: [
                                    'January',
                                    'February',
                                    'March',
                                    'April',
                                    'May',
                                    'June',
                                    'July',
                                    'August',
                                    'September',
                                    'October',
                                    'November',
                                    'December'
                                  ]
                                      .map((e) => DropdownMenuItem(
                                            child: Text('${e}'),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    month1 = value!;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                height: 50.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DropdownButtonFormField<String>(
                                  value: year1,
                                  items: List.generate(
                                      DateTime.now().year + 10,
                                      (index) => DropdownMenuItem(
                                            child: Text(
                                                '${DateTime.now().year + 10 - index}'),
                                            value:
                                                '${DateTime.now().year + 10 - index}',
                                          )),
                                  onChanged: (String? value) {
                                    year1 = value!;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End Date',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50.h,
                                width: 90.w,
                                child: DropdownButtonFormField<String>(
                                  value: day2,
                                  items: List.generate(
                                      31,
                                      (index) => DropdownMenuItem(
                                            child: Text('${index + 1}'),
                                            value: '${index + 1}',
                                          )),
                                  onChanged: (String? value) {
                                    day2 = value!;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                height: 50.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DropdownButtonFormField<String>(
                                  value: month2,
                                  items: [
                                    'January',
                                    'February',
                                    'March',
                                    'April',
                                    'May',
                                    'June',
                                    'July',
                                    'August',
                                    'September',
                                    'October',
                                    'November',
                                    'December'
                                  ]
                                      .map((e) => DropdownMenuItem(
                                            child: Text('${e}'),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    month2 = value!;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                height: 50.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: DropdownButtonFormField<String>(
                                  value: year2,
                                  items: List.generate(
                                      DateTime.now().year + 10,
                                      (index) => DropdownMenuItem(
                                            child: Text(
                                                '${DateTime.now().year + 10 - index}'),
                                            value:
                                                '${DateTime.now().year + 10 - index}',
                                          )),
                                  onChanged: (String? value) {
                                    year2 = value!;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                      color: Color(0xffACA9A9),
                                    ),
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                      children: List.generate(images.length, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(images.elementAt(index)))),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            images.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    );
                  })),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        allowMultiple: true,
                        type: FileType.image,
                      );
                      if (result != null) {
                        result.files.forEach((element) {
                          File file = File(element.path!);
                          setState(() {
                            images.add(file);
                          });
                        });
                      } else {
                        // User canceled the picker
                      }
                    },
                    child: DottedBorder(
                      color: Colors.black,
                      strokeWidth: 1,
                      dashPattern: [
                        10,
                        10,
                      ],
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .3,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_present_rounded,
                                color: Colors.grey,
                                size: 70.sp,
                              ),
                              // SvgPicture.asset(
                              //   'assets/images/multiplephotosicon.svg',
                              //   color: Colors.black,
                              //   height: 80.h,
                              //   width: 80.w,
                              // ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Tap to upload multiple photos',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'File should be .jpg and less than 10 MB',
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .2,
                  ),
                  InkWell(
                    onTap: () async {
                      if (month1 == 'January') {
                        month1 = '01';
                      } else if (month1 == 'February') {
                        month1 = '02';
                      } else if (month1 == 'March') {
                        month1 = '03';
                      } else if (month1 == 'April') {
                        month1 = '04';
                      } else if (month1 == 'May') {
                        month1 = '05';
                      } else if (month1 == 'June') {
                        month1 = '06';
                      } else if (month1 == 'July') {
                        month1 = '07';
                      } else if (month1 == 'August') {
                        month1 = '08';
                      } else if (month1 == 'September') {
                        month1 = '09';
                      } else if (month1 == 'October') {
                        month1 = '10';
                      } else if (month1 == 'November') {
                        month1 = '11';
                      } else if (month1 == 'December') {
                        month1 = '12';
                      }
                      if (int.parse(day1) < 10) {
                        day1 = "0$day1";
                      }
                      date = year1 + '-' + month1 + '-' + day1;
                      if (month2 == 'January') {
                        month2 = '01';
                      } else if (month2 == 'February') {
                        month2 = '02';
                      } else if (month2 == 'March') {
                        month2 = '03';
                      } else if (month2 == 'April') {
                        month2 = '04';
                      } else if (month2 == 'May') {
                        month2 = '05';
                      } else if (month2 == 'June') {
                        month2 = '06';
                      } else if (month2 == 'July') {
                        month2 = '07';
                      } else if (month2 == 'August') {
                        month2 = '08';
                      } else if (month2 == 'September') {
                        month2 = '09';
                      } else if (month2 == 'October') {
                        month2 = '10';
                      } else if (month2 == 'November') {
                        month2 = '11';
                      } else if (month2 == 'December') {
                        month2 = '12';
                      }
                      if (int.parse(day2) < 10) {
                        day2 = "0$day2";
                      }
                      date2 = year2 + '-' + month2 + '-' + day2;

                      print(date);
                      if (formKey.currentState!.validate()) {
                        if (images.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            'Please input images',
                            style: TextStyle(color: Colors.white),
                          )));
                        } else {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return Container(
                                  child: Center(
                                      child: new CircularProgressIndicator(
                                color: Color(0xfffaeaea),
                              )));
                            },
                          );
                          var data = await DocumentController().AddTerm(
                              date1: date, date2: date2, images: images);
                          prefs = await SharedPreferences.getInstance();

                          prefs.setString("termLetterStatus", "Uploaded");
                          // passportStatus = "Uploaded";

                          // dbsCertificateStatus = "Uploaded";
                          setState(() {});
                          // setState(() {
                          //   termLetterStatus = "Uploaded";
                          // });
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DocumentsUpload()));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            '$data',
                            style: TextStyle(color: Colors.white),
                          )));
                        }
                      }
                    },
                    child: Container(
                      height: 60.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: year1 != "" &&
                                month1 != "" &&
                                day1 != "" &&
                                year2 != "" &&
                                month2 != "" &&
                                day2 != "" &&
                                images.isNotEmpty
                            ? Colors.pink
                            : Color(0xfffaeaea),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Upload',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: year1 != "" &&
                                      month1 != "" &&
                                      day1 != "" &&
                                      year2 != "" &&
                                      month2 != "" &&
                                      day2 != "" &&
                                      images.isNotEmpty
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
