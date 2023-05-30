import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixel_app/Constants/Constant.dart';
import 'package:pixel_app/Model/AvailabilityModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvailabilityController {
  Future<AvailbilityModel> GetAvail({month, year}) async {
    // print(month.toString());
    // print(year.toString());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('GET',
        Uri.parse('$baseUrl/api/user/availability?month=$month&year=$year'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return AvailbilityModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      return AvailbilityModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    }
  }

  SaveAvail({date, cond, time}) async {
    // print(date.toString());
    // print(time.toString());
    // print(cond.toString());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            '$baseUrl/api/user/availability/${true ? 'save' : 'edit'}?date=$date&schedule_list=$time'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString())['message'];
  }

  DeleteAvail(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('DELETE',
        Uri.parse('$baseUrl/api/user/availability/delete?avalability_id=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString())['message'];
  }
}
