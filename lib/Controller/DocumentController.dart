import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Application_Form/Model/get_passport.dart';
import '../Application_Form/Model/nmc-model.dart';
import '../Application_Form/Model/passport_model.dart';
import '../Application_Form/Model/term-lettter-model.dart';
import '../Application_Form/Model/vacinaction-proof-model.dart';
import '../Constants/Constant.dart';
import '../Model/address_proof_model.dart';
import '../Model/document_dbs_model.dart';
import '../Model/national-insurance-model.dart';
import '../Model/p45p46-model.dart';
import '../Model/right_to_work_model.dart';

var token;

class DocumentController {
  AddPassport({passportNumber, expiry, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/user/passport/store'));
    request.fields.addAll(
        {'passport_number': '$passportNumber', 'Expiry_date': '$expiry'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', element.path));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddDbs({number, expiry, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/user/enhanced-dbs-certificate/store'));
    request.fields.addAll({'dbs_number': '$number', 'Expiry_date': '$expiry'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', element.path));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  Addwork({type, number, expiry, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    var headers = {
      'Accept': 'application/json;charset=UTF-8',
      "Authorization": "Bearer $token"
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/user/right-to-work/store'));
    request.fields.addAll({
      'right_to_work_type': '$type',
      'british_residence_permit': '$number',
      'Expiry_date': '$expiry'
    });
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', element.path));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddProofOfAddress({type, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/user/proof-of-address/store'));
    request.fields.addAll({'type': '$type'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', element.path));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddNationalInsurance({number, expiry, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/user/naional-insurance/store'));
    request.fields
        .addAll({'insurance_number': '$number', 'Expiry_date': '$expiry'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', element.path));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddP45({type, expiry, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/user/P45-P46-P60/store'));
    request.fields.addAll({'type': '$type', 'Expiry_date': '$expiry'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', element.path));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  Addvaccination({type, date, name, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/user/vaccination-proof/store'));
    request.fields.addAll({
      'dose_type': '$type',
      'name_of_vaccine': '$name',
      'date_of_vaccine': '$date'
    });
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', element.path));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddNMC({number, date, List<File>? images}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/api/user/nmc-letter/store'));
    request.fields.addAll({'nmc_pin': '$number', 'Expiry_date': '$date'});
    images?.forEach((element) async {
      request.files
          .add(await http.MultipartFile.fromPath('image[]', element.path));
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return jsonDecode(await response.stream.bytesToString())['message'];
    }
    return;
  }

  AddTerm({date1, date2, List<File>? images}) async {
    try {
      print(date1);
      print(date2);
      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = await pref.getString('token');
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/api/user/term-letter/store'));
      request.fields
          .addAll({'term_letter_start': '$date1', 'term_letter_end': '$date2'});

      request.files.add(
          await http.MultipartFile.fromPath('image[]', images!.first.path));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return jsonDecode(await response.stream.bytesToString())['message'];
      }
      return;
    } catch (ex) {
      return ex;
    }
  }

  GetReference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    var headers = {'Authorization': 'Bearer $token'};

    var request =
        http.Request('GET', Uri.parse('$baseUrl/api/user/my-referral-id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    return jsonDecode(await response.stream.bytesToString())['data']
        ['referral_id'];
  }

  Future<ApiGetPassport> GetPassport() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');
    // var headers = {'Authorization': 'Bearer $token'};

    // var request =
    //     http.Request('GET', Uri.parse('$baseUrl/api/user/passport/get'));

    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();
    // // print("dddddd${response}");
    // return jsonDecode(await response.stream.bytesToString());
    // ['document_images'];
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('GET', Uri.parse('$baseUrl/api/user/passport/get'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      return ApiGetPassport.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return ApiGetPassport();
    }
  }

  Future<EnhancedDBSCertificate> GetDbsFromAPI() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseUrl/api/user/enhanced-dbs-certificate/get'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      return EnhancedDBSCertificate.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return EnhancedDBSCertificate();
    }
  }

  Future<RightToWorkModel> RightToWorkGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('GET', Uri.parse('$baseUrl/api/user/right-to-work/get'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      return RightToWorkModel.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return RightToWorkModel();
    }
  }

  Future<ProofOfAddressModel> ProofOfAddress() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseUrl/api/user/proof-of-address/get'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      // print("&&&&&&&&&&&&&&&&&&&&&&&&${await response.stream.bytesToString()}");
      return ProofOfAddressModel.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return ProofOfAddressModel();
    }
    return ProofOfAddressModel();
  }

  Future<NMCLetterModel> GetNmCLetter() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('GET', Uri.parse('$baseUrl/api/user/nmc-letter/get'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      return NMCLetterModel.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return NMCLetterModel();
    }
  }

  Future<VaccinationProofModel> VacinationProofGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseUrl/api/user/vaccination-proof/get'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      return VaccinationProofModel.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return VaccinationProofModel();
    }
  }

  Future<TermLetterModel> TermLetterGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('GET', Uri.parse('$baseUrl/api/user/term-letter/get'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      return TermLetterModel.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return TermLetterModel();
    }
  }

  Future<P45P46P60Model> P40P46Get() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.Request('GET', Uri.parse('$baseUrl/api/user/P45-P46-P60/get'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      return P45P46P60Model.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return P45P46P60Model();
    }
  }

  Future<NationalInsuranceModel> NationalInsuranceGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = await pref.getString('token');

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseUrl/api/user/naional-insurance/get'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      return NationalInsuranceModel.fromJson(json
          .decode(await response.stream.asBroadcastStream().bytesToString()));
    } else {
      print(response.reasonPhrase);
      return NationalInsuranceModel();
    }
  }
}
