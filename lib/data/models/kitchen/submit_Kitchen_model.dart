class SubmitKitchenModel {
  SubmitKitchenModel({
    required this.message,
  });

  final Message? message;

  factory SubmitKitchenModel.fromJson(Map<String, dynamic> json) {
    return SubmitKitchenModel(
      message: json["message"] == null ? null : Message.fromJson(json["message"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message?.toJson(),
      };
}

class Message {
  Message({
    required this.deliveries,
  });

  final List<Delivery> deliveries;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      deliveries: json["deliveries"] == null ? [] : List<Delivery>.from(json["deliveries"]!.map((x) => Delivery.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "deliveries": deliveries.map((x) => x.toJson()).toList(),
      };
}

class Delivery {
  Delivery({
    required this.deliveryNote,
    required this.salesInvoice,
    required this.orderType,
    required this.status,
    required this.postingDate,
    required this.postingTime,
    required this.items,
  });

  final String? deliveryNote;
  final String? salesInvoice;
  final String? orderType;
  final String? status;
  final String? postingDate;
  final String? postingTime;
  final List<Item> items;

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      deliveryNote: json["delivery_note"],
      salesInvoice: json["sales_invoice"],
      orderType: json["order_type"],
      status: json["status"],
      postingDate: json["posting_date"],
      postingTime: json["posting_time"],
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "delivery_note": deliveryNote,
        "sales_invoice": salesInvoice,
        "order_type": orderType,
        "status": status,
        "posting_date": postingDate,
        "items": items.map((x) => x.toJson()).toList(),
      };
}

class Item {
  Item({
    required this.itemCode,
    required this.itemName,
    required this.qty,
  });

  final String? itemCode;
  final String? itemName;
  final double? qty;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemCode: json["item_code"],
      itemName: json["item_name"],
      qty: json["qty"],
    );
  }

  Map<String, dynamic> toJson() => {
        "item_code": itemCode,
        "item_name": itemName,
        "qty": qty,
      };
}
