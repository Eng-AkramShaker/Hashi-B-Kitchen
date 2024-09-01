class GroupProductModel {
  GroupProductModel({required this.message});

  final List<Message> message;

  factory GroupProductModel.fromJson(Map<dynamic, dynamic> json) {
    return GroupProductModel(
      message: json["message"] == null ? [] : List<Message>.from(json["message"]!.map((x) => Message.fromJson(x))),
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
    required this.itemGroup,
    required this.groupImage,
    required this.items,
  });

  final String? itemGroup;
  final String? groupImage;
  final List<Item> items;

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    return Message(
      itemGroup: json["item_group"],
      groupImage: json["group_image"],
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "item_group": itemGroup,
      "group_image": groupImage,
      "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
  }
}

class Item {
  Item({
    required this.name,
    required this.customProductSubcategory,
    required this.customClasses,
    required this.valuationRate,
    required this.image,
    required this.stockQty,
    required this.priceRate,
  });

  final String? name;
  final String? customProductSubcategory;
  final String? customClasses;
  var valuationRate;
  final String? image;
  var stockQty;
  final double? priceRate;

  factory Item.fromJson(Map<dynamic, dynamic> json) {
    return Item(
      name: json["name"],
      customProductSubcategory: json["custom_product_subcategory"],
      customClasses: json["custom_classes"],
      valuationRate: json["valuation_rate"]?.toDouble(),
      image: json["image"],
      stockQty: json["stock_qty"],
      priceRate: json["price_rate"]?.toDouble(),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "name": name,
      "custom_product_subcategory": customProductSubcategory,
      "custom_classes": customClasses,
      "valuation_rate": valuationRate,
      "image": image,
      "stock_qty": stockQty,
      "price_rate": priceRate,
    };
  }
}
