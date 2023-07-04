import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Constants/Constant.dart';
import 'package:pixel_app/Controller/DocumentController.dart';
import 'package:pixel_app/DocumentsUpload/enhanced_dbs_certificate.dart';
import 'package:pixel_app/DocumentsUpload/national_insurance.dart';
import 'package:pixel_app/DocumentsUpload/nmc_letter.dart';
import 'package:pixel_app/DocumentsUpload/p_45_46_60.dart';
import 'package:pixel_app/DocumentsUpload/passport.dart';
import 'package:pixel_app/DocumentsUpload/proof_of_address.dart';
import 'package:pixel_app/DocumentsUpload/right_to_work.dart';
import 'package:pixel_app/DocumentsUpload/term_letter.dart';
import 'package:pixel_app/DocumentsUpload/vaccination_proof.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Application_Form/Model/nmc-model.dart';
import '../Application_Form/Model/passport_model.dart';
import '../Application_Form/Model/term-lettter-model.dart';
import '../Application_Form/Model/vacinaction-proof-model.dart';
import '../Model/address_proof_model.dart';
import '../Model/document_dbs_model.dart';
import '../Model/national-insurance-model.dart';
import '../Model/p45p46-model.dart';
import '../Model/right_to_work_model.dart';

class DocumentsUpload extends StatefulWidget {
  DocumentsUpload({Key? key}) : super(key: key);

  @override
  State<DocumentsUpload> createState() => _DocumentsUploadState();
}

class _DocumentsUploadState extends State<DocumentsUpload> {
  List title = [
    'Passport',
    'Enhanced DBS Certificate',
    // 'Trainings Certificates',
    'Right to Work (Passport/Residence)',
    'Proof of Address',
    'National Insurance',
    'P45/P60',
    'Term Letter',
    'Vaccination Proof',
    'NMC Letter'
  ];
  late SharedPreferences _prefs;
  AssignVals() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  ApiGetPassport? _passportModel;
  EnhancedDBSCertificate? _enhancedDBSCertificate;
  RightToWorkModel? _rightToWorkModel;
  ProofOfAddressModel? _proofOfAddressModel;
  NationalInsuranceModel? _nationalInsuranceModel;
  P45P46P60Model? _p45p46p60model;
  TermLetterModel? _termLetterModel;
  VaccinationProofModel? _vaccinationProofModel;
  NMCLetterModel? _nmcLetterModel;
  @override
  void initState() {
    getPassport();
    getDBSCertificate();
    getRightToWork();
    getProofAddress();
    getNationalInsurance();
    getP45P60();
    getNationalInsurance();
    getP45P60();
    getTermLetter();
    getVaccinationProof();
    getNMCLetter();
    // TODO: implement initState
    AssignVals();
    super.initState();
  }

