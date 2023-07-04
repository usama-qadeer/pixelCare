import 'dart:convert';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:pixel_app/Model/VacancyModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/Constant.dart';
import '../Model/relevent_job_model.dart';

var token;

class VacancyController {
  Future<RelevantModel> GetAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    print(token);
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
      'GET',
      Uri.parse(
        '$baseUrl/api/care-home-jobs/get',
      ),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      print("***************${response.statusCode}***************");
      return RelevantModel.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return RelevantModel();
    }
  }

  Future<RelevantModel> GetRelevant() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    // var headers = {'Authorization': 'Bearer $token'};
    // final url = Uri.parse('$baseUrl/api/care-home-jobs/get/relevant');
    // final response = await http.get(url);
    // var request = http.get(url, headers: headers);
    // if (response.statusCode == 200) {
    //   print("////////rrrrrr//////${response.body}");
    //   return RelevantModel.fromJson(jsonDecode(response.body));
    // } else {
    //   return RelevantModel();
    // }
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.Request(
        'GET', Uri.parse('$baseUrl/api/care-home-jobs/get/relevant'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      return RelevantModel.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return RelevantModel();
    }
  }

  Apply(var id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request('PUT',
        Uri.parse('$baseUrl/api/care-home-jobs/apply?care_home_job_id=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      List<String>? data = ['NoId'];
      data = pref.getStringList('Vacancy');
      if (data == null) {
        data = ['No data'];
      }
      data.add(id.toString());
      pref.setStringList("Vacancy", data);
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
