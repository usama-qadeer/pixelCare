import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_app/Controller/DocumentController.dart';
import 'package:pixel_app/Model/address_proof_model.dart';

import 'Application_Form/Model/nmc-model.dart';
import 'Application_Form/Model/term-lettter-model.dart';
import 'Application_Form/Model/vacinaction-proof-model.dart';
import 'Model/national-insurance-model.dart';
import 'Model/p45p46-model.dart';
import 'Model/right_to_work_model.dart';

class TestScreenJob extends StatefulWidget {
  const TestScreenJob({super.key});

  @override
  State<TestScreenJob> createState() => _TestScreenJobState();
}

class _TestScreenJobState extends State<TestScreenJob> {
  // ApiGetPassport? _apiGetPassport;
  ProofOfAddressModel? _proofOfAddressModel;
  NMCLetterModel? _nmcLetterModel;
  VaccinationProofModel? _vaccinationProofModel;
  TermLetterModel? _termLetterModel;
  P45P46P60Model? _p45p46p60model;
  NationalInsuranceModel? _nationalInsuranceModel;
  RightToWorkModel? _rightToWorkModel;

  @override
  void initState() {
    getPassportDataFromAPI();
    super.initState();
  }

  Future<void> getPassportDataFromAPI() async {
    try {
      final user = await DocumentController().RightToWorkGet();
      setState(() {
        _rightToWorkModel = user;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    _rightToWorkModel != null
        ? print(
            "///////////////////${_rightToWorkModel!.data!.length.toString()}")
        : print("");
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            FutureBuilder<ProofOfAddressModel>(
              future: DocumentController().ProofOfAddress(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.data == null) {
                    return Center(
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child:
                                const Text("No Relevant Vacancy Available")));
                  }
                  print(
                      "******************${snapshot.data!.data!.first.id}******************");
                  return Center(
                    child: Container(
                      width: 500,
                      height: 500,
                      color: Colors.green,
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            snapshot.data!.data!.first.id.toString(),
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple),
                          )),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(child: Center(child: Text("Loading...")));
                }
              },
            ),
            // Text(_nmcLetterModel!.data!.first.id.toString()),
            _rightToWorkModel != null
                ? SizedBox(
                    height: 100.h,
                    child: ListView.builder(
                      itemCount: _rightToWorkModel!.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.green,
                          child: Center(
                            child: Text(_rightToWorkModel!.data!
                                .elementAt(index)
                                .expiryDate
                                .toString()),
                          ),
                        );
                      },
                    ),
                  )
                : Text("Loading Data"),
            Container(
              width: 100.w,
              height: 100.h,
              color: Colors.lightGreen,
              child: Image.network(
                _rightToWorkModel!.data!.first.documentImages!.first.upload
                    .toString(),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            )
          ],
        ),
      ),
    );
  }
}
