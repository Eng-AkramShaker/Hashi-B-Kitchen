class FundAmountModel {
  FundAmountModel({
    required this.message,
  });

  final Message? message;

  factory FundAmountModel.fromJson(Map<String, dynamic> json) {
    return FundAmountModel(
      message: json["message"] == null ? null : Message.fromJson(json["message"]),
    );
  }
}

class Message {
  Message({
    required this.message,
    required this.posCasher,
  });

  final String? message;
  final PosCasher? posCasher;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json["message"],
      posCasher: json["pos_casher"] == null ? null : PosCasher.fromJson(json["pos_casher"]),
    );
  }
}

class PosCasher {
  PosCasher({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.docstatus,
    required this.idx,
    required this.startCasherAmount,
    required this.employee,
    required this.actually_casher_amount,
    required this.currentCasherAmount,
    required this.transactionDate,
    required this.doctype,
  });

  final String? name;
  final String? owner;
  final DateTime? creation;
  final DateTime? modified;
  final String? modifiedBy;
  var docstatus;
  var idx;
  var startCasherAmount;
  var employee;
  var actually_casher_amount;
  var currentCasherAmount;
  var transactionDate;
  final String? doctype;

  factory PosCasher.fromJson(Map<String, dynamic> json) {
    return PosCasher(
      name: json["name"],
      owner: json["owner"],
      creation: DateTime.tryParse(json["creation"] ?? ""),
      modified: DateTime.tryParse(json["modified"] ?? ""),
      modifiedBy: json["modified_by"],
      docstatus: json["docstatus"],
      idx: json["idx"],
      startCasherAmount: json["start_casher_amount"],
      employee: json["employee"],
      actually_casher_amount: json["actually_casher_amount"],
      currentCasherAmount: json["current_casher_amount"],
      transactionDate: DateTime.tryParse(json["transaction_date"] ?? ""),
      doctype: json["doctype"],
    );
  }
}
