class ModelSerialNumber {
  ModelSerialNumber({
    required this.message,
  });

  final List<Datum> message;

  factory ModelSerialNumber.fromJson(Map<dynamic, dynamic> json) {
    return ModelSerialNumber(
      message: json["message"] == null ? [] : List<Datum>.from(json["message"].map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message.map((x) => x.toJson()).toList(),
    };
  }
}

class Datum {
  Datum({
    required this.name,
  });

  final String name;

  factory Datum.fromJson(Map<dynamic, dynamic> json) {
    return Datum(
      name: json["name"] ?? '',
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "name": name,
    };
  }
}
