import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/DocumentController.dart';
import '../Model/address_proof_model.dart';

class ProofAddress extends StatefulWidget {
  const ProofAddress({Key? key}) : super(key: key);

  @override
  State<ProofAddress> createState() => _ProofAddressState();
}

class _ProofAddressState extends State<ProofAddress> {
  ProofOfAddressModel? _proofOfAddress;
  @override
  void initState() {
    super.initState();
    proofOfAddressFromAPI();
  }

  Future<void> proofOfAddressFromAPI() async {
    try {
      final user = await DocumentController().ProofOfAddress();
      setState(() {
        _proofOfAddress = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  String dropDownVal = 'Utility Bill';
  var dropDownItems = [
    'Utility Bill',
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
          'Proof of Address',
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
          child: FutureBuilder(
            future: DocumentController().ProofOfAddress(),
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
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                    _proofOfAddress != null
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
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Type: " +
                                                _proofOfAddress!
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 150,
                                          color: Colors.transparent,
                                          child: _proofOfAddress != null
                                              ? Center(
                                                  child: CachedNetworkImage(
                                                    imageUrl: _proofOfAddress!
                                                        .data!
                                                        .first
                                                        .documentImages!
                                                        .first
                                                        .upload
                                                        .toString(),
                                                    placeholder: (context,
                                                            url) =>
                                                        CircularProgressIndicator(),
                                                    errorWidget:
                                                        (context, url, error) =>
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
                    //
                    InkWell(
                      onTap: () async {
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
                          var data =
                              await DocumentController().AddProofOfAddress(
                            images: images,
                            type: dropDownVal,
                          );
                          prefs = await SharedPreferences.getInstance();

                          prefs.setString("proofaddressStatus", "Uploaded");
                          // passportStatus = "Uploaded";

                          // dbsCertificateStatus = "Uploaded";
                          setState(() {});
                          // setState(() {
                          //   proofaddressStatus = "Uploaded";
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
                      },
                      child: Container(
                        height: 60.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: images.isNotEmpty
                              ? Colors.pink
                              : Color(0xfffaeaea),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Upload',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: images.isNotEmpty
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
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
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
                                  'Tap to upload a photos',
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
                          var data =
                              await DocumentController().AddProofOfAddress(
                            images: images,
                            type: dropDownVal,
                          );
                          prefs = await SharedPreferences.getInstance();

                          prefs.setString("proofaddressStatus", "Uploaded");
                          // passportStatus = "Uploaded";

                          // dbsCertificateStatus = "Uploaded";
                          setState(() {});
                          // setState(() {
                          //   proofaddressStatus = "Uploaded";
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
                      },
                      child: Container(
                        height: 60.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: images.isNotEmpty
                              ? Colors.pink
                              : Color(0xfffaeaea),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Upload',
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: images.isNotEmpty
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
        ),
      ),
    );
  }
}
