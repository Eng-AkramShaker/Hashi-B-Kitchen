class OrderOptionsModel {
  OrderOptionsModel({
    required this.data,
  });

  final List<Order> data;

  factory OrderOptionsModel.fromJson(Map<dynamic, dynamic> json) {
    return OrderOptionsModel(
      data: json["data"] == null ? [] : List<Order>.from(json["data"].map((x) => Order.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}

class Order {
  Order({
    required this.name,
  });

  final String? name;

  factory Order.fromJson(Map<dynamic, dynamic> json) {
    return Order(
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
    };
  }
}
