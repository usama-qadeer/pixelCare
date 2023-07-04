import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_app/Controller/AuthController.dart';
import 'package:pixel_app/Model/NmcModel.dart';
import 'package:pixel_app/Model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NMCDetails extends StatefulWidget {
  const NMCDetails({Key? key}) : super(key: key);

  @override
  State<NMCDetails> createState() => _NMCDetailsState();
}

class _NMCDetailsState extends State<NMCDetails> {
  Widget MyTextField({
    required InputDecoration decoration,
    required String hinttext,
    Function(String)? onChanged,
    Function()? onEditCom,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: TextFormField(
        onChanged: onChanged,
        onEditingComplete: onEditCom,
        controller: pin,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill out this field';
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(18),
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
          hintText: hinttext,
        ),
      ),
    );
  }

  TextEditingController pin = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey();
  var month = 'September';
  var day = '1';
  var year = '2022';
  @override
  void initState() {
    pin = TextEditingController();
    AuthController().GetNmcApi();
    super.initState();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("01"), value: "01"),
      DropdownMenuItem(child: Text("02"), value: "02"),
      DropdownMenuItem(child: Text("03"), value: "03"),
      DropdownMenuItem(child: Text("04"), value: "04"),
      DropdownMenuItem(child: Text("05"), value: "05"),
      DropdownMenuItem(child: Text("06"), value: "06"),
      DropdownMenuItem(child: Text("07"), value: "07"),
      DropdownMenuItem(child: Text("08"), value: "08"),
      DropdownMenuItem(child: Text("09"), value: "09"),
      DropdownMenuItem(child: Text("10"), value: "10"),
      DropdownMenuItem(child: Text("11"), value: "11"),
      DropdownMenuItem(child: Text("12"), value: "12"),
      DropdownMenuItem(child: Text("13"), value: "13"),
      DropdownMenuItem(child: Text("14"), value: "14"),
      DropdownMenuItem(child: Text("15"), value: "15"),
      DropdownMenuItem(child: Text("16"), value: "16"),
      DropdownMenuItem(child: Text("17"), value: "17"),
      DropdownMenuItem(child: Text("18"), value: "18"),
      DropdownMenuItem(child: Text("19"), value: "19"),
      DropdownMenuItem(child: Text("20"), value: "20"),
      DropdownMenuItem(child: Text("21"), value: "21"),
      DropdownMenuItem(child: Text("22"), value: "22"),
      DropdownMenuItem(child: Text("23"), value: "23"),
      DropdownMenuItem(child: Text("24"), value: "24"),
      DropdownMenuItem(child: Text("25"), value: "25"),
      DropdownMenuItem(child: Text("26"), value: "26"),
      DropdownMenuItem(child: Text("27"), value: "27"),
      DropdownMenuItem(child: Text("28"), value: "28"),
      DropdownMenuItem(child: Text("29"), value: "29"),
      DropdownMenuItem(child: Text("30"), value: "30"),
      DropdownMenuItem(child: Text("31"), value: "31"),
    ];
    return menuItems;
  }

  UserModel _model = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Text(
          'NMC Details',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<NmcModel>(
            future: AuthController().GetNmcUi(),
            builder: (context, snapShot) {
              NmcModel model = new NmcModel();
              if (snapShot.hasData) {
                model = snapShot.data!;
                // pin.text = snapShot.data!.data!.nmcPin.toString();
                print("dddd${model.data?.nmcPin ?? "Value is null"} ");
              }
              return SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   margin: EdgeInsets.only(top: 30.h, left: 10.w),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children: [
                            //       InkWell(
                            //         onTap: () {
                            //           Navigator.pop(context);
                            //         },
                            //         child: Icon(
                            //           Icons.arrow_back_ios_outlined,
                            //           size: 15.sp,
                            //           color: Colors.grey,
                            //         ),
                            //       ),
                            //       SizedBox(width: 5.w),
                            //       Text(
                            //         'NMC Details',
                            //         style: TextStyle(
                            //             fontWeight: FontWeight.w600,
                            //             fontSize: 17.sp),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(height: 10.h),

                            Container(
                              margin: EdgeInsets.only(left: 20.w, top: 15.h),
                              child: Text('NMC Pin',
                                  style: TextStyle(fontSize: 15.sp)),
                            ),
                            MyTextField(
                              onEditCom: () {
                                // print(pin.text);
                                model.data?.nmcPin = pin.text;
                                print("888 ${model.data?.nmcPin}");
                                setState(() {});
                              },
                              onChanged: (value) {
                                model.data?.nmcPin = value;

                                setState(() {});
                              },
                              decoration: InputDecoration(),
                              hinttext:
                                  ' ${snapShot.data?.data!.nmcPin ?? "Loading"}',
                            ),

                            // Container(
                            //   margin: EdgeInsets.only(left: 20.w, top: 15.h),
                            //   child: Text(
                            //     'New Password',
                            //     style: TextStyle(fontSize: 15.sp),
                            //   ),
                            // ),
                            // MyTextField(
                            //   decoration: InputDecoration(),
                            //   hinttext: '.........',
                            // ),
                            Container(
                              margin: EdgeInsets.only(left: 20.w, top: 15.h),
                              child: Text('Expiry Date',
                                  style: TextStyle(fontSize: 15.sp)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 10.h, left: 20.w, right: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 90.w,
                                    child: DropdownButtonFormField<String>(
                                      value: day.isNotEmpty ? day : "1",
                                      items: List.generate(
                                          31,
                                          (index) => DropdownMenuItem(
                                                value: '${index + 1}',
                                                child: Text('${index + 1}'),
                                              )),
                                      onChanged: (String? value) async {
                                        SharedPreferences _prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        _prefs.setString(
                                            "dayNMC", value.toString());
                                        day = value!;
                                        setState(() {});
                                        //  day = value!;
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
                                      value: month,
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
                                        month = value!;
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
                                      value: year,
                                      items: List.generate(
                                          DateTime.now().year + 10,
                                          (index) => DropdownMenuItem(
                                                child: Text(
                                                    '${DateTime.now().year + 10 - index}'),
                                                value:
                                                    '${DateTime.now().year + 10 - index}',
                                              )),
                                      onChanged: (String? value) {
                                        year = value!;
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

                            // Container(
                            //   margin: EdgeInsets.only(left: 20.w, top: 15.h),
                            //   child: Text('Date of Birth',
                            //       style: TextStyle(fontSize: 15.sp)),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       top: 10.h, left: 20.w, right: 20.w),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       // Container(
                            //       //   height: 50.h,
                            //       //   width: 90.w,
                            //       //   child: DropdownButtonFormField<String>(
                            //       //     value: day,
                            //       //     items: dropdownItems,
                            //       //     // List.generate(
                            //       //     //     31,
                            //       //     //     (index) =>
                            //       //     // DropdownMenuItem(
                            //       //     //           child: Text('${index + 1}'),
                            //       //     //           value: '${index + 1}',
                            //       //     //         )),

                            //       //     onChanged: (String? value) {
                            //       //       day = value!;
                            //       //     },
                            //       //     decoration: InputDecoration(
                            //       //       contentPadding: EdgeInsets.symmetric(
                            //       //           vertical: 5, horizontal: 5),
                            //       //       hintStyle: GoogleFonts.dmSans(
                            //       //         fontWeight: FontWeight.w500,
                            //       //         fontSize: 15.sp,
                            //       //         color: Color(0xffACA9A9),
                            //       //       ),
                            //       //       fillColor: Colors.grey.shade200,
                            //       //       filled: true,
                            //       //       border: OutlineInputBorder(
                            //       //         borderSide: BorderSide.none,
                            //       //         borderRadius: BorderRadius.all(
                            //       //           Radius.circular(8),
                            //       //         ),
                            //       //       ),
                            //       //       enabledBorder: OutlineInputBorder(
                            //       //         borderSide: BorderSide.none,
                            //       //         borderRadius: BorderRadius.all(
                            //       //           Radius.circular(8),
                            //       //         ),
                            //       //       ),
                            //       //       focusedBorder: OutlineInputBorder(
                            //       //         borderSide: BorderSide.none,
                            //       //         borderRadius: BorderRadius.all(
                            //       //           Radius.circular(8),
                            //       //         ),
                            //       //       ),
                            //       //     ),
                            //       //   ),
                            //       // ),

                            //       SizedBox(width: 10.w),
                            //       Container(
                            //         height: 50.h,
                            //         width: 140.w,
                            //         decoration: BoxDecoration(
                            //           color: Colors.grey.shade200,
                            //           borderRadius: BorderRadius.circular(5),
                            //         ),
                            //         child: DropdownButtonFormField<String>(
                            //           value: month,
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
                            //             month = value!;
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
                            //           value: year,
                            //           items: List.generate(
                            //               DateTime.now().year,
                            //               (index) => DropdownMenuItem(
                            //                     child: Text(
                            //                         '${DateTime.now().year - index}'),
                            //                     value:
                            //                         '${DateTime.now().year - index}',
                            //                   )),
                            //           onChanged: (String? value) {
                            //             year = value!;
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

                            // MyTextField(
                            //   onChanged: (value){
                            //     model.data?.expiryDate=value;
                            //   },
                            //   decoration: InputDecoration(
                            //   ),
                            //   hinttext: '${model.data?.expiryDate==null?'Enter expiry date':model.data?.expiryDate}',
                            // ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.h, left: 20.w, right: 20.w, bottom: 20.h),
                          child: InkWell(
                            onTap: () async {
                              if (month == 'January') {
                                month = '01';
                              } else if (month == 'February') {
                                month = '02';
                              } else if (month == 'March') {
                                month = '03';
                              } else if (month == 'April') {
                                month = '04';
                              } else if (month == 'May') {
                                month = '05';
                              } else if (month == 'June') {
                                month = '06';
                              } else if (month == 'July') {
                                month = '07';
                              } else if (month == 'August') {
                                month = '08';
                              } else if (month == 'September') {
                                month = '09';
                              } else if (month == 'October') {
                                month = '10';
                              } else if (month == 'November') {
                                month = '11';
                              } else if (month == 'December') {
                                month = '12';
                              }
                              if (formKey.currentState!.validate()) {
                                model.data?.expiryDate =
                                    year + '-' + month + '-' + day;
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
                                var data = await AuthController()
                                    .UpdateNmc(model: model);
                                AuthController().GetNmcApi();
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        content: Text(
                                  '$data',
                                  style: TextStyle(color: Colors.white),
                                )));
                              }
                            },
                            child: Container(
                              height: 60.h,
                              width: 600.w,
                              decoration: BoxDecoration(
                                color: pin.text != ""
                                    ? Colors.pink
                                    : Color(0xfffaeaea),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                      color: pin.text != ""
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
