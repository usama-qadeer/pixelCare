// // ignore_for_file: file_names

// class UserModel {
//   int? status;
//   String? message;
//   Data? data;
//   String? token;

//   UserModel({this.status, this.message, this.data, this.token});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     token = json['token'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['token'] = this.token;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   var name;
//   String? phone;
//   String? email;
//   String? country;
//   String? hourlyRate;
//   String? dob;
//   String? status;
//   String? type;
//   String? avatar;
//   String? nextOfKin;
//   String? isBlocked;
//   dynamic createdAt;
//   dynamic updatedAt;

//   Data(
//       {this.id,
//       this.name,
//       this.phone,
//       this.email,
//       this.country,
//       this.hourlyRate,
//       this.dob,
//       this.status,
//       this.type,
//       this.avatar,
//       this.nextOfKin,
//       this.isBlocked,
//       this.createdAt,
//       this.updatedAt});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     country = json['country'];
//     hourlyRate = json['hourly_rate'];
//     dob = json['dob'];
//     status = json['status'];
//     type = json['type'];
//     avatar = json['avatar'];
//     nextOfKin = json['next_of_kin'];
//     isBlocked = json['is_blocked'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['country'] = this.country;
//     data['hourly_rate'] = this.hourlyRate;
//     data['dob'] = this.dob;
//     data['status'] = this.status;
//     data['type'] = this.type;
//     data['avatar'] = this.avatar;
//     data['next_of_kin'] = this.nextOfKin;
//     data['is_blocked'] = this.isBlocked;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     //print("jjjj${phone}");
//     return data;
//   }
// }
class UserModel {
  int? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phone;
  String? email;
  var emailOtp;
  String? country;
  String? hourlyRate;
  String? dob;
  String? status;
  var statusComment;
  var temporaryBlockStart;
  var temporaryBlockEnd;
  var type;
  var avatar;
  String? nextOfKin;
  String? referralId;
  var refferBy;
  String? isBlocked;
  String? role;
  String? registerSource;
  String? createdAt;
  String? updatedAt;
  UserNmcDetail? userNmcDetail;
  UserNextOfKin? userNextOfKin;
  ApplicationFormNextOfKin? applicationFormNextOfKin;
  ApplicationFormNmcDetail? applicationFormNmcDetail;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.emailOtp,
      this.country,
      this.hourlyRate,
      this.dob,
      this.status,
      this.statusComment,
      this.temporaryBlockStart,
      this.temporaryBlockEnd,
      this.type,
      this.avatar,
      this.nextOfKin,
      this.referralId,
      this.refferBy,
      this.isBlocked,
      this.role,
      this.registerSource,
      this.createdAt,
      this.updatedAt,
      this.userNmcDetail,
      this.userNextOfKin,
      this.applicationFormNextOfKin,
      this.applicationFormNmcDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    emailOtp = json['email_otp'];
    country = json['country'];
    hourlyRate = json['hourly_rate'];
    dob = json['dob'];
    status = json['status'];
    statusComment = json['status_comment'];
    temporaryBlockStart = json['temporary_block_start'];
    temporaryBlockEnd = json['temporary_block_end'];
    type = json['type'];
    avatar = json['avatar'];
    nextOfKin = json['next_of_kin'];
    referralId = json['referral_id'];
    refferBy = json['reffer_by'];
    isBlocked = json['is_blocked'];
    role = json['role'];
    registerSource = json['register_source'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userNmcDetail = json['user_nmc_detail'] != null
        ? new UserNmcDetail.fromJson(json['user_nmc_detail'])
        : null;
    userNextOfKin = json['user_next_of_kin'] != null
        ? new UserNextOfKin.fromJson(json['user_next_of_kin'])
        : null;
    applicationFormNextOfKin = json['application_form_next_of_kin'] != null
        ? new ApplicationFormNextOfKin.fromJson(
            json['application_form_next_of_kin'])
        : null;
    applicationFormNmcDetail = json['application_form_nmc_detail'] != null
        ? new ApplicationFormNmcDetail.fromJson(
            json['application_form_nmc_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_otp'] = this.emailOtp;
    data['country'] = this.country;
    data['hourly_rate'] = this.hourlyRate;
    data['dob'] = this.dob;
    data['status'] = this.status;
    data['status_comment'] = this.statusComment;
    data['temporary_block_start'] = this.temporaryBlockStart;
    data['temporary_block_end'] = this.temporaryBlockEnd;
    data['type'] = this.type;
    data['avatar'] = this.avatar;
    data['next_of_kin'] = this.nextOfKin;
    data['referral_id'] = this.referralId;
    data['reffer_by'] = this.refferBy;
    data['is_blocked'] = this.isBlocked;
    data['role'] = this.role;
    data['register_source'] = this.registerSource;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userNmcDetail != null) {
      data['user_nmc_detail'] = this.userNmcDetail!.toJson();
    }
    if (this.userNextOfKin != null) {
      data['user_next_of_kin'] = this.userNextOfKin!.toJson();
    }
    if (this.applicationFormNextOfKin != null) {
      data['application_form_next_of_kin'] =
          this.applicationFormNextOfKin!.toJson();
    }
    if (this.applicationFormNmcDetail != null) {
      data['application_form_nmc_detail'] =
          this.applicationFormNmcDetail!.toJson();
    }
    return data;
  }
}

