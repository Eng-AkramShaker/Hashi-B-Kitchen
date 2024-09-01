class BestSellerModel {
  BestSellerModel({
    required this.message,
  });

  final List<Message> message;

  factory BestSellerModel.fromJson(Map<dynamic, dynamic> json) {
    return BestSellerModel(
      message: json["message"] == null ? [] : List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "message": List<dynamic>.from(message.map((x) => x.toJson())),
    };
  }
}

class Message {
  Message({
    required this.itemCode,
    required this.totalQty,
  });

  final String itemCode;
  final dynamic totalQty; // Use dynamic if totalQty can be multiple types

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    return Message(
      itemCode: json["item_code"] ?? '',
      totalQty: json["total_qty"] ?? 0,
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "item_code": itemCode,
      "total_qty": totalQty,
    };
  }
}
