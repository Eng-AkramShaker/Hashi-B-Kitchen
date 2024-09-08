// ignore_for_file: prefer_typing_uninitialized_variables

class EndShiftModel {
  EndShiftModel({
    required this.message,
  });

  final Message? message;

  factory EndShiftModel.fromJson(Map<String, dynamic> json) {
    return EndShiftModel(
      message: json["message"] == null ? null : Message.fromJson(json["message"]),
    );
  }
}

class Message {
  Message({
    required this.msg,
    required this.currentCasherAmount,
    required this.actuallyCasherAmount,
    required this.closedDate,
  });

  final String? msg;
  var currentCasherAmount;
  var actuallyCasherAmount;
  final DateTime? closedDate;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      msg: json["msg"],
      currentCasherAmount: json["current_casher_amount"],
      actuallyCasherAmount: json["actually_casher_amount"],
      closedDate: DateTime.tryParse(json["closed_date"] ?? ""),
    );
  }
}
