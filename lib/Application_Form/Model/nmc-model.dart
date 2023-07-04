class NMCLetterModel {
  int? status;
  String? message;
  List<Data>? data;

  NMCLetterModel({this.status, this.message, this.data});

  NMCLetterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? nmcPin;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;
  List<DocumentImages>? documentImages;

  Data(
      {this.id,
      this.userId,
      this.nmcPin,
      this.expiryDate,
      this.createdAt,
      this.updatedAt,
      this.documentImages});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    nmcPin = json['nmc_pin'];
    expiryDate = json['Expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['document_images'] != null) {
      documentImages = <DocumentImages>[];
      json['document_images'].forEach((v) {
        documentImages!.add(new DocumentImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['nmc_pin'] = this.nmcPin;
    data['Expiry_date'] = this.expiryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.documentImages != null) {
      data['document_images'] =
          this.documentImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DocumentImages {
  int? id;
  String? documentId;
  var userId;
  String? type;
  String? upload;
  String? createdAt;
  String? updatedAt;

  DocumentImages(
      {this.id,
      this.documentId,
      this.userId,
      this.type,
      this.upload,
      this.createdAt,
      this.updatedAt});

  DocumentImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentId = json['document_id'];
    userId = json['user_id'];
    type = json['type'];
    upload = json['Upload'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['document_id'] = this.documentId;
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['Upload'] = this.upload;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
