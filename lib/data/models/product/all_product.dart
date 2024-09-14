import 'dart:convert';

// لتحليل بيانات JSON، استخدم:
// final allProduct = allProductFromJson(jsonString);

AllProduct allProductFromJson(String str) => AllProduct.fromJson(json.decode(str));

class AllProduct {
  AllProduct({required this.message});

  final List<Message> message;

  factory AllProduct.fromJson(Map<dynamic, dynamic> json) {
    return AllProduct(
      message: json["message"] == null ? [] : List<Message>.from(json["message"].map((x) => Message.fromJson(x))),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "message": message.map((x) => x.toJson()).toList(),
    };
  }
}

class Message {
  Message({
    required this.name,
    required this.itemGroup,
    required this.customProductSubcategory,
    required this.customClasses,
    required this.valuationRate,
    required this.image,
  });

  final String? name;
  final String? itemGroup;
  final String? customProductSubcategory;
  final String? customClasses;
  final double? valuationRate;
  final String? image;

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    return Message(
      name: json["name"],
      itemGroup: json["item_group"],
      customProductSubcategory: json["custom_product_subcategory"],
      customClasses: json["custom_classes"],
      valuationRate: json["valuation_rate"] != null
          ? (json["valuation_rate"] is int ? (json["valuation_rate"] as int).toDouble() : json["valuation_rate"].toDouble())
          : null,
      image: json["image"],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "name": name,
      "item_group": itemGroup,
      "custom_product_subcategory": customProductSubcategory,
      "custom_classes": customClasses,
      "valuation_rate": valuationRate,
      "image": image,
    };
  }
}
