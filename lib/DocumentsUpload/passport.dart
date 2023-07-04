// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pixel_app/Application_Form/Controller/ApplicationFormController.dart';
// import 'package:pixel_app/Application_Form/Model/ApplicationFormModel.dart';
// import 'package:pixel_app/Controller/DocumentController.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../Application_Form/Model/passport_model.dart';

// class Passport extends StatefulWidget {
//   const Passport({Key? key}) : super(key: key);

//   @override
//   State<Passport> createState() => _PassportState();
// }

// class _PassportState extends State<Passport> {
//   loadImage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       myImagePath = prefs.getString("avtar");
//     });
//   }

//   GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
//   GlobalKey<FormState> formKey = new GlobalKey();
//   List<File> images = [];
//   String? myImagePath;
//   var date;
//   late SharedPreferences prefs;
//   var passportNo;
//   @override
//   void initState() {
//     loadImage();
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     var month1 = 'September';
//     var day1 = '1';
//     var year1 = '2022';
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Navigator.of(context).pop();
//             // Navigator.pushReplacement(context,
//             //     MaterialPageRoute(builder: (context) => DocumentsUpload()));
//           },
//           child: const Icon(
//             Icons.arrow_back_ios_new_rounded,
//             color: Colors.grey,
//           ),
//         ),
//         centerTitle: false,
//         backgroundColor: Colors.grey.shade100,
//         elevation: 0,
//         title: Text(
//           'Passport',
//           style: TextStyle(
//               fontSize: 18.sp,
//               color: Colors.black,
//               fontWeight: FontWeight.w700),
//         ),
//       ),

//       // appBar: AppBar(
//       //   leading: InkWell(
//       //     onTap: () {
//       //       Navigator.pushReplacement(context,
//       //           MaterialPageRoute(builder: (context) => DocumentsUpload()));
//       //     },
//       //     child: Icon(
//       //       Icons.arrow_back_ios_new_rounded,
//       //       color: Colors.grey,
//       //       size: 20.sp,
//       //     ),
//       //   ),
//       //   centerTitle: false,
//       //   backgroundColor: Colors.grey.shade50,
//       //   elevation: 0,
//       //   title: Text(
//       //     'Passport',
//       //     style: TextStyle(
//       //         fontSize: 19.sp,
//       //         color: Colors.black,
//       //         fontWeight: FontWeight.w700),
//       //   ),
//       // ),

