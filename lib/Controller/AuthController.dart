// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pixel_app/Application_Form/Model/ApplicationFormModel.dart';
import 'package:pixel_app/Model/AccademicCertModel.dart';
import 'package:pixel_app/Model/AccademicQualModel.dart';
import 'package:pixel_app/Model/NmcModel.dart';
import 'package:pixel_app/Model/ReferenceModel.dart';
import 'package:pixel_app/Model/UserModel.dart';
import 'package:pixel_app/screens/OtpVerification.dart';
import 'package:pixel_app/screens/SignUp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Application_Form/Model/OtpModel.dart';
import '../Constants/Constant.dart';
import '../Model/AccountModel.dart';
import '../Model/NewPassword.dart';
import '../Model/NextKinModel.dart';
import '../screens/UpdatePassword.dart';

var token;

class AuthController {
  CreateAccount(
      {var name, var email, var password, scaffoldKey, context}) async {
    var response = await http.post(Uri.parse(
        '$baseUrl/api/user/store?name=$name&email=$email&password=$password'));
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['message'] == 'Register Successfuly.') {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool('Logined', true);
        pref.setString('userPersonalInfo', response.body);
        pref.setString('token', jsonDecode(response.body)['token']);
      }
      return jsonDecode(response.body)['message'];
    } else {
      print(response.body);
      return 'Registeration Failed';
    }
  }

  LoginAccount({var email, var password, scaffoldKey, context}) async {
    var response = await http.post(
        Uri.parse('$baseUrl/api/user/login?email=$email&password=$password'));
    print(response.body);
    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['message'] == 'Login Successfuly.') {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setBool('Logined', true);
        pref.setString('token', jsonDecode(response.body)['token']);
        pref.setString('userPersonalInfo', response.body);
        Map<String, dynamic> itr = jsonDecode(response.body);
        UserAccountinfo usr = UserAccountinfo.fromJson(itr);
        pref.setString('user_id', usr.data!.id.toString());
      }
      SharedPreferences pref = await SharedPreferences.getInstance();

      String? tt = await pref.getString("token");

      print("890890 ${tt}");
      print("hhhhh${jsonDecode(response.body)['token']}");
      return jsonDecode(response.body)['message'];
    } else {
      return 'Login Failed';
    }
  }

  UpdatePassword(
      {var oldPassword,
      var newPassword,
      var password,
      scaffoldKey,
      context}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var response = await http.post(
        Uri.parse(
            '$baseUrl/api/user/update/password?old_password=$oldPassword&new_password=$newPassword'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      return 'Registeration Failed';
    }
  }

  Future<UserModel> GetUserData() async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // var userData_snap = pref.getString('userPersonalInfo');
    // print(userData_snap);
    // return UserModel.fromJson(jsonDecode(userData_snap!));

    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    print("ttt$token");
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
      'GET',
      Uri.parse(
        '$baseUrl/api/user/get',
      ),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return UserModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      // print("||||||||||||||||||||||||||||||||||");
      // print(await response.stream.bytesToString());
      // print("||||||||||||||||||||||||||||||||||");
    } else {
      print(response.reasonPhrase);
    }

    return UserModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  Future UpdateProfile(
      {dynamic name,
      dynamic email,
      dynamic phone,
      dynamic country = null,
      dynamic dob = null,
      dynamic nextOfKin,
      var imageLink,
      File? imageFile}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');

    var headers = {'Authorization': 'Bearer $token'};
    print(headers);
    // print(model!.toJson());
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/api/user/update'));
    request.fields.addAll({
      // 'email': '${model.data?.email}',
      // 'phone': '${model.data?.phone}',
      // 'country': '${model.data?.country}',
      // 'dob': '${model.data?.dob}',
      // 'next_of_kin': '${model.data?.nextOfKin}',

      'name': '$name',
      'email': '$email',
      'phone': '$phone',
      'country': '$country',
      'dob': '$dob',
      'next_of_kin': '$nextOfKin',
    });
    // print('$dob');
    // if (imageLink != model.data?.avatar && imageLink != null) {
    /// The profile pic
    // request.files.add(
    //     await http.MultipartFile.fromPath('avatar', '$imageLink'));
    // }

    if (imageFile != null) {
      request.files
          .add(await http.MultipartFile.fromPath('avatar', imageFile.path));
    }

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    var response2 = await http.get(Uri.parse('$baseUrl/api/user/get'),
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

    pref.setString('userPersonalInfo', response2.body);

    return jsonDecode(await response.stream.bytesToString())['message'];
    // return jsonDecode(await response.stream.bytesToString())['message'];
//
    // return UserModel.fromJson(jsonDecode(await response.stream.bytesToString())['message']);
  }

  UpdateNextKin({NextKinModel? model}) async {
    print(model!.data!.toJson());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '$baseUrl/api/user/next-kin/create-or-update?title=${model.data?.title}&name=${model.data?.name}&address=${model.data?.address}&city=${model.data?.city}&country=${model.data?.country}&zip_code=${model.data?.zipCode}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return jsonDecode(await response.stream.bytesToString())['message'];
  }

  GetNextKinApi() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var response = await http.get(Uri.parse('$baseUrl/api/user/next-kin/get'),
        headers: headers);

    if (response.statusCode == 200) {
      print("aaaaaa${response.body}");

      pref.setString('NextKin', response.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<NextKinModel> GetNextKinUi() async {
    // var response = await GetNextKinApi();
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // var data = pref.getString('NextKin');
    // return NextKinModel.fromJson(jsonDecode(data!));

    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    print(token);
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.Request(
      'GET',
      Uri.parse(
        '$baseUrl/api/user/next-kin/get',
      ),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return NextKinModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  GetNmcApi() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var response = await http.get(Uri.parse('$baseUrl/api/user/nmc-detail/get'),
        headers: headers);
    if (response.statusCode == 200) {
      print("kkkkkkkk${response.body}");
      pref.setString('NMC', response.body);
      return NmcModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<NmcModel> GetNmcUi() async {
    var response = await GetNmcApi();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getString('NMC');

    return NmcModel.fromJson(jsonDecode(data!));
  }

  UpdateNmc({NmcModel? model}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    print(model?.toJson());
    var request = http.Request(
        'POST',
        Uri.parse(
            '$baseUrl/api/user/nmc-detail/create-or-update?nmc_pin=${model!.data!.nmcPin}&expiry_date=${model.data!.expiryDate}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(response.reasonPhrase);
    return jsonDecode(await response.stream.bytesToString())['message'];
  }

  updateAccademicQualification({var uni, var degree, var year}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '$baseUrl/api/user/academic-qualification/create?degree=$degree&university=$uni&passing_year=$year'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return jsonDecode(await response.stream.bytesToString())['message'];
  }

  UpdateReference({
    var email,
    var name,
    var address,
    var jobTitle,
    var organization,
    var phoneNumber,
    var relation,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var response = await http.post(
        Uri.parse(
            '$baseUrl/api/user/reference/create?name=$name&job_title=$jobTitle&organization=$organization&address=$address&phone_number=$phoneNumber&email=$email&relation=$relation'),
        headers: headers);

    print(response.statusCode);
    if (response.statusCode == 429) {
      return 'Too many requests';
    }
    return jsonDecode(await response.body.toString())['message'];
  }

  EditReference(
      {var email,
      var name,
      var address,
      var jobTitle,
      var organization,
      var phoneNumber,
      var relation,
      var id}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'POST',
        Uri.parse(
            '$baseUrl/api/user/reference/edit?id=$id&name=$name&job_title=$jobTitle&organization=$organization&address=$address&phone_number=$phoneNumber&email=$email&relation=$relation'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return jsonDecode(await response.stream.bytesToString())['message'];
  }

  UpdateTrainingCert(
      {var completion, var expiry, List<File>? images, position}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/user/training-certificates/create'));
    request.fields.addAll({
      'date_of_completion': '$completion',
      'expiry_date': '$expiry',
      "doc_category": position
    });

    request.files.add(
        await http.MultipartFile.fromPath('image', images!.elementAt(0).path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String msg = jsonDecode(await response.stream.bytesToString())['message'];
    return msg;
  }

  Future<ReferenceModel> GetRef() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var response = await http.get(Uri.parse('$baseUrl/api/user/reference/get'),
        headers: headers);
    if (response.statusCode == 200) {
      return ReferenceModel.fromJson(jsonDecode(response.body));
    } else {
      return ReferenceModel.fromJson(jsonDecode(response.body));
    }
  }

  DeleteRef(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'DELETE', Uri.parse('$baseUrl/api/user/reference/delete?id=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString())['message'];
  }

  DeleteCert(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('DELETE',
        Uri.parse('$baseUrl/api/user/training-certificates/delete?id=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString())['message'];
  }

  DeleteQual(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request('DELETE',
        Uri.parse('$baseUrl/api/user/academic-qualification/delete?id=$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString())['message'];
  }

  Future<AccademicCertModel> GetCert() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');

    var headers = {'Authorization': 'Bearer $token'};
    var request = http.Request(
        'GET', Uri.parse('$baseUrl/api/user/training-certificates/get'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return AccademicCertModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      return AccademicCertModel.fromJson(
          jsonDecode(await response.stream.bytesToString()));
    }
  }

  Future<AccademicQualModel> GetQual() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var response = await http.get(
        Uri.parse('$baseUrl/api/user/academic-qualification/get'),
        headers: headers);
    if (response.statusCode == 200) {
      return AccademicQualModel.fromJson(jsonDecode(response.body));
    } else {
      return AccademicQualModel.fromJson(jsonDecode(response.body));
    }
  }

  ForgotPassword(String email, BuildContext context) async {
    try {
      var response = await http.post(
          Uri.parse("$baseUrl/api/user/forget-password/send-otp"),
          body: {"email": email});
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Please check your email, an otp has been send to your email",
          style: TextStyle(color: Colors.white),
        )));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const OtpVerificationPage(),
          ),
        );
        print(response.body.toString());
      } else {
        print(response.body.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  VerifyOtp(String otp, BuildContext context) async {
    try {
      Otp o = Otp(email: uemail, otp: otp);
      var response = await http.post(
          Uri.parse("$baseUrl/api/user/forget-password/verify-otp"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: jsonEncode(o.tojson()));
      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const UpdatePasswordPage(),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          response.body.toString(),
          style: const TextStyle(color: Colors.white),
        )));
      }
    } catch (e) {
      print("e");
    }
  }

  NewPassword(String npasword, BuildContext context) async {
    try {
      NewPasswordModel n = NewPasswordModel(email: uemail, password: npasword);
      var response = await http.post(
          Uri.parse("$baseUrl/api/user/forget-password/update"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: jsonEncode(n.tojson()));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Password has been Updated...Login Now",
          style: TextStyle(color: Colors.white),
        )));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpPage(),
          ),
        );
      }
    } catch (e) {}
  }
}
