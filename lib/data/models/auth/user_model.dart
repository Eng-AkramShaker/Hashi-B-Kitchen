// ignore_for_file: camel_case_types

class ModelUser {
  ModelUser({
    required this.message,
    required this.homePage,
    required this.fullName,
  });

  final Message? message;
  final String? homePage;
  final String? fullName;

  factory ModelUser.fromJson(Map<dynamic, dynamic> json) {
    return ModelUser(
      message: json["message"] == null ? null : Message.fromJson(json["message"]),
      homePage: json["home_page"],
      fullName: json["full_name"],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "message": message?.toJson(),
      "home_page": homePage,
      "full_name": fullName,
    };
  }
}

class Message {
  Message({
    required this.status,
    required this.message,
    required this.my_user,
  });

  final String? status;
  final String? message;
  final My_User? my_user;

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    return Message(
      status: json["status"],
      message: json["message"],
      my_user: json["user"] == null ? null : My_User.fromJson(json["user"]),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "user": my_user?.toJson(),
    };
  }
}

class My_User {
  My_User({
    required this.name,
    required this.email,
    required this.branch,
    required this.companyName,
    required this.taxId,
    required this.companyAddress,
    required this.companySocialMediaSnap,
    required this.companySocialMediaInsta,
    required this.companySocialMediaTwitter,
    required this.companyWebsiteLink,
    required this.companyPhoneNumber,
  });

  final String? name;
  final String? email;
  final String? branch;
  final String? companyName;
  final String? taxId;
  final String? companyAddress;
  final String? companySocialMediaSnap;
  final String? companySocialMediaInsta;
  final String? companySocialMediaTwitter;
  final String? companyWebsiteLink;
  final String? companyPhoneNumber;

  factory My_User.fromJson(Map<dynamic, dynamic> json) {
    return My_User(
      name: json["name"],
      email: json["email"],
      branch: json["branch"],
      companyName: json["company_name"],
      taxId: json["tax_id"],
      companyAddress: json["company_address"],
      companySocialMediaSnap: json["company_social_media_snap"],
      companySocialMediaInsta: json["company_social_media_insta"],
      companySocialMediaTwitter: json["company_social_media_twitter"],
      companyWebsiteLink: json["company_website_link"],
      companyPhoneNumber: json["company_phone_number"],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "branch": branch,
      "company_name": companyName,
      "tax_id": taxId,
      "company_address": companyAddress,
      "company_social_media_snap": companySocialMediaSnap,
      "company_social_media_insta": companySocialMediaInsta,
      "company_social_media_twitter": companySocialMediaTwitter,
      "company_website_link": companyWebsiteLink,
      "company_phone_number": companyPhoneNumber,
    };
  }
}
