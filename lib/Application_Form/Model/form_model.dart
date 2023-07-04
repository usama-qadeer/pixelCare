class FormModel {
  int? status;
  String? message;
  Applicationform? applicationform;

  FormModel({this.status, this.message, this.applicationform});

  FormModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    applicationform = json['applicationform'] != null
        ? new Applicationform.fromJson(json['applicationform'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.applicationform != null) {
      data['applicationform'] = this.applicationform!.toJson();
    }
    return data;
  }
}

class Applicationform {
  int? id;
  String? postAppliedFor;
  String? howHeardVacancy;
  String? companyName;
  String? incorporationNumber;
  String? weeklyHoursAllowed;
  String? userId;
  String? status;
  var statusComment;
  String? createdAt;
  String? updatedAt;

  Applicationform(
      {this.id,
      this.postAppliedFor,
      this.howHeardVacancy,
      this.companyName,
      this.incorporationNumber,
      this.weeklyHoursAllowed,
      this.userId,
      this.status,
      this.statusComment,
      this.createdAt,
      this.updatedAt});

  Applicationform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postAppliedFor = json['post_applied_for'];
    howHeardVacancy = json['how_heard_vacancy'];
    companyName = json['company_name'];
    incorporationNumber = json['incorporation_number'];
    weeklyHoursAllowed = json['weekly_hours_allowed'];
    userId = json['user_id'];
    status = json['status'];
    statusComment = json['status_comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_applied_for'] = this.postAppliedFor;
    data['how_heard_vacancy'] = this.howHeardVacancy;
    data['company_name'] = this.companyName;
    data['incorporation_number'] = this.incorporationNumber;
    data['weekly_hours_allowed'] = this.weeklyHoursAllowed;
    data['user_id'] = this.userId;
    data['status'] = this.status;
    data['status_comment'] = this.statusComment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
