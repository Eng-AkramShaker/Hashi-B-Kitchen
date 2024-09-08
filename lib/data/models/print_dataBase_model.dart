// ignore_for_file: file_names

class GetPrintDataBaseModel {
  GetPrintDataBaseModel({
    required this.message,
  });

  final List<Message> message;

  factory GetPrintDataBaseModel.fromJson(Map<String, dynamic> json) {
    return GetPrintDataBaseModel(
      message: json["message"] == null ? [] : List<Message>.from(json["message"]!.map((x) => Message.fromJson(x))),
    );
  }
}

class Message {
  Message({
    required this.printName,
    required this.printIp,
  });

  final String? printName;
  final String? printIp;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      printName: json["print_name"],
      printIp: json["print_ip"],
    );
  }
}
