import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/DocumentController.dart';
import '../Model/right_to_work_model.dart';

class RightToWork extends StatefulWidget {
  const RightToWork({Key? key}) : super(key: key);

  @override
  State<RightToWork> createState() => _RightToWorkState();
}

class _RightToWorkState extends State<RightToWork> {
  RightToWorkModel? _rightToWorkModel;

  @override
  void initState() {
    getRightToWork();
    super.initState();
  }

  Future<void> getRightToWork() async {
    try {
      final user = await DocumentController().RightToWorkGet();
      setState(() {
        _rightToWorkModel = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  String dropDownVal = 'British Residence Permit';
  var dropDownItems = [
    'British Residence Permit',
    'Driving License',
  ];

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey<FormState> formKey = GlobalKey();
  List<File> images = [];
  dynamic date = '2023';
  var number;
  late SharedPreferences prefs;
  var month1 = 'September';
  var day1 = '1';
  var year1 = '2023';
  // List<DropdownMenuItem<String>> get dropdownItems {
  //   List<DropdownMenuItem<String>> menuItems = [
  //     DropdownMenuItem(child: Text("01"), value: "01"),
  //     DropdownMenuItem(child: Text("02"), value: "02"),
  //     DropdownMenuItem(child: Text("03"), value: "03"),
  //     DropdownMenuItem(child: Text("04"), value: "04"),
  //     DropdownMenuItem(child: Text("05"), value: "05"),
  //     DropdownMenuItem(child: Text("06"), value: "06"),
  //     DropdownMenuItem(child: Text("07"), value: "07"),
  //     DropdownMenuItem(child: Text("08"), value: "08"),
  //     DropdownMenuItem(child: Text("09"), value: "09"),
  //     DropdownMenuItem(child: Text("10"), value: "10"),
  //     DropdownMenuItem(child: Text("11"), value: "11"),
  //     DropdownMenuItem(child: Text("12"), value: "12"),
  //     DropdownMenuItem(child: Text("13"), value: "13"),
  //     DropdownMenuItem(child: Text("14"), value: "14"),
  //     DropdownMenuItem(child: Text("15"), value: "15"),
  //     DropdownMenuItem(child: Text("16"), value: "16"),
  //     DropdownMenuItem(child: Text("17"), value: "17"),
  //     DropdownMenuItem(child: Text("18"), value: "18"),
  //     DropdownMenuItem(child: Text("19"), value: "19"),
  //     DropdownMenuItem(child: Text("20"), value: "20"),
  //     DropdownMenuItem(child: Text("21"), value: "21"),
  //     DropdownMenuItem(child: Text("22"), value: "22"),
  //     DropdownMenuItem(child: Text("23"), value: "23"),
  //     DropdownMenuItem(child: Text("24"), value: "24"),
  //     DropdownMenuItem(child: Text("25"), value: "25"),
  //     DropdownMenuItem(child: Text("26"), value: "26"),
  //     DropdownMenuItem(child: Text("27"), value: "27"),
  //     DropdownMenuItem(child: Text("28"), value: "28"),
  //     DropdownMenuItem(child: Text("29"), value: "29"),
  //     DropdownMenuItem(child: Text("30"), value: "30"),
  //     DropdownMenuItem(child: Text("31"), value: "31"),
  //   ];
  //   return menuItems;
  // }

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
          'Right to Work',
          style: TextStyle(
              fontSize: 19.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade50,
          padding: const EdgeInsets.all(17),
          child: Form(
              key: formKey,
              child: FutureBuilder(
                future: DocumentController().RightToWorkGet(),
                builder: (context, snapshot) {
                  Data? model;
                  if (snapshot.data?.message == "Record Founded") {
                    return Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Right to Work Type',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              DropdownButtonFormField(
                                icon: const Icon(Icons.keyboard_arrow_down),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Choose*",
                                  fillColor: const Color(0xffF3F3F4),
                                ),
                                value: dropDownVal,
                                onChanged: (Value) {
                                  setState(() {
                                    dropDownVal = Value.toString();
                                  });
                                },
                                items: dropDownItems
                                    .map((v) => DropdownMenuItem(
                                        value: v, child: Text(v)))
                                    .toList(),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                dropDownVal == 'British Residence Permit'
                                    ? 'British Residence Permit'
                                    : 'Driving License',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                onChanged: (val) {
                                  number = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please fill out this field';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  hintStyle: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                    color: const Color(0xffACA9A9),
                                  ),
                                  fillColor: const Color(0xffF3F3F4),
                                  filled: true,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  hintText:
                                      dropDownVal == 'British Residence Permit'
                                          ? 'Enter BRP number'
                                          : 'Enter Driving License',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Expiry Date',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              //// old method
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
                                                  value: '${index + 1}',
                                                  child: Text('${index + 1}'),
                                                )),
                                        onChanged: (String? value) {
                                          day1 = value!;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                          hintStyle: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            color: const Color(0xffACA9A9),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
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
                                                  value: e,
                                                  child: Text(e),
                                                ))
                                            .toList(),
                                        onChanged: (String? value) {
                                          month1 = value!;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                          hintStyle: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            color: const Color(0xffACA9A9),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
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
                                                  value:
                                                      '${DateTime.now().year + 10 - index}',
                                                  child: Text(
                                                      '${DateTime.now().year + 10 - index}'),
                                                )),
                                        onChanged: (String? value) {
                                          year1 = value!;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                          hintStyle: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            color: const Color(0xffACA9A9),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
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

                              /// end
                              ///
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //       top: 10.h, left: 20.w, right: 20.w),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Container(
                              //         height: 50.h,
                              //         width: 90.w,
                              //         child: DropdownButtonFormField<String>(
                              //           value: day1,
                              //           items: dropdownItems,
                              //           // List.generate(
                              //           //     31,
                              //           //     (index) =>
                              //           // DropdownMenuItem(
                              //           //           child: Text('${index + 1}'),
                              //           //           value: '${index + 1}',
                              //           //         )),

                              //           onChanged: (String? value) {
                              //             day1 = value!;
                              //           },
                              //           decoration: InputDecoration(
                              //             contentPadding: EdgeInsets.symmetric(
                              //                 vertical: 5, horizontal: 5),
                              //             hintStyle: GoogleFonts.dmSans(
                              //               fontWeight: FontWeight.w500,
                              //               fontSize: 15.sp,
                              //               color: Color(0xffACA9A9),
                              //             ),
                              //             fillColor: Colors.grey.shade200,
                              //             filled: true,
                              //             border: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             enabledBorder: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             focusedBorder: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //       SizedBox(width: 10.w),
                              //       Container(
                              //         height: 50.h,
                              //         width: 140.w,
                              //         decoration: BoxDecoration(
                              //           color: Colors.grey.shade200,
                              //           borderRadius: BorderRadius.circular(5),
                              //         ),
                              //         child: DropdownButtonFormField<String>(
                              //           value: month1,
                              //           items: [
                              //             'January',
                              //             'February',
                              //             'March',
                              //             'April',
                              //             'May',
                              //             'June',
                              //             'July',
                              //             'August',
                              //             'September',
                              //             'October',
                              //             'November',
                              //             'December'
                              //           ]
                              //               .map((e) => DropdownMenuItem(
                              //                     child: Text('${e}'),
                              //                     value: e,
                              //                   ))
                              //               .toList(),
                              //           onChanged: (String? value) {
                              //             month1 = value!;
                              //           },
                              //           decoration: InputDecoration(
                              //             contentPadding: EdgeInsets.symmetric(
                              //                 vertical: 5, horizontal: 5),
                              //             hintStyle: GoogleFonts.dmSans(
                              //               fontWeight: FontWeight.w500,
                              //               fontSize: 15.sp,
                              //               color: Color(0xffACA9A9),
                              //             ),
                              //             fillColor: Colors.grey.shade200,
                              //             filled: true,
                              //             border: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             enabledBorder: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             focusedBorder: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //       SizedBox(width: 10.w),
                              //       Container(
                              //         height: 50.h,
                              //         width: 100.w,
                              //         decoration: BoxDecoration(
                              //           color: Colors.grey.shade200,
                              //           borderRadius: BorderRadius.circular(5),
                              //         ),
                              //         child: DropdownButtonFormField<String>(
                              //           value: year1,
                              //           items: List.generate(
                              //               DateTime.now().year,
                              //               (index) => DropdownMenuItem(
                              //                     child: Text(
                              //                         '${DateTime.now().year - index}'),
                              //                     value:
                              //                         '${DateTime.now().year - index}',
                              //                   )),
                              //           onChanged: (String? value) {
                              //             year1 = value!;
                              //           },
                              //           decoration: InputDecoration(
                              //             contentPadding: EdgeInsets.symmetric(
                              //                 vertical: 5, horizontal: 5),
                              //             hintStyle: GoogleFonts.dmSans(
                              //               fontWeight: FontWeight.w500,
                              //               fontSize: 15.sp,
                              //               color: Color(0xffACA9A9),
                              //             ),
                              //             fillColor: Colors.grey.shade200,
                              //             filled: true,
                              //             border: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             enabledBorder: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //             focusedBorder: OutlineInputBorder(
                              //               borderSide: BorderSide.none,
                              //               borderRadius: BorderRadius.all(
                              //                 Radius.circular(8),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Column(
                            children: List.generate(images.length, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
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
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Tap to upload multiple photos',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp),
                                    ),
                                    const SizedBox(
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
                        _rightToWorkModel != null
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
                                                "BRP Number: " +
                                                    _rightToWorkModel!
                                                        .data!
                                                        .first
                                                        .britishResidencePermit
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
                                                    _rightToWorkModel!
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
                                              child: _rightToWorkModel != null
                                                  ? Center(
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            _rightToWorkModel!
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
                            date = {"$day1 - $month1 - $year1"};
                            print(date);
                            if (formKey.currentState!.validate()) {
                              if (images.isEmpty) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
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
                                            child: CircularProgressIndicator(
                                      color: const Color(0xfffaeaea),
                                    )));
                                  },
                                );
                                var data = await DocumentController().Addwork(
                                    type: dropDownVal,
                                    expiry: date,
                                    number: number,
                                    images: images);
                                prefs = await SharedPreferences.getInstance();

                                prefs.setString(
                                    "rightToWorkStatus", "Uploaded");
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
                                  style: const TextStyle(color: Colors.white),
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
                                      number != null &&
                                      images.isNotEmpty
                                  ? Colors.pink
                                  : const Color(0xfffaeaea),
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
                                          number != null &&
                                          images.isNotEmpty
                                      ? Colors.white
                                      : Colors.black,
                                ),
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
                                'Right to Work Type',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              DropdownButtonFormField(
                                icon: const Icon(Icons.keyboard_arrow_down),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  hintStyle: TextStyle(color: Colors.grey[800]),
                                  hintText: "Choose*",
                                  fillColor: const Color(0xffF3F3F4),
                                ),
                                value: dropDownVal,
                                onChanged: (Value) {
                                  setState(() {
                                    dropDownVal = Value.toString();
                                  });
                                },
                                items: dropDownItems
                                    .map((v) => DropdownMenuItem(
                                        value: v, child: Text(v)))
                                    .toList(),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                dropDownVal == 'British Residence Permit'
                                    ? 'British Residence Permit'
                                    : 'Driving License',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 6),
                              TextFormField(
                                onChanged: (val) {
                                  number = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please fill out this field';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(18),
                                  hintStyle: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                    color: const Color(0xffACA9A9),
                                  ),
                                  fillColor: const Color(0xffF3F3F4),
                                  filled: true,
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  hintText:
                                      dropDownVal == 'British Residence Permit'
                                          ? 'Enter BRP number'
                                          : 'Enter Driving License',
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Expiry Date',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
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
                                                  value: '${index + 1}',
                                                  child: Text('${index + 1}'),
                                                )),
                                        onChanged: (String? value) {
                                          day1 = value!;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                          hintStyle: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            color: const Color(0xffACA9A9),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
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
                                                  value: e,
                                                  child: Text(e),
                                                ))
                                            .toList(),
                                        onChanged: (String? value) {
                                          month1 = value!;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                          hintStyle: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            color: const Color(0xffACA9A9),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
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
                                                  value:
                                                      '${DateTime.now().year + 10 - index}',
                                                  child: Text(
                                                      '${DateTime.now().year + 10 - index}'),
                                                )),
                                        onChanged: (String? value) {
                                          year1 = value!;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                          hintStyle: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15.sp,
                                            color: const Color(0xffACA9A9),
                                          ),
                                          fillColor: Colors.grey.shade200,
                                          filled: true,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
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
                            margin: const EdgeInsets.symmetric(vertical: 5),
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
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Tap to upload multiple photos',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp),
                                    ),
                                    const SizedBox(
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
                                    .showSnackBar(const SnackBar(
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
                                            child: CircularProgressIndicator(
                                      color: const Color(0xfffaeaea),
                                    )));
                                  },
                                );
                                var data = await DocumentController().Addwork(
                                    type: dropDownVal,
                                    expiry: date,
                                    number: number,
                                    images: images);
                                prefs = await SharedPreferences.getInstance();

                                prefs.setString(
                                    "rightToWorkStatus", "Uploaded");
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
                                  style: const TextStyle(color: Colors.white),
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
                                      number != null &&
                                      images.isNotEmpty
                                  ? Colors.pink
                                  : const Color(0xfffaeaea),
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
                                          number != null &&
                                          images.isNotEmpty
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              )),
        ),
      ),
    );
  }
}