class UserNmcDetail {
  int? id;
  int? userId;
  String? nmcPin;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;

  UserNmcDetail(
      {this.id,
      this.userId,
      this.nmcPin,
      this.expiryDate,
      this.createdAt,
      this.updatedAt});

  UserNmcDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    nmcPin = json['nmc_pin'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['nmc_pin'] = this.nmcPin;
    data['expiry_date'] = this.expiryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UserNextOfKin {
  int? id;
  String? userId;
  String? title;
  String? name;
  String? address;
  String? city;
  String? country;
  String? zipCode;
  String? createdAt;
  String? updatedAt;

  UserNextOfKin(
      {this.id,
      this.userId,
      this.title,
      this.name,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.createdAt,
      this.updatedAt});

  UserNextOfKin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    zipCode = json['zip_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['zip_code'] = this.zipCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ApplicationFormNextOfKin {
  int? id;
  int? applicationFormId;
  int? userId;
  String? title;
  String? surname;
  String? forename;
  String? dob;
  String? postalCode;
  String? address;
  String? homeTel;
  String? dayTimeContact;
  String? email;
  String? relationToYou;
  String? createdAt;
  String? updatedAt;

  ApplicationFormNextOfKin(
      {this.id,
      this.applicationFormId,
      this.userId,
      this.title,
      this.surname,
      this.forename,
      this.dob,
      this.postalCode,
      this.address,
      this.homeTel,
      this.dayTimeContact,
      this.email,
      this.relationToYou,
      this.createdAt,
      this.updatedAt});

  ApplicationFormNextOfKin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    applicationFormId = json['application_form_id'];
    userId = json['user_id'];
    title = json['title'];
    surname = json['surname'];
    forename = json['forename'];
    dob = json['dob'];
    postalCode = json['postal_code'];
    address = json['address'];
    homeTel = json['home_tel'];
    dayTimeContact = json['day_time_contact'];
    email = json['email'];
    relationToYou = json['relation_to_you'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['application_form_id'] = this.applicationFormId;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['surname'] = this.surname;
    data['forename'] = this.forename;
    data['dob'] = this.dob;
    data['postal_code'] = this.postalCode;
    data['address'] = this.address;
    data['home_tel'] = this.homeTel;
    data['day_time_contact'] = this.dayTimeContact;
    data['email'] = this.email;
    data['relation_to_you'] = this.relationToYou;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ApplicationFormNmcDetail {
  int? id;
  int? applicationFormId;
  int? userId;
  String? nmcPinNo;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;

  ApplicationFormNmcDetail(
      {this.id,
      this.applicationFormId,
      this.userId,
      this.nmcPinNo,
      this.expiryDate,
      this.createdAt,
      this.updatedAt});

  ApplicationFormNmcDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    applicationFormId = json['application_form_id'];
    userId = json['user_id'];
    nmcPinNo = json['nmc_pin_no'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['application_form_id'] = this.applicationFormId;
    data['user_id'] = this.userId;
    data['nmc_pin_no'] = this.nmcPinNo;
    data['expiry_date'] = this.expiryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
