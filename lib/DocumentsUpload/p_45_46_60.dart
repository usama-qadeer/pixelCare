import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/DocumentController.dart';
import '../Model/p45p46-model.dart';

class P_45_46_60 extends StatefulWidget {
  const P_45_46_60({Key? key}) : super(key: key);

  @override
  State<P_45_46_60> createState() => _P_45_46_60State();
}

class _P_45_46_60State extends State<P_45_46_60> {
  P45P46P60Model? _p45p46p60model;

  @override
  void initState() {
    getP45P45FromAPI();
    super.initState();
  }

  Future<void> getP45P45FromAPI() async {
    try {
      final user = await DocumentController().P40P46Get();
      setState(() {
        _p45p46p60model = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  String dropDownVal = 'P45';
  var dropDownItems = [
    'P45',
    'P46',
    'P60',
  ];

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey();
  List<File> images = [];
  var date;
  var number;
  late SharedPreferences prefs;
  var month1 = 'September';
  var day1 = '1';
  var year1 = '2022';

  @override
  Widget build(BuildContext context) {
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
          'P45/P46/P60',
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
              child: FutureBuilder(
                future: DocumentController().P40P46Get(),
                builder: (context, snapshot) {
                  if (snapshot.data?.message == "Record Founded") {
                    return Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Type',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              DropdownButtonFormField(
                                icon: Icon(Icons.keyboard_arrow_down),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Choose*",
                                  fillColor: Color(0xffF3F3F4),
                                ),
                                value: dropDownVal,
                                onChanged: (Value) {
                                  setState(() {
                                    dropDownVal = Value.toString();
                                  });
                                },
                                items: dropDownItems
                                    .map((v) => DropdownMenuItem(
                                        value: v, child: Text("$v")))
                                    .toList(),
                              ),
                              // TextField(
                              //   decoration: InputDecoration(
                              //     suffixIcon: Padding(
                              //       padding: EdgeInsets.only(right: 10),
                              //       child: InkWell(
                              //         child: DropdownButton(
                              //           value: dropDownVal,
                              //           icon: Icon(
                              //             Icons.keyboard_arrow_down,
                              //             color: Colors.black,
                              //           ),
                              //           // Array list of items
                              //           items: dropDownItems.map((String items) {
                              //             return DropdownMenuItem(
                              //                 value: items,
                              //                 child: Container(
                              //                   // margin: EdgeInsets.only(top: 10),
                              //                   // width: MediaQuery.of(context).size.width,
                              //                   child: Text(
                              //                     items,
                              //                     style: TextStyle(color: Colors.grey),
                              //                   ),
                              //                 ));
                              //           }).toList(),
                              //           // After selecting the desired option,it will
                              //           // change button value to selected value
                              //           onChanged: (newValue) {
                              //             setState(() {
                              //               dropDownVal = newValue.toString();
                              //             });
                              //           },
                              //         ),
                              //       ),
                              //     ),
                              //     // suffix:
                              //     contentPadding: EdgeInsets.all(18),
                              //     hintStyle: GoogleFonts.dmSans(
                              //       fontWeight: FontWeight.w600,
                              //       fontSize: 15.sp,
                              //       color: Color(0xffACA9A9),
                              //     ),
                              //     fillColor: Color(0xffF3F3F4),
                              //     filled: true,
                              //     border: OutlineInputBorder(
                              //       borderSide: BorderSide.none,
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(8),
                              //       ),
                              //     ),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderSide: BorderSide.none,
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(8),
                              //       ),
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderSide: BorderSide.none,
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(8),
                              //       ),
                              //     ),
                              //     hintText: dropDownVal,
                              //   ),
                              // ),
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
                                'Expiry Date',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.h,
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
                                          setState(() {});
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
                          height: MediaQuery.of(context).size.height * .020,
                        ),
                        _p45p46p60model != null
                            ? Container(
                                color: Colors.blue,
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 40,
                                      color: Colors.pink,
                                      child: Center(
                                        child: Text(
                                          "Uploaded Data",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Type: " +
                                                    _p45p46p60model!
                                                        .data!.first.type
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Expiry Date: " +
                                                    _p45p46p60model!
                                                        .data!.first.expiryDate
                                                        .toString(),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 150,
                                              color: Colors.transparent,
                                              child: _p45p46p60model != null
                                                  ? Center(
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            _p45p46p60model!
                                                                .data!
                                                                .first
                                                                .documentImages!
                                                                .first
                                                                .upload
                                                                .toString(),
                                                        placeholder: (context,
                                                                url) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    )
                                                  : Center(
                                                      child: Text(
                                                          "No Image uploaded")),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )

                                    // Row(
                                    //   children: [
                                    //     Column(
                                    //       children: [
                                    //         Text("Expiry Date: " +
                                    //             _enhancedDBSCertificate!
                                    //                 .data!.first.expiryDate
                                    //                 .toString()),
                                    //         Container(
                                    //           width: 200,
                                    //           height: 200,
                                    //           color: Colors.transparent,
                                    //           child: _enhancedDBSCertificate !=
                                    //                   null
                                    //               ? Center(
                                    //                   child: CachedNetworkImage(
                                    //                     imageUrl:
                                    //                         _enhancedDBSCertificate!
                                    //                             .data!
                                    //                             .first
                                    //                             .documentImages!
                                    //                             .first
                                    //                             .upload
                                    //                             .toString(),
                                    //                     placeholder: (context,
                                    //                             url) =>
                                    //                         CircularProgressIndicator(),
                                    //                     errorWidget: (context,
                                    //                             url, error) =>
                                    //                         Icon(Icons.error),
                                    //                   ),
                                    //                 )
                                    //               : Center(
                                    //                   child: Text(
                                    //                       "No Image uploaded")),
                                    //         ),
                                    //       ],
                                    //     )
                                    //   ],
                                    // )
                                  ],
                                ),
                              )
                            : Text("No image uploaded..."),
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
                            print(date);
                            if (formKey.currentState!.validate()) {
                              if (images.isEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
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
                                            child:
                                                new CircularProgressIndicator(
                                      color: Color(0xfffaeaea),
                                    )));
                                  },
                                );
                                var data = await DocumentController().AddP45(
                                    expiry: date,
                                    type: dropDownVal,
                                    images: images);
                                prefs = await SharedPreferences.getInstance();

                                prefs.setString("p45p60Status", "Uploaded");
                                // passportStatus = "Uploaded";

                                // dbsCertificateStatus = "Uploaded";
                                setState(() {});
                                // setState(() {
                                //   p45p60Status = "Uploaded";
                                // });
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => DocumentsUpload()));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
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
                                            images.isNotEmpty
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Type',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              DropdownButtonFormField(
                                icon: Icon(Icons.keyboard_arrow_down),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Choose*",
                                  fillColor: Color(0xffF3F3F4),
                                ),
                                value: dropDownVal,
                                onChanged: (Value) {
                                  setState(() {
                                    dropDownVal = Value.toString();
                                  });
                                },
                                items: dropDownItems
                                    .map((v) => DropdownMenuItem(
                                        value: v, child: Text("$v")))
                                    .toList(),
                              ),
                              // TextField(
                              //   decoration: InputDecoration(
                              //     suffixIcon: Padding(
                              //       padding: EdgeInsets.only(right: 10),
                              //       child: InkWell(
                              //         child: DropdownButton(
                              //           value: dropDownVal,
                              //           icon: Icon(
                              //             Icons.keyboard_arrow_down,
                              //             color: Colors.black,
                              //           ),
                              //           // Array list of items
                              //           items: dropDownItems.map((String items) {
                              //             return DropdownMenuItem(
                              //                 value: items,
                              //                 child: Container(
                              //                   // margin: EdgeInsets.only(top: 10),
                              //                   // width: MediaQuery.of(context).size.width,
                              //                   child: Text(
                              //                     items,
                              //                     style: TextStyle(color: Colors.grey),
                              //                   ),
                              //                 ));
                              //           }).toList(),
                              //           // After selecting the desired option,it will
                              //           // change button value to selected value
                              //           onChanged: (newValue) {
                              //             setState(() {
                              //               dropDownVal = newValue.toString();
                              //             });
                              //           },
                              //         ),
                              //       ),
                              //     ),
                              //     // suffix:
                              //     contentPadding: EdgeInsets.all(18),
                              //     hintStyle: GoogleFonts.dmSans(
                              //       fontWeight: FontWeight.w600,
                              //       fontSize: 15.sp,
                              //       color: Color(0xffACA9A9),
                              //     ),
                              //     fillColor: Color(0xffF3F3F4),
                              //     filled: true,
                              //     border: OutlineInputBorder(
                              //       borderSide: BorderSide.none,
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(8),
                              //       ),
                              //     ),
                              //     enabledBorder: OutlineInputBorder(
                              //       borderSide: BorderSide.none,
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(8),
                              //       ),
                              //     ),
                              //     focusedBorder: OutlineInputBorder(
                              //       borderSide: BorderSide.none,
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(8),
                              //       ),
                              //     ),
                              //     hintText: dropDownVal,
                              //   ),
                              // ),
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
                                'Expiry Date',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 10.h,
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
                                          setState(() {});
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
                          height: MediaQuery.of(context).size.height * .020,
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
                            print(date);
                            if (formKey.currentState!.validate()) {
                              if (images.isEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
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
                                            child:
                                                new CircularProgressIndicator(
                                      color: Color(0xfffaeaea),
                                    )));
                                  },
                                );
                                var data = await DocumentController().AddP45(
                                    expiry: date,
                                    type: dropDownVal,
                                    images: images);
                                prefs = await SharedPreferences.getInstance();

                                prefs.setString("p45p60Status", "Uploaded");
                                // passportStatus = "Uploaded";

                                // dbsCertificateStatus = "Uploaded";
                                setState(() {});
                                // setState(() {
                                //   p45p60Status = "Uploaded";
                                // });
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => DocumentsUpload()));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
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
                                            images.isNotEmpty
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            )),
      ),
    );
  }
}
