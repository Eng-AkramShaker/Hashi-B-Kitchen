class ModelPayment {
  ModelPayment({
    required this.message,
  });

  final List<Message> message;

  factory ModelPayment.fromJson(Map<String, dynamic> json) {
    return ModelPayment(
      message: json["message"] == null
          ? []
          : List<Message>.from((json["message"] as List<dynamic>).map((x) => Message.fromJson(x as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message.map((e) => e.toJson()).toList(),
    };
  }
}

class Message {
  Message({
    required this.name,
    required this.type,
    required this.accounts,
  });

  final String? name;
  final String? type;
  final List<Account> accounts;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      name: json["name"] as String?,
      type: json["type"] as String?,
      accounts: json["accounts"] == null
          ? []
          : List<Account>.from((json["accounts"] as List<dynamic>).map((x) => Account.fromJson(x as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'accounts': accounts.map((e) => e.toJson()).toList(),
    };
  }
}

class Account {
  Account({
    required this.alphaInvestment,
    required this.alphaInvestmentDemo,
    required this.hashiBasha,
  });

  final String? alphaInvestment;
  final String? alphaInvestmentDemo;
  final String? hashiBasha;

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      alphaInvestment: json["Alpha Investment"] as String?,
      alphaInvestmentDemo: json["Alpha Investment (Demo)"] as String?,
      hashiBasha: json["Hashi Basha"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Alpha Investment': alphaInvestment,
      'Alpha Investment (Demo)': alphaInvestmentDemo,
      'Hashi Basha': hashiBasha,
    };
  }
}