//       body: SingleChildScrollView(
//         child: Container(
//             color: Colors.grey.shade50,
//             padding: const EdgeInsets.all(17),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Passport Number',
//                           style: TextStyle(
//                               fontSize: 16.sp, fontWeight: FontWeight.w600),
//                         ),
//                         const SizedBox(
//                           height: 6,
//                         ),
//                         TextFormField(
//                           onChanged: (val) {
//                             passportNo = val;
//                           },
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please fill out this field';
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             contentPadding: const EdgeInsets.all(18),
//                             hintStyle: GoogleFonts.dmSans(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 15.sp,
//                               color: const Color(0xffACA9A9),
//                             ),
//                             fillColor: Colors.grey.shade200,
//                             filled: true,
//                             border: const OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             enabledBorder: const OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(8),
//                               ),
//                             ),
//                             hintText: 'Enter passport number',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Expiry Date',
//                           style: TextStyle(
//                               fontSize: 16.sp, fontWeight: FontWeight.w600),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(top: 10.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 height: 50.h,
//                                 width: 90.w,
//                                 child: DropdownButtonFormField<String>(
//                                   value: day1,
//                                   items: List.generate(
//                                       31,
//                                       (index) => DropdownMenuItem(
//                                             value: '${index + 1}',
//                                             child: Text('${index + 1}'),
//                                           )),
//                                   onChanged: (String? value) {
//                                     day1 = value!;
//                                   },
//                                   decoration: InputDecoration(
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 5, horizontal: 5),
//                                     hintStyle: GoogleFonts.dmSans(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 15.sp,
//                                       color: const Color(0xffACA9A9),
//                                     ),
//                                     fillColor: Colors.grey.shade200,
//                                     filled: true,
//                                     border: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                     ),
//                                     enabledBorder: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                     ),
//                                     focusedBorder: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 10.w),
//                               Container(
//                                 height: 50.h,
//                                 width: 140.w,
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey.shade200,
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: DropdownButtonFormField<String>(
//                                   value: month1,
//                                   items: [
//                                     'January',
//                                     'February',
//                                     'March',
//                                     'April',
//                                     'May',
//                                     'June',
//                                     'July',
//                                     'August',
//                                     'September',
//                                     'October',
//                                     'November',
//                                     'December'
//                                   ]
//                                       .map((e) => DropdownMenuItem(
//                                             value: e,
//                                             child: Text('${e}'),
//                                           ))
//                                       .toList(),
//                                   onChanged: (String? value) {
//                                     month1 = value!;
//                                   },
//                                   decoration: InputDecoration(
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 5, horizontal: 5),
//                                     hintStyle: GoogleFonts.dmSans(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 15.sp,
//                                       color: const Color(0xffACA9A9),
//                                     ),
//                                     fillColor: Colors.grey.shade200,
//                                     filled: true,
//                                     border: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                     ),
//                                     enabledBorder: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                     ),
//                                     focusedBorder: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 10.w),
//                               Container(
//                                 height: 50.h,
//                                 width: 100.w,
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey.shade200,
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 child: DropdownButtonFormField<String>(
//                                   value: year1,
//                                   items: List.generate(
//                                       DateTime.now().year + 10,
//                                       (index) => DropdownMenuItem(
//                                             value:
//                                                 '${DateTime.now().year + 10 - index}',
//                                             child: Text(
//                                                 '${DateTime.now().year + 10 - index}'),
//                                           )),
//                                   onChanged: (String? value) {
//                                     year1 = value!;
//                                   },
//                                   decoration: InputDecoration(
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 5, horizontal: 5),
//                                     hintStyle: GoogleFonts.dmSans(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 15.sp,
//                                       color: const Color(0xffACA9A9),
//                                     ),
//                                     fillColor: Colors.grey.shade200,
//                                     filled: true,
//                                     border: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                     ),
//                                     enabledBorder: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                     ),
//                                     focusedBorder: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(8),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.h,
//                   ),
//                   Column(
//                     children: List.generate(
//                       images.length,
//                       (index) {
//                         return Container(
//                           margin: const EdgeInsets.symmetric(vertical: 5),
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * .2,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: FileImage(
//                                 images.elementAt(index),
//                               ),
//                             ),
//                           ),
//                           child: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 images.removeAt(index);
//                               });
//                             },
//                             icon: const Icon(
//                               Icons.delete,
//                               size: 30,
//                               color: Colors.white,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   // ElevatedButton(
//                   //     onPressed: () {
//                   //       print(images.elementAt(0));
//                   //     },
//                   //     child: Text('Testing')),
//                   Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: FileImage(
//                           File(
//                               '/data/user/0/com.stackbuffers.pixelstaffapp/cache/file_picker/IMG_20230312_195550.jpg'),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   InkWell(
//                     onTap: () async {
//                       FilePickerResult? result =
//                           await FilePicker.platform.pickFiles(
//                         allowMultiple: true,
//                         type: FileType.image,
//                       );
//                       if (result != null) {
//                         for (var element in result.files) {
//                           File file = File(element.path!);
//                           setState(() {
//                             images.add(file);
//                           });
//                         }
//                       } else {
//                         // User canceled the picker
//                       }
//                     },
//                     child: DottedBorder(
//                       color: Colors.black,
//                       strokeWidth: 1,
//                       dashPattern: const [10, 10],
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height * .3,
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.file_present_rounded,
//                                 color: Colors.grey,
//                                 size: 70.sp,
//                               ),
//                               // SvgPicture.asset(
//                               //   'assets/images/multiplephotosicon.svg',
//                               //   color: Colors.black,
//                               //   height: 80.h,
//                               //   width: 80.w,
//                               // ),
//                               const SizedBox(height: 15),
//                               Text(
//                                 'Tap to upload multiple photos',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15.sp),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 'File should be .jpg and less than 10 MB',
//                                 style: TextStyle(
//                                     fontSize: 15.sp, color: Colors.grey),
//                               ),
//                               //Text("data")
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: MediaQuery.of(context).size.height * .2,
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                   //     child: GridView.builder(
//                   //       gridDelegate:
//                   //           const SliverGridDelegateWithFixedCrossAxisCount(
//                   //         crossAxisCount: 2,
//                   //       ),
//                   //       itemCount: images.length,
//                   //       itemBuilder: (BuildContext context, int index) {
//                   //         return Container(
//                   //           width: double.infinity,
//                   //           decoration: BoxDecoration(
//                   //             color: Colors.red,
//                   //           ),
//                   //           child: Container(
//                   //             decoration: BoxDecoration(
//                   //                 image: DecorationImage(
//                   //                     image: FileImage(images.first))),
//                   //           ),
//                   //         );
//                   //       },
//                   //     ),
//                   //   ),
//                   // ),,

//                   FutureBuilder(
//                     future: DocumentController().GetPassport(),
//                     builder: (context, AsyncSnapshot snapshot) {
//                       return Column(
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             child: Card(
//                               color: Colors.amber,
//                               child: Text(snapshot.data!.isBlank),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * .2,
//                   ),
//                   InkWell(
//                     onTap: () async {
//                       if (month1 == 'January') {
//                         month1 = '01';
//                       } else if (month1 == 'February') {
//                         month1 = '02';
//                       } else if (month1 == 'March') {
//                         month1 = '03';
//                       } else if (month1 == 'April') {
//                         month1 = '04';
//                       } else if (month1 == 'May') {
//                         month1 = '05';
//                       } else if (month1 == 'June') {
//                         month1 = '06';
//                       } else if (month1 == 'July') {
//                         month1 = '07';
//                       } else if (month1 == 'August') {
//                         month1 = '08';
//                       } else if (month1 == 'September') {
//                         month1 = '09';
//                       } else if (month1 == 'October') {
//                         month1 = '10';
//                       } else if (month1 == 'November') {
//                         month1 = '11';
//                       } else if (month1 == 'December') {
//                         month1 = '12';
//                       }
//                       if (int.parse(day1) < 10) {
//                         day1 = "0$day1";
//                       }
//                       date = year1 + '-' + month1 + '-' + day1;

//                       if (formKey.currentState!.validate()) {
//                         if (images.isEmpty) {
//                           ScaffoldMessenger.of(context)
//                               .showSnackBar(const SnackBar(
//                                   content: Text(
//                             'Please input images',
//                             style: TextStyle(color: Colors.white),
//                           )));
//                         } else {
//                           showDialog(
//                             context: context,
//                             barrierDismissible: false,
//                             builder: (BuildContext context) {
//                               return Container(
//                                   child: const Center(
//                                       child: CircularProgressIndicator(
//                                 color: Color(0xfffaeaea),
//                               )));
//                             },
//                           );
//                           var data = await DocumentController().AddPassport(
//                               expiry: date,
//                               passportNumber: passportNo,
//                               images: images);
//                           prefs = await SharedPreferences.getInstance();

//                           prefs.setString("passportStatus", "Uploaded");

//                           // passportStatus = "Uploaded";

//                           Navigator.of(context).pop();
//                           Navigator.of(context).pop();
//                           // Navigator.pushReplacement(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => DocumentsUpload()));
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                 '$data',
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           );
//                         }
//                       }
//                     },
//                     child: Container(
//                       height: 60.h,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         color: year1 != "" &&
//                                 month1 != "" &&
//                                 day1 != "" &&
//                                 passportNo != null &&
//                                 images.isNotEmpty
//                             ? Colors.pink
//                             : const Color(0xfffaeaea),
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Upload',
//                           style: TextStyle(
//                             fontSize: 18.sp,
//                             color: year1 != "" &&
//                                     month1 != "" &&
//                                     day1 != "" &&
//                                     passportNo != null &&
//                                     images.isNotEmpty
//                                 ? Colors.white
//                                 : Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixel_app/Controller/DocumentController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Application_Form/Model/passport_model.dart';

class Passport extends StatefulWidget {
  const Passport({Key? key}) : super(key: key);

  @override
  State<Passport> createState() => _PassportState();
}

class _PassportState extends State<Passport> {
  ApiGetPassport? _apiGetPassport;
  @override
  void initState() {
    getPassportDataFromAPI();
    super.initState();
  }

  Future getPassportDataFromAPI() async {
    try {
      final user = await DocumentController().GetPassport();
      // print("*************${user.data!.first.id}");
      setState(() {
        _apiGetPassport = user;
      });
    } catch (e) {
      // Handle error
    }

    // return ApiGetPassport.fromJson(user)
  }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey();
  List<File> images = [];
  List<String> base64Images = [];

  var date;
  late SharedPreferences prefs;
  var passportNo;

  Future<void> getimages() async {
    try {
      final user = await DocumentController().GetPassport();

      setState(() {
        _apiGetPassport = user;
      });
    } catch (e) {
      // Handle error
      //
    }
  }

  final ImagePicker imagePicker = ImagePicker();
  String imagePath = '';
  String base64String = '';
  getImages() async {
    try {
      var pickImage = await imagePicker.pickImage(source: ImageSource.gallery);
      if (pickImage != null) {
        imagePath = pickImage.path;
        print(imagePath);

        File imageFiles = File(imagePath);

        Uint8List imageByte = await imageFiles.readAsBytes();
        print(imageByte);
        base64String = base64.encode(imageByte);
        print(base64String);
      } else {
        print("no image");
      }
    } catch (e) {
      print("no image");
    }
  }

  var month1 = 'September';
  var day1 = '1';
  var year1 = '2022';
  @override
  Widget build(BuildContext context) {
    // _apiGetPassport != null
    //     ? print(_apiGetPassport!.data!.first.id)
    //     : print("Null value");

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => DocumentsUpload()));
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Text(
          'Passport',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),

      // appBar: AppBar(
      //   leading: InkWell(
      //     onTap: () {
      //       Navigator.pushReplacement(context,
      //           MaterialPageRoute(builder: (context) => DocumentsUpload()));
      //     },
      //     child: Icon(
      //       Icons.arrow_back_ios_new_rounded,
      //       color: Colors.grey,
      //       size: 20.sp,
      //     ),
      //   ),
      //   centerTitle: false,
      //   backgroundColor: Colors.grey.shade50,
      //   elevation: 0,
      //   title: Text(
      //     'Passport',
      //     style: TextStyle(
      //         fontSize: 19.sp,
      //         color: Colors.black,
      //         fontWeight: FontWeight.w700),
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Container(
            color: Colors.grey.shade50,
            padding: const EdgeInsets.all(17),
            child: Form(
              key: formKey,
              child: FutureBuilder(
                future: DocumentController().GetPassport(),
                //    initialData: InitialData,
                builder: (context, snapshot) {
                  if (snapshot.data?.message == "Record Founded") {
                    return Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Passport Number',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              TextFormField(
                                onChanged: (val) {
                                  passportNo = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please fill out this field';
                                  }
                                },
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(18),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w600,
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
                                    hintText: _apiGetPassport != null
                                        ? _apiGetPassport!
                                            .data!.first.passportNumber
                                        : "Enter Passport Number"),
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
                                'Expiry Date',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
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
                                                  child: Text('${e}'),
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
                          children: List.generate(
                            images.length,
                            (index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                      images.elementAt(index),
                                    ),
                                  ),
                                ),
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
                            },
                          ),
                        ),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       print(images.elementAt(0));
                        //     },
                        //     child: Text('Testing')),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                File(
                                    '/data/user/0/com.stackbuffers.pixelstaffapp/cache/file_picker/IMG_20230312_195550.jpg'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          // onTap: () {
                          //   getImages();
                          // },
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              allowMultiple: true,
                              type: FileType.image,
                            );

                            if (result != null) {
                              for (var element in result.files) {
                                File file = File(element.path!);
                                Uint8List imageFiles = await file.readAsBytes();
                                base64String = base64.encode(imageFiles);
                                setState(() {
                                  images.add(file);
                                });
                              }
                              // for (var image in images) {
                              //   List<int> imageBytes = await image.readAsBytes();
                              //   String base64Image = base64Encode(imageBytes);
                              //   base64Images.add(base64Image);
                              // }
                              //print("********${base64Images}********");
                            } else {
                              // User canceled the picker
                            }
                          },
                          child: DottedBorder(
                            color: Colors.black,
                            strokeWidth: 1,
                            dashPattern: const [10, 10],
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
                                    const SizedBox(height: 15),
                                    Text(
                                      'Tap to upload multiple photos',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp),
                                    ),
                                    const SizedBox(height: 5),
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
                          height: MediaQuery.of(context).size.height * .040,
                        ),
                        // Container(
                        //   // height: 60,
                        //   // width: 60,
                        //   color: Colors.amber,
                        //   // child: Image.memory(
                        //   //   base64Decode(base64Images.first),
                        //   //   fit: BoxFit.cover,
                        //   // ),
                        // ),
                        _apiGetPassport != null
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
                                                "Passport Number: " +
                                                    _apiGetPassport!.data!.first
                                                        .passportNumber
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
                                                    _apiGetPassport!
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
                                              child: _apiGetPassport != null
                                                  ? Center(
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            _apiGetPassport!
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

                        // Container(
                        //   width: 200,
                        //   height: 200,
                        //   color: Colors.transparent,
                        //   child: Image.network(
                        //     _apiGetPassport != null
                        //         ? _apiGetPassport!
                        //             .data!.first.documentImages!.first.upload
                        //             .toString()
                        //         : CircularProgressIndicator().toString(),
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
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
                                        child: const Center(
                                            child: CircularProgressIndicator(
                                      color: Color(0xfffaeaea),
                                    )));
                                  },
                                );
                                var data = await DocumentController()
                                    .AddPassport(
                                        expiry: date,
                                        passportNumber: passportNo,
                                        images: images);
                                prefs = await SharedPreferences.getInstance();

                                prefs.setString("passportStatus", "Uploaded");
                                // passportStatus = "Uploaded";

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
                                      passportNo != null &&
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
                                          passportNo != null &&
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
                                'Passport Number',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              TextFormField(
                                onChanged: (val) {
                                  passportNo = val;
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please fill out this field';
                                  }
                                },
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(18),
                                    hintStyle: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w600,
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
                                    hintText: "Enter Passport Number"),
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
                                'Expiry Date',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
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
                                                  child: Text('${e}'),
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
                          children: List.generate(
                            images.length,
                            (index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                      images.elementAt(index),
                                    ),
                                  ),
                                ),
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
                            },
                          ),
                        ),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       print(images.elementAt(0));
                        //     },
                        //     child: Text('Testing')),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                File(
                                    '/data/user/0/com.stackbuffers.pixelstaffapp/cache/file_picker/IMG_20230312_195550.jpg'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          // onTap: () {
                          //   getImages();
                          // },
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              allowMultiple: true,
                              type: FileType.image,
                            );

                            if (result != null) {
                              for (var element in result.files) {
                                File file = File(element.path!);
                                Uint8List imageFiles = await file.readAsBytes();
                                base64String = base64.encode(imageFiles);
                                setState(() {
                                  images.add(file);
                                });
                              }
                              // for (var image in images) {
                              //   List<int> imageBytes = await image.readAsBytes();
                              //   String base64Image = base64Encode(imageBytes);
                              //   base64Images.add(base64Image);
                              // }
                              //print("********${base64Images}********");
                            } else {
                              // User canceled the picker
                            }
                          },
                          child: DottedBorder(
                            color: Colors.black,
                            strokeWidth: 1,
                            dashPattern: const [10, 10],
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
                                    const SizedBox(height: 15),
                                    Text(
                                      'Tap to upload multiple photos',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp),
                                    ),
                                    const SizedBox(height: 5),
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
                          height: MediaQuery.of(context).size.height * .040,
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
                                        child: const Center(
                                            child: CircularProgressIndicator(
                                      color: Color(0xfffaeaea),
                                    )));
                                  },
                                );
                                var data = await DocumentController()
                                    .AddPassport(
                                        expiry: date,
                                        passportNumber: passportNo,
                                        images: images);
                                prefs = await SharedPreferences.getInstance();

                                prefs.setString("passportStatus", "Uploaded");
                                // passportStatus = "Uploaded";

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
                                      passportNo != null &&
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
                                          passportNo != null &&
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
              ),
            )),
      ),
    );
  }
}
