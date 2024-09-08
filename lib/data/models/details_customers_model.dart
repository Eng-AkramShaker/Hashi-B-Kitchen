// To parse this JSON data, do
//
//     final modelDetailsCustomers = modelDetailsCustomersFromJson(jsonString);

import 'dart:convert';

ModelDetailsCustomers modelDetailsCustomersFromJson(String str) => ModelDetailsCustomers.fromJson(json.decode(str));

String modelDetailsCustomersToJson(ModelDetailsCustomers data) => json.encode(data.toJson());

class ModelDetailsCustomers {
  List<Map<String, String?>> message;

  ModelDetailsCustomers({
    required this.message,
  });

  factory ModelDetailsCustomers.fromJson(Map<String, dynamic> json) => ModelDetailsCustomers(
        message: List<Map<String, String?>>.from(
          json["message"].map(
            (x) => Map.from(x).map(
              (k, v) => MapEntry<String, String?>(k, v),
            ),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "message": List<dynamic>.from(
          message.map(
            (x) => Map.from(x).map(
              (k, v) => MapEntry<String, dynamic>(k, v),
            ),
          ),
        ),
      };
}
