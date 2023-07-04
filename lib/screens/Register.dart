// // ignore_for_file: use_build_context_synchronously

// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// import '../Controller/AuthController.dart';
// import 'SignUp.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   GlobalKey<FormState> formkey = GlobalKey();
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
//   TextEditingController email = TextEditingController();
//   TextEditingController name = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController confirmpassword = TextEditingController();

//   var agree = false;
//   bool isPasswordHidden = true;
//   bool isConfirmPasswordHidden = true;

//   var locatedYes = false;
//   var locatedNo = false;
//   var eligibleYes = false;
//   var eligibleNo = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       body: SingleChildScrollView(
//         child: Container(
//           child: Form(
//             key: formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(height: 10.h),
//                 Padding(
//                   padding: EdgeInsets.only(top: 40.h),
//                   child: Column(
//                     children: [
//                       Text(
//                         'Create Account',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 26.sp,
//                         ),
//                       ),
//                       SizedBox(height: 5.h),
//                       const Text('Create account and get started'),
//                     ],
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 20.h),
//                       child: Container(
//                         margin: EdgeInsets.only(left: 20.w, top: 20.w),
//                         child: Text(
//                           'Name',
//                           style: TextStyle(fontSize: 16.sp),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         textCapitalization: TextCapitalization.words,
//                         controller: name,
//                         onChanged: (v) {
//                           setState(() {});
//                         },
//                         validator: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'Please fillout this field';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 11,
//                             color: const Color(0xffACA9A9),
//                           ),
//                           fillColor: const Color(0xffEEEEEE),
//                           filled: true,
//                           border: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: 'Enter name',
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 20.w, top: 20.w),
//                       child: Text(
//                         'Email',
//                         style: TextStyle(fontSize: 16.sp),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         controller: email,
//                         onChanged: (v) {
//                           setState(() {});
//                         },
//                         validator: (String? value) {
//                           final bool isValid =
//                               EmailValidator.validate(value.toString());

//                           if (!isValid) {
//                             return 'Invalid Email';
//                           }

