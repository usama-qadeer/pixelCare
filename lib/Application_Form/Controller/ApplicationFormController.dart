import 'dart:convert';
import 'dart:developer' as dev;

import 'package:http/http.dart' as http;
import 'package:pixel_app/Application_Form/Model/ApplicationFormModel.dart';
import 'package:pixel_app/Constants/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationFormController {
  // Apply(ApplicationFormModel? model, context) async {
  //   // debugPrint("8888 ${model!.toJson()}", wrapWidth:max(a, b));
  //   Map<String, dynamic> a = model!.toJson();
  //   dev.log("555555${a}");
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var token = pref.getString('token');
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //     'Content-Type': 'application/json'
  //   };
  //   var request = http.Request(
  //     'POST',
  //     Uri.parse('$baseUrl/api/user/apply-care-home-jobs/store'),
  //   );
  //   request.body = json.encode(model);
  //   request.headers.addAll(headers);
  //   var response = await request.send();

  //   // print(response.statusCode);
  //   // print(jsonDecode(await response.stream.bytesToString())['message']);
  //   //
  //   // if (jsonDecode(await response.stream.bytesToString())['message'] ==
  //   //     'You can only submit the application once') {
  //   //   ScaffoldMessenger.of(context).showSnackBar(
  //   //     SnackBar(
  //   //       content: Text(
  //   //         jsonDecode(await response.stream.bytesToString())['message'],
  //   //         style: const TextStyle(color: Colors.white),
  //   //       ),
  //   //     ),
  //   //   );
  //   //   Navigator.of(context).pushAndRemoveUntil(
  //   //     MaterialPageRoute(
  //   //       builder: (context) => const bottomNavigationBar(),
  //   //     ),
  //   //     (Route route) => false,
  //   //   );
  //   // }
  //   if (response.statusCode == 200) {
  //     if (jsonDecode(request.body)['message'] ==
  //         'Application has been successfuly applied') {
  //       SharedPreferences pref = await SharedPreferences.getInstance();
  //       pref.setBool('FormSubmitted', true);
  //       print(await response.stream.bytesToString());
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //     print(jsonDecode(await response.stream.bytesToString())['message']);
  //     return jsonDecode(await response.stream.bytesToString())['message'];
  //   }
  // }

  ///***************************  Update Apply  ****************************
  updateApply(ApplicationFormModel? model, context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
      'PUT',
      Uri.parse('$baseUrl/api/user/apply-care-home-jobs/update'),
    );
    request.body = json.encode(model!.toJson());
    request.headers.addAll(headers);
    var response = await request.send();
    // http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString())['message'];
  }

  Future Apply(ApplicationFormModel? model, context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString('token');
    Map<String, dynamic> a = model!.toJson();
    dev.log("alllllll data is comingggggg ${a.toString()}");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'POST', Uri.parse('$baseUrl/api/user/apply-care-home-jobs/store'));
    request.body = json.encode(model);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print(response.statusCode);
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
    }
  }
}
