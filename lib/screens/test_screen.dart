import 'package:flutter/material.dart';
import 'package:pixel_app/Application_Form/Model/ApplicationFormModel.dart';
import 'package:pixel_app/Model/UserModel.dart';

class CombinedModel {
  final UserModel firstModel;
  final ApplicationFormModel secondModel;

  CombinedModel({required this.firstModel, required this.secondModel});
}

Future<CombinedModel> fetchData() async {
  // Fetch data for both models and combine them into a single model
  final firstModelData = await UserModel();
  final secondModelData = await ApplicationFormModel();

  final combinedModel = CombinedModel(
    firstModel: firstModelData,
    secondModel: secondModelData,
  );

  return combinedModel;
}

//
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CombinedModel>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final combinedModel = snapshot.data!;
          return Column(
            children: [
              Text(combinedModel.firstModel.data!.name.toString()),
              // Text(
              //     combinedModel.secondModel.personalDetail?.homeTel),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