//                           if (value!.isEmpty) {
//                             return 'Please fillout this field';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 11,
//                             color: const Color(0xffACA9A9),
//                           ),
//                           fillColor: const Color(0xffEEEEEE),
//                           filled: true,
//                           border: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: 'Enter email',
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 20.w, top: 20.w),
//                       child: Text(
//                         'Password',
//                         style: TextStyle(fontSize: 16.sp),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         controller: password,
//                         obscureText: isPasswordHidden,
//                         obscuringCharacter: "*",
//                         onChanged: (v) {
//                           setState(() {});
//                         },
//                         validator: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'Please fillout this field';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           suffix: InkWell(
//                               onTap: () {
//                                 isPasswordHidden = !isPasswordHidden;
//                                 setState(() {});
//                               },
//                               child: Icon(
//                                 isPasswordHidden
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: const Color(0xffF5591f),
//                               )),
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 11,
//                             color: const Color(0xffACA9A9),
//                           ),
//                           fillColor: const Color(0xffEEEEEE),
//                           filled: true,
//                           border: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: 'Enter password',
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 20.w, top: 20.w),
//                       child: Text(
//                         'Confirm Password',
//                         style: TextStyle(fontSize: 16.sp),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
//                       child: TextFormField(
//                         controller: confirmpassword,
//                         obscureText: isConfirmPasswordHidden,
//                         obscuringCharacter: "*",
//                         onChanged: (v) {
//                           setState(() {});
//                         },
//                         validator: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'Please fillout this field';
//                           } else if (password.text != confirmpassword.text) {
//                             return "password doesn't match";
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           suffix: InkWell(
//                               onTap: () {
//                                 isConfirmPasswordHidden =
//                                     !isConfirmPasswordHidden;
//                                 setState(() {});
//                               },
//                               child: Icon(
//                                 isConfirmPasswordHidden
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                                 color: const Color(0xffF5591f),
//                               )),
//                           hintStyle: GoogleFonts.dmSans(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 11,
//                             color: const Color(0xffACA9A9),
//                           ),
//                           fillColor: const Color(0xffEEEEEE),
//                           filled: true,
//                           border: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           enabledBorder: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           focusedBorder: const OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(8),
//                             ),
//                           ),
//                           hintText: 'Retype Password',
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20.h),
//                     Column(
//                       children: [
//                         const Text('Are you Located in UK ?'),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Checkbox(
//                               value: locatedNo,
//                               onChanged: (value) {
//                                 setState(() {
//                                   locatedNo = value!;
//                                   locatedYes = false;
//                                 });
//                               },
//                               activeColor: Colors.pink,
//                               checkColor: Colors.white,
//                             ),
//                             const Text(
//                               'No',
//                             ),
//                             Checkbox(
//                               value: locatedYes,
//                               onChanged: (value) {
//                                 setState(() {
//                                   locatedYes = value!;
//                                   locatedNo = false;
//                                 });
//                               },
//                               activeColor: Colors.pink,
//                               checkColor: Colors.white,
//                             ),
//                             const Text(
//                               'Yes',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         const Text('Are you eligible to Work in UK ?'),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Checkbox(
//                               value: eligibleNo,
//                               onChanged: (value) {
//                                 setState(() {
//                                   eligibleNo = value!;
//                                   eligibleYes = false;
//                                 });
//                               },
//                               activeColor: Colors.pink,
//                               checkColor: Colors.white,
//                             ),
//                             const Text('No'),
//                             Checkbox(
//                               value: eligibleYes,
//                               onChanged: (value) {
//                                 setState(() {
//                                   eligibleYes = value!;
//                                   eligibleNo = false;
//                                 });
//                               },
//                               activeColor: Colors.pink,
//                               checkColor: Colors.white,
//                             ),
//                             const Text('Yes'),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.only(top: 10.h, left: 20.w),
//                           child: Checkbox(
//                             value: agree,
//                             onChanged: (value) {
//                               setState(() {
//                                 agree = value!;
//                               });
//                             },
//                             activeColor: Colors.pink,
//                             checkColor: Colors.white,
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(left: 10.w, top: 10.h),
//                           child: InkWell(
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (ctx) => AlertDialog(
//                                   actions: <Widget>[
//                                     Container(
//                                       height: 650.h,
//                                       child: SfPdfViewer.asset(
//                                           'assets/images/Agreement/Terms.pdf'),
//                                     ),
//                                     Center(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.of(ctx).pop();
//                                             },
//                                             child: Container(
//                                               padding: const EdgeInsets.all(14),
//                                               child: const Text(
//                                                 "Cancel",
//                                                 style: TextStyle(
//                                                     color: Colors.red,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ),
//                                           ),
//                                           TextButton(
//                                             onPressed: () {
//                                               agree = true;
//                                               setState(() {});
//                                               Navigator.of(ctx).pop();
//                                             },
//                                             child: Container(
//                                               padding: const EdgeInsets.all(14),
//                                               child: const Text("I agree",
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                               // OpenFile.open(
//                               //     "assets/images/Agreement/Agreement.docx");
// //                               Future<File> openFileFromAsset() async {
// //     Directory tempDir = await getTemporaryDirectory();
// //     File tempFile = File('${tempDir.path}/set_any_name.docx');
// //     ByteData bd = await rootBundle.load('assets/en/legal_notes.docx');
// //     await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
// //     return tempFile;
// //   }
// // openFileFromAsset().then((file){OpenFile.open(file.path);});
//                             },
//                             child: Row(
//                               children: [
//                                 Text(
//                                   'I agree to the',
//                                   style: TextStyle(
//                                     fontSize: 14.sp,
//                                   ),
//                                 ),
//                                 Text(
//                                   ' Terms & Conditions',
//                                   style: TextStyle(
//                                     color: Colors.pink,
//                                     fontSize: 14.sp,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Visibility(
//                         visible: agree == false,
//                         child: Container(
//                           margin: EdgeInsets.only(left: 30.w, top: 10.h),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Please agree to the Terms & Conditions',
//                                 style: TextStyle(
//                                   color: Colors.red,
//                                   fontSize: 12.sp,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ))
//                   ],
//                 ),
//                 SizedBox(height: 40.h),
//                 Column(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const SignUpPage()),
//                         );
//                       },
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.only(left: 20.w, right: 20.w, bottom: 0.h),
//                       child: InkWell(
//                         onTap: () async {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const SignUpPage()),
//                           );
//                         },
//                         child: Container(
//                           height: 60.h,
//                           width: 600.w,
//                           decoration: BoxDecoration(
//                             color: Colors.blue,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Center(
//                             child: Text(
//                               'Login',
//                               style: TextStyle(
//                                   fontSize: 16.sp, color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 0.h),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           left: 20.w, right: 20.w, bottom: 20.h),
//                       child: InkWell(
//                         onTap: () async {
//                           if (locatedYes == true && eligibleYes == true) {
//                             AuthController controller = AuthController();
//                             if (formkey.currentState!.validate()) {
//                               showDialog(
//                                 context: context,
//                                 barrierDismissible: false,
//                                 builder: (BuildContext context) {
//                                   return Container(
//                                       child: const Center(
//                                           child: CircularProgressIndicator(
//                                     color: Color(0xfffaeaea),
//                                   )));
//                                 },
//                               );
//                               if (agree == true) {
//                                 var data = await controller.CreateAccount(
//                                     context: context,
//                                     email: email.text,
//                                     password: password.text,
//                                     name: name.text);
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     SnackBar(content: Text('$data')));
//                                 if (data == 'Register Successfuly.') {
//                                   /// direct access to home page is commented
//                                   // Navigator.pushAndRemoveUntil(
//                                   //   context,
//                                   //   MaterialPageRoute(
//                                   //     builder: (context) =>
//                                   //         const bottomNavigationBar(),
//                                   //   ),
//                                   //   (route) => false,
//                                   // );
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => const SignUpPage(),
//                                     ),
//                                   );
//                                 } else {
//                                   Navigator.of(context).pop();
//                                 }
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content: Text(
//                                             'Please agree to terms and conditions')));
//                               }
//                             }
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text(
//                                     'Sorry you are not allowed to use this app'),
//                                 backgroundColor: Colors.pink,
//                               ),
//                             );
//                           }
//                         },
//                         child: Container(
//                           height: 60.h,
//                           width: 600.w,
//                           decoration: BoxDecoration(
//                             color: name.text != "" &&
//                                     email.text != "" &&
//                                     password.text != "" &&
//                                     confirmpassword.text != ""
//                                 ? Colors.pink
//                                 : const Color(0xfffaeaea),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: Center(
//                             child: Text(
//                               'Sign Up',
//                               style: TextStyle(
//                                   fontSize: 16.sp,
//                                   color: name.text != "" &&
//                                           email.text != "" &&
//                                           password.text != "" &&
//                                           confirmpassword.text != ""
//                                       ? Colors.white
//                                       : Colors.black),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../Controller/AuthController.dart';
import 'SignUp.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formkey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  var agree = false;
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  var locatedYes = false;
  var locatedNo = false;
  var eligibleYes = false;
  var eligibleNo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Column(
                    children: [
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      const Text('Create account and get started'),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Container(
                        margin: EdgeInsets.only(left: 20.w, top: 20.w),
                        child: Text(
                          'Name',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: name,
                        onChanged: (v) {
                          setState(() {});
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please fillout this field';
                          }
                        },
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: const Color(0xffACA9A9),
                          ),
                          fillColor: const Color(0xffEEEEEE),
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
                          hintText: 'Enter name',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 20.w),
                      child: Text(
                        'Email',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: email,
                        onChanged: (v) {
                          setState(() {});
                        },
                        validator: (String? value) {
                          final bool isValid =
                              EmailValidator.validate(value.toString());

                          if (!isValid) {
                            return 'Invalid Email';
                          }

                          if (value!.isEmpty) {
                            return 'Please fillout this field';
                          }
                        },
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: const Color(0xffACA9A9),
                          ),
                          fillColor: const Color(0xffEEEEEE),
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
                          hintText: 'Enter email',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 20.w),
                      child: Text(
                        'Password',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: password,
                        obscureText: isPasswordHidden,
                        obscuringCharacter: "*",
                        onChanged: (v) {
                          setState(() {});
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please fillout this field';
                          }
                        },
                        decoration: InputDecoration(
                          suffix: InkWell(
                              onTap: () {
                                isPasswordHidden = !isPasswordHidden;
                                setState(() {});
                              },
                              child: Icon(
                                isPasswordHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xffF5591f),
                              )),
                          hintStyle: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: const Color(0xffACA9A9),
                          ),
                          fillColor: const Color(0xffEEEEEE),
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
                          hintText: 'Enter password',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 20.w),
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
                      child: TextFormField(
                        controller: confirmpassword,
                        obscureText: isConfirmPasswordHidden,
                        obscuringCharacter: "*",
                        onChanged: (v) {
                          setState(() {});
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please fillout this field';
                          } else if (password.text != confirmpassword.text) {
                            return "password doesn't match";
                          }
                        },
                        decoration: InputDecoration(
                          suffix: InkWell(
                              onTap: () {
                                isConfirmPasswordHidden =
                                    !isConfirmPasswordHidden;
                                setState(() {});
                              },
                              child: Icon(
                                isConfirmPasswordHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xffF5591f),
                              )),
                          hintStyle: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                            color: const Color(0xffACA9A9),
                          ),
                          fillColor: const Color(0xffEEEEEE),
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
                          hintText: 'Retype Password',
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        const Text('Are you Located in UK ?'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: locatedNo,
                              onChanged: (value) {
                                setState(() {
                                  locatedNo = value!;
                                  locatedYes = false;
                                });
                              },
                              activeColor: Colors.pink,
                              checkColor: Colors.white,
                            ),
                            const Text(
                              'No',
                            ),
                            Checkbox(
                              value: locatedYes,
                              onChanged: (value) {
                                setState(() {
                                  locatedYes = value!;
                                  locatedNo = false;
                                });
                              },
                              activeColor: Colors.pink,
                              checkColor: Colors.white,
                            ),
                            const Text(
                              'Yes',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text('Are you eligible to Work in UK ?'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: eligibleNo,
                              onChanged: (value) {
                                setState(() {
                                  eligibleNo = value!;
                                  eligibleYes = false;
                                });
                              },
                              activeColor: Colors.pink,
                              checkColor: Colors.white,
                            ),
                            const Text('No'),
                            Checkbox(
                              value: eligibleYes,
                              onChanged: (value) {
                                setState(() {
                                  eligibleYes = value!;
                                  eligibleNo = false;
                                });
                              },
                              activeColor: Colors.pink,
                              checkColor: Colors.white,
                            ),
                            const Text('Yes'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10.h, left: 20.w),
                          child: Checkbox(
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value!;
                              });
                            },
                            activeColor: Colors.pink,
                            checkColor: Colors.white,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10.w, top: 10.h),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  actions: <Widget>[
                                    Container(
                                      height: 650.h,
                                      child: SfPdfViewer.asset(
                                          'assets/images/Agreement/Terms.pdf'),
                                    ),
                                    Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              agree = true;
                                              setState(() {});
                                              Navigator.of(ctx).pop();
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              child: const Text("I agree",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              // OpenFile.open(
                              //     "assets/images/Agreement/Agreement.docx");
//                               Future<File> openFileFromAsset() async {
//     Directory tempDir = await getTemporaryDirectory();
//     File tempFile = File('${tempDir.path}/set_any_name.docx');
//     ByteData bd = await rootBundle.load('assets/en/legal_notes.docx');
//     await tempFile.writeAsBytes(bd.buffer.asUint8List(), flush: true);
//     return tempFile;
//   }
// openFileFromAsset().then((file){OpenFile.open(file.path);});
                            },
                            child: Row(
                              children: [
                                Text(
                                  'I agree to the',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  ' Terms & Conditions',
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                        visible: agree == false,
                        child: Container(
                          margin: EdgeInsets.only(left: 30.w, top: 10.h),
                          child: Row(
                            children: [
                              Text(
                                'Please agree to the Terms & Conditions',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 40.h),
                Column(
                  children: [
                    // InkWell(
                    //     onTap: () {
                    //       Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const SignUpPage()),
                    //       );
                    //     },
                    //     child: Text(
                    //       'Login',
                    //       style: TextStyle(fontSize: 16.sp),
                    //     )),

                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 20.h),
                      child: InkWell(
                        onTap: () async {
                          if (locatedYes == true && eligibleYes == true) {
                            AuthController controller = AuthController();
                            if (formkey.currentState!.validate()) {
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
                              if (agree == true) {
                                var data = await controller.CreateAccount(
                                    context: context,
                                    email: email.text,
                                    password: password.text,
                                    name: name.text);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('$data')));
                                if (data == 'Register Successfuly.') {
                                  /// direct access to home page is commented
                                  // Navigator.pushAndRemoveUntil(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         const bottomNavigationBar(),
                                  //   ),
                                  //   (route) => false,
                                  // );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ),
                                  );
                                } else {
                                  Navigator.of(context).pop();
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please agree to terms and conditions')));
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Sorry you are not allowed to use this app'),
                                backgroundColor: Colors.pink,
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 60.h,
                          width: 600.w,
                          decoration: BoxDecoration(
                            color: name.text != "" &&
                                    email.text != "" &&
                                    password.text != "" &&
                                    confirmpassword.text != ""
                                ? Colors.pink
                                : const Color(0xfffaeaea),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: name.text != "" &&
                                          email.text != "" &&
                                          password.text != "" &&
                                          confirmpassword.text != ""
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 20.h),
                      child: InkWell(
                        onTap: () async {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        },
                        child: Container(
                          height: 60.h,
                          width: 600.w,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
