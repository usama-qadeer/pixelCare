class RelevantModel {
  int? status;
  String? message;
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  var nextPageUrl;
  String? path;
  int? perPage;
  var prevPageUrl;
  int? to;
  int? total;

  RelevantModel(
      {this.status,
      this.message,
      this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  RelevantModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  var careHomeId;
  String? position;
  String? title;
  var image;
  String? description;
  String? date;
  var jobEndDate;
  String? timeStart;
  String? timeEnd;
  String? noOfStaff;
  String? shift;
  var deleatedAt;
  String? createdAt;
  String? updatedAt;
  CareHome? careHome;

  Data(
      {this.id,
      this.careHomeId,
      this.position,
      this.title,
      this.image,
      this.description,
      this.date,
      this.jobEndDate,
      this.timeStart,
      this.timeEnd,
      this.noOfStaff,
      this.shift,
      this.deleatedAt,
      this.createdAt,
      this.updatedAt,
      this.careHome});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    careHomeId = json['care_home_id'];
    position = json['position'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    date = json['date'];
    jobEndDate = json['job_end_date'];
    timeStart = json['time_start'];
    timeEnd = json['time_end'];
    noOfStaff = json['no_of_staff'];
    shift = json['shift'];
    deleatedAt = json['deleated_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    careHome = json['care_home'] != null
        ? new CareHome.fromJson(json['care_home'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['care_home_id'] = this.careHomeId;
    data['position'] = this.position;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['date'] = this.date;
    data['job_end_date'] = this.jobEndDate;
    data['time_start'] = this.timeStart;
    data['time_end'] = this.timeEnd;
    data['no_of_staff'] = this.noOfStaff;
    data['shift'] = this.shift;
    data['deleated_at'] = this.deleatedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.careHome != null) {
      data['care_home'] = this.careHome!.toJson();
    }
    return data;
  }
}

class CareHome {
  int? id;
  String? groupName;
  String? name;
  var image;
  String? cityId;
  String? postalCode;
  String? address;
  String? contactNumber;
  String? managerName;
  String? managerEmail;
  String? adminName;
  String? adminEmail;
  String? accountantName;
  String? accountantEmail;
  String? hourlyRate;
  String? careHomeRateTypeId;
  String? paymentTerms;
  var website;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? careHomeUserId;

  CareHome(
      {this.id,
      this.groupName,
      this.name,
      this.image,
      this.cityId,
      this.postalCode,
      this.address,
      this.contactNumber,
      this.managerName,
      this.managerEmail,
      this.adminName,
      this.adminEmail,
      this.accountantName,
      this.accountantEmail,
      this.hourlyRate,
      this.careHomeRateTypeId,
      this.paymentTerms,
      this.website,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.careHomeUserId});

  CareHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['group_name'];
    name = json['name'];
    image = json['image'];
    cityId = json['city_id'];
    postalCode = json['postal_code'];
    address = json['address'];
    contactNumber = json['contact_number'];
    managerName = json['manager_name'];
    managerEmail = json['manager_email'];
    adminName = json['admin_name'];
    adminEmail = json['admin_email'];
    accountantName = json['accountant_name'];
    accountantEmail = json['accountant_email'];
    hourlyRate = json['hourly_rate'];
    careHomeRateTypeId = json['care_home_rate_type_id'];
    paymentTerms = json['payment_terms'];
    website = json['website'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    careHomeUserId = json['care_home_user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['group_name'] = this.groupName;
    data['name'] = this.name;
    data['image'] = this.image;
    data['city_id'] = this.cityId;
    data['postal_code'] = this.postalCode;
    data['address'] = this.address;
    data['contact_number'] = this.contactNumber;
    data['manager_name'] = this.managerName;
    data['manager_email'] = this.managerEmail;
    data['admin_name'] = this.adminName;
    data['admin_email'] = this.adminEmail;
    data['accountant_name'] = this.accountantName;
    data['accountant_email'] = this.accountantEmail;
    data['hourly_rate'] = this.hourlyRate;
    data['care_home_rate_type_id'] = this.careHomeRateTypeId;
    data['payment_terms'] = this.paymentTerms;
    data['website'] = this.website;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['care_home_user_id'] = this.careHomeUserId;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