  Future getPassport() async {
    try {
      final user = await DocumentController().GetPassport();
      setState(() {
        _passportModel = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future getDBSCertificate() async {
    try {
      final user = await DocumentController().GetDbsFromAPI();
      setState(() {
        _enhancedDBSCertificate = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future getRightToWork() async {
    try {
      final user = await DocumentController().RightToWorkGet();
      setState(() {
        _rightToWorkModel = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future getProofAddress() async {
    try {
      final user = await DocumentController().ProofOfAddress();
      setState(() {
        _proofOfAddressModel = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future getNationalInsurance() async {
    try {
      final user = await DocumentController().NationalInsuranceGet();
      setState(() {
        _nationalInsuranceModel = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future getP45P60() async {
    try {
      final user = await DocumentController().P40P46Get();
      setState(() {
        _p45p46p60model = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future getTermLetter() async {
    try {
      final user = await DocumentController().TermLetterGet();
      setState(() {
        _termLetterModel = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future getVaccinationProof() async {
    try {
      final user = await DocumentController().VacinationProofGet();
      setState(() {
        _vaccinationProofModel = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  Future getNMCLetter() async {
    try {
      final user = await DocumentController().GetNmCLetter();
      setState(() {
        _nmcLetterModel = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  List widgets = [
    Passport(),
    EnhanceDBSCertificate(),
    RightToWork(),
    ProofAddress(),
    NationalInsurance(),
    P_45_46_60(),
    Term_Letter(),
    VaccinationProof(),
    NMC_Letter()
  ];

  @override
  Widget build(BuildContext context) {
    // _rightToWorkModel != null
    //     ? print(_rightToWorkModel!.data?.first.expiryDate.toString())
    //     : print("loading");
    AssignVals();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
          'Documents Upload',
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Icon(
            //       Icons.file_copy_outlined,
            //       size: 35,
            //       color: Colors.blue,
            //     ),
            //   ],
            // ),
            // Container(
            //   height: 100.w,
            //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //   padding: EdgeInsets.all(4),
            //   decoration: BoxDecoration(
            //       color: Colors.grey.shade100,
            //       borderRadius: BorderRadius.circular(5),
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.grey.shade400,
            //             spreadRadius: 1,
            //             blurRadius: 10)
            //       ]),
            //   child: Column(
            //     //mainAxisAlignment:
            //     //   MainAxisAlignment.spaceBetween,
            //     children: [
            //       Row(
            //         children: [
            //           Text("Right to Work", style: TextStyle(fontSize: 18.sp)),
            //           Text(
            //             "(Passport/Residence)",
            //             style: TextStyle(
            //               fontSize: 14.sp,
            //               color: Color.fromARGB(255, 110, 108, 108),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           _rightToWorkModel != null
            //               ? Padding(
            //                   padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            //                   child: Align(
            //                     alignment: Alignment.topLeft,
            //                     child: Text(
            //                       "Expiry Date: " +
            //                           _rightToWorkModel!.data!.first.expiryDate
            //                               .toString(),
            //                       style: TextStyle(
            //                           color: Colors.blue, fontSize: 15),
            //                     ),
            //                   ),
            //                 )
            //               : Text(""),
            //           Spacer(),
            //           _rightToWorkModel != null
            //               ? Container(
            //                   margin: EdgeInsets.only(left: 10.w),
            //                   height: 50.h,
            //                   width: 50,
            //                   decoration: BoxDecoration(
            //                     color: const Color(0xfffaeaea),
            //                     borderRadius: BorderRadius.circular(5),
            //                     image: DecorationImage(
            //                       image: NetworkImage(
            //                           '${_rightToWorkModel!.data?.first.documentImages!.first.upload}'),
            //                       fit: BoxFit.cover,
            //                     ),
            //                   ),
            //                 )
            //               : Container(),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            // SizedBox(
            //   height: 40,
            // ),

//             Container(
//               margin: EdgeInsets.only(top: 30.h, left: 10.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Icon(
//                     Icons.arrow_back_ios_outlined,
//                     size: 20.sp,
//                     color: Colors.grey,
//                   ),
//                   SizedBox(width: 5.w),
//                   Text(
//                     'Documents Upload',
//                     style: TextStyle(
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: title.length,
                padding: EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(6),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => widgets[index]));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: 1,
                                  blurRadius: 10)
                            ]),
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_copy_outlined,
                                size: 35,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          title: index == 2
                              ? Column(
                                  //mainAxisAlignment:
                                  //   MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Right to Work",
                                            style: TextStyle(fontSize: 18.sp)),
                                        Text(
                                          "(Passport/Residence)",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Color.fromARGB(
                                                255, 110, 108, 108),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     _rightToWorkModel != null
                                    //         ? Padding(
                                    //             padding:
                                    //                 const EdgeInsets.fromLTRB(
                                    //                     0, 10, 0, 10),
                                    //             child: Align(
                                    //               alignment: Alignment.topLeft,
                                    //               child: Text(
                                    //                 "Expiry Date: " +
                                    //                     _rightToWorkModel!.data!
                                    //                         .first.expiryDate
                                    //                         .toString(),
                                    //                 style: TextStyle(
                                    //                     color: Colors.blue,
                                    //                     fontSize: 15),
                                    //               ),
                                    //             ),
                                    //           )
                                    //         : Text(""),
                                    //     Spacer(),
                                    //     _rightToWorkModel != null
                                    //         ? Container(
                                    //             margin:
                                    //                 EdgeInsets.only(left: 10.w),
                                    //             height: 50.h,
                                    //             width: 50,
                                    //             decoration: BoxDecoration(
                                    //               color:
                                    //                   const Color(0xfffaeaea),
                                    //               borderRadius:
                                    //                   BorderRadius.circular(5),
                                    //               image: DecorationImage(
                                    //                 image: NetworkImage(
                                    //                     '${_rightToWorkModel!.data?.first.documentImages!.first.upload}'),
                                    //                 fit: BoxFit.cover,
                                    //               ),
                                    //             ),
                                    //           )
                                    //         : Container(),
                                    //   ],
                                    // ),
                                  ],
                                )
                              : index == 8
                                  ? Row(
                                      children: [
                                        Text("NMC Letter",
                                            style: TextStyle(fontSize: 18.sp)),
                                        Text(
                                          "(Only for Nurses)",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Color.fromARGB(
                                                255, 110, 108, 108),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      title[index],
                                      style: TextStyle(fontSize: 18.sp),
                                    ),
//                           String passportStatus = "Pending";
// String dbsCertificateStatus = "Pending";
// String rightToWorkStatus = "Pending";
// String proofaddressStatus = "Pending";
// String nationalInsuranceStatus = "Pending";
// String p45p60Status = "Pending";
// String termLetterStatus = "Pending";
// String vaccinationProofStatus = "Pending";
// String nmcLetterStatus = "Pending";
                          subtitle: Text(
                            index == 0
                                ? _passportModel?.message == "Record Founded"
                                    ? "Uploaded"
                                    : ("Pending")
                                //  _prefs.getString("passportStatus") != null
                                //     ? _prefs
                                //         .getString("passportStatus")
                                //         .toString()
                                //     : passportStatus
                                : index == 1
                                    ? _prefs.getString(
                                                "dbsCertificateStatus") !=
                                            null
                                        ? _prefs
                                            .getString("dbsCertificateStatus")
                                            .toString()
                                        : dbsCertificateStatus
                                    : index == 2
                                        ? _prefs.getString(
                                                    "rightToWorkStatus") !=
                                                null
                                            ? _prefs
                                                .getString("rightToWorkStatus")
                                                .toString()
                                            : rightToWorkStatus
                                        : index == 3
                                            ? _prefs.getString(
                                                        "proofaddressStatus") !=
                                                    null
                                                ? _prefs
                                                    .getString(
                                                        "proofaddressStatus")
                                                    .toString()
                                                : proofaddressStatus
                                            : index == 4
                                                ? _prefs.getString(
                                                            "nationalInsuranceStatus") !=
                                                        null
                                                    ? _prefs
                                                        .getString(
                                                            "nationalInsuranceStatus")
                                                        .toString()
                                                    : nationalInsuranceStatus
                                                : index == 5
                                                    ? _prefs.getString(
                                                                "p45p60Status") !=
                                                            null
                                                        ? _prefs
                                                            .getString(
                                                                "p45p60Status")
                                                            .toString()
                                                        : p45p60Status
                                                    : index == 6
                                                        ? _prefs.getString(
                                                                    "termLetterStatus") !=
                                                                null
                                                            ? _prefs
                                                                .getString(
                                                                    "termLetterStatus")
                                                                .toString()
                                                            : termLetterStatus
                                                        : index == 7
                                                            ? _prefs.getString(
                                                                        "vaccinationProofStatus") !=
                                                                    null
                                                                ? _prefs
                                                                    .getString(
                                                                        "vaccinationProofStatus")
                                                                    .toString()
                                                                : vaccinationProofStatus
                                                            : index == 8
                                                                ? _prefs.getString(
                                                                            "nmcLetterStatus") !=
                                                                        null
                                                                    ? _prefs
                                                                        .getString(
                                                                            "nmcLetterStatus")
                                                                        .toString()
                                                                    : nmcLetterStatus
                                                                : "",
                            style: TextStyle(
                                color: index == 0 &&
                                        _passportModel?.message == null
                                    ? Colors.red
                                    : index == 0 &&
                                            _passportModel?.message ==
                                                "Record Founded"
                                        ? Colors.blue
                                        : index == 1 &&
                                                _prefs.getString(
                                                        "dbsCertificateStatus") ==
                                                    null
                                            ? Colors.red
                                            : index == 1 &&
                                                    _prefs.getString(
                                                            "dbsCertificateStatus") !=
                                                        null
                                                ? Colors.blue
                                                : index == 2 &&
                                                        _prefs.getString(
                                                                "rightToWorkStatus") ==
                                                            null
                                                    ? Colors.red
                                                    : index == 2 &&
                                                            _prefs.getString(
                                                                    "rightToWorkStatus") !=
                                                                null
                                                        ? Colors.blue
                                                        : index == 3 &&
                                                                _prefs.getString(
                                                                        "proofaddressStatus") ==
                                                                    null
                                                            ? Colors.red
                                                            : index == 3 &&
                                                                    _prefs.getString("proofaddressStatus") !=
                                                                        null
                                                                ? Colors.blue
                                                                : index == 4 &&
                                                                        _prefs.getString("nationalInsuranceStatus") == null
                                                                    ? Colors.red
                                                                    : index == 4 && _prefs.getString("nationalInsuranceStatus") != null
                                                                        ? Colors.blue
                                                                        : index == 5 && _prefs.getString("p45p60Status") == null
                                                                            ? Colors.red
                                                                            : index == 5 && _prefs.getString("p45p60Status") != null
                                                                                ? Colors.blue
                                                                                : index == 6 && _prefs.getString("termLetterStatus") == null
                                                                                    ? Colors.red
                                                                                    : index == 6 && _prefs.getString("termLetterStatus") != null
                                                                                        ? Colors.blue
                                                                                        : index == 7 && _prefs.getString("vaccinationProofStatus") == null
                                                                                            ? Colors.red
                                                                                            : index == 7 && _prefs.getString("vaccinationProofStatus") != null
                                                                                                ? Colors.blue
                                                                                                : index == 8 && _prefs.getString("nmcLetterStatus") == null
                                                                                                    ? Colors.red
                                                                                                    : index == 8 && _prefs.getString("nmcLetterStatus") != null
                                                                                                        ? Colors.blue
                                                                                                        : Colors.red,
                                fontSize: 15.sp),
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
