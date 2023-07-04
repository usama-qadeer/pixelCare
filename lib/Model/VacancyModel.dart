// class vacancyModel {
//   int? status;
//   String? message;
//   int? currentPage;
//   List<Data>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Links>? links;
//   String? nextPageUrl;
//   String? path;
//   int? perPage;
//   String? prevPageUrl;
//   int? to;
//   int? total;

//   vacancyModel(
//       {this.status,
//       this.message,
//       this.currentPage,
//       this.data,
//       this.firstPageUrl,
//       this.from,
//       this.lastPage,
//       this.lastPageUrl,
//       this.links,
//       this.nextPageUrl,
//       this.path,
//       this.perPage,
//       this.prevPageUrl,
//       this.to,
//       this.total});

//   vacancyModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     if (json['links'] != null) {
//       links = <Links>[];
//       json['links'].forEach((v) {
//         links!.add(new Links.fromJson(v));
//       });
//     }
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     data['current_page'] = this.currentPage;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['first_page_url'] = this.firstPageUrl;
//     data['from'] = this.from;
//     data['last_page'] = this.lastPage;
//     data['last_page_url'] = this.lastPageUrl;
//     if (this.links != null) {
//       data['links'] = this.links!.map((v) => v.toJson()).toList();
//     }
//     data['next_page_url'] = this.nextPageUrl;
//     data['path'] = this.path;
//     data['per_page'] = this.perPage;
//     data['prev_page_url'] = this.prevPageUrl;
//     data['to'] = this.to;
//     data['total'] = this.total;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   dynamic? careHomeId;
//   dynamic? position;
//   dynamic? title;
//   dynamic? image;
//   dynamic? description;
//   dynamic? date;
//   DateTime? jobEndDate;
//   dynamic? timeStart;
//   dynamic? timeEnd;
//   dynamic noOfStaff;
//   dynamic? shift;
//   Null? deleatedAt;
//   dynamic? createdAt;
//   dynamic updatedAt;
//   dynamic shiftDetailName;
//   CareHome? careHome;
//   CareHomeJobApplied? careHomeJobApplied;

//   Data(
//       {this.id,
//       this.careHomeId,
//       this.title,
//       this.image,
//       this.description,
//       this.date,
//       this.timeStart,
//       this.timeEnd,
//       this.deleatedAt,
//       this.createdAt,
//       this.updatedAt,
//       this.careHome,
//       this.careHomeJobApplied,
//       this.shift,
//       this.shiftDetailName,
//       this.noOfStaff,
//       this.jobEndDate,
//       this.position});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     careHomeId = json['care_home_id'];
//     position = json['position'];
//     title = json['title'];
//     image = json['image'];
//     description = json['description'];
//     date = json['date'];
//     jobEndDate = json["job_end_date"] != null
//         ? DateTime.parse(json["job_end_date"])
//         : null;
//     timeStart = json['time_start'];
//     timeEnd = json['time_end'];
//     noOfStaff = json['no_of_staff'];
//     shift = json['shift'];
//     deleatedAt = json['deleated_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     shiftDetailName = json['shift_detail_name'];
//     careHome = json['care_home'] != null
//         ? new CareHome.fromJson(json['care_home'])
//         : null;
//     careHomeJobApplied = json['care_home_job_applied'] != null
//         ? new CareHomeJobApplied.fromJson(json['care_home_job_applied'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['care_home_id'] = this.careHomeId;
//     data['position'] = this.position;
//     data['title'] = this.title;
//     data['image'] = this.image;
//     data['description'] = this.description;
//     data['date'] = this.date;
//     data['job_end_date'] = this.jobEndDate;
//     data['time_start'] = this.timeStart;
//     data['time_end'] = this.timeEnd;
//     data['no_of_staff'] = this.noOfStaff;
//     data['shift'] = this.shift;
//     data['deleated_at'] = this.deleatedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['shift_detail_name'] = this.shiftDetailName;
//     if (this.careHome != null) {
//       data['care_home'] = this.careHome!.toJson();
//     }
//     if (this.careHomeJobApplied != null) {
//       data['care_home_job_applied'] = this.careHomeJobApplied!.toJson();
//     }
//     return data;
//   }
// }

// class CareHome {
//   int? id;
//   dynamic? name;
//   dynamic? image;
//   dynamic? hourlyRate;
//   dynamic? status;
//   dynamic? createdAt;
//   dynamic? updatedAt;

//   CareHome(
//       {this.id,
//       this.name,
//       this.image,
//       this.hourlyRate,
//       this.status,
//       this.createdAt,
//       this.updatedAt});

//   CareHome.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     image = json['image'];
//     hourlyRate = json['hourly_rate'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['image'] = this.image;
//     data['hourly_rate'] = this.hourlyRate;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class CareHomeJobApplied {
//   int? id;
//   dynamic? careHomeJobId;
//   dynamic? status;

//   CareHomeJobApplied({this.id, this.careHomeJobId, this.status});

//   CareHomeJobApplied.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     careHomeJobId = json['care_home_job_id'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['care_home_job_id'] = this.careHomeJobId;
//     data['status'] = this.status;
//     return data;
//   }
// }

// class Links {
//   dynamic? url;
//   dynamic? label;
//   bool? active;

//   Links({this.url, this.label, this.active});

//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['label'] = this.label;
//     data['active'] = this.active;
//     return data;
//   }
// }

//// Update model 20 - 06 -2023
///
///

class VacancyModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  VacancyModel(
      {this.currentPage,
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

  VacancyModel.fromJson(Map<String, dynamic> json) {
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
  int? careHomeId;
  String? position;
  String? numberOfStaff;
  String? shiftDetail;
  String? startDate;
  String? endDate;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? statusName;
  String? shiftDetailName;
  String? positionName;
  CareHome? careHome;

  Data(
      {this.id,
      this.careHomeId,
      this.position,
      this.numberOfStaff,
      this.shiftDetail,
      this.startDate,
      this.endDate,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.statusName,
      this.shiftDetailName,
      this.positionName,
      this.careHome});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    careHomeId = json['care_home_id'];
    position = json['position'];
    numberOfStaff = json['number_of_staff'];
    shiftDetail = json['shift_detail'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    statusName = json['status_name'];
    shiftDetailName = json['shift_detail_name'];
    positionName = json['position_name'];
    careHome = json['care_home'] != null
        ? new CareHome.fromJson(json['care_home'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['care_home_id'] = this.careHomeId;
    data['position'] = this.position;
    data['number_of_staff'] = this.numberOfStaff;
    data['shift_detail'] = this.shiftDetail;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status_name'] = this.statusName;
    data['shift_detail_name'] = this.shiftDetailName;
    data['position_name'] = this.positionName;
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
  Null? image;
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
  Null? website;
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
