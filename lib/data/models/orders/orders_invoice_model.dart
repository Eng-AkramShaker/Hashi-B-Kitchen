// ignore_for_file: prefer_typing_uninitialized_variables

class OrdersInvoiceModel {
  OrdersInvoiceModel({
    required this.message,
  });

  final List<Message> message;

  factory OrdersInvoiceModel.fromJson(Map<dynamic, dynamic> json) {
    return OrdersInvoiceModel(
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
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.docstatus,
    required this.idx,
    required this.qrCode,
    required this.title,
    required this.namingSeries,
    required this.customer,
    required this.customerName,
    required this.company,
    required this.companyTaxId,
    required this.customOrderOptions,
    required this.customPosCasherNumber,
    required this.postingDate,
    required this.postingTime,
    required this.setPostingTime,
    required this.dueDate,
    required this.isPos,
    required this.posProfile,
    required this.isConsolidated,
    required this.isReturn,
    required this.updateOutstandingForSelf,
    required this.updateBilledAmountInSalesOrder,
    required this.updateBilledAmountInDeliveryNote,
    required this.isDebitNote,
    required this.costCenter,
    required this.branch,
    required this.currency,
    required this.conversionRate,
    required this.sellingPriceList,
    required this.priceListCurrency,
    required this.plcConversionRate,
    required this.ignorePricingRule,
    required this.updateStock,
    required this.setWarehouse,
    required this.totalQty,
    required this.totalNetWeight,
    required this.baseTotal,
    required this.baseNetTotal,
    required this.total,
    required this.netTotal,
    required this.taxCategory,
    required this.baseTotalTaxesAndCharges,
    required this.totalTaxesAndCharges,
    required this.baseGrandTotal,
    required this.baseRoundingAdjustment,
    required this.baseRoundedTotal,
    required this.baseInWords,
    required this.grandTotal,
    required this.roundingAdjustment,
    required this.useCompanyRoundoffCostCenter,
    required this.roundedTotal,
    required this.inWords,
    required this.totalAdvance,
    required this.outstandingAmount,
    required this.disableRoundedTotal,
    required this.applyDiscountOn,
    required this.baseDiscountAmount,
    required this.isCashOrNonTradeDiscount,
    required this.additionalDiscountAccount,
    required this.additionalDiscountPercentage,
    required this.discountAmount,
    required this.totalBillingHours,
    required this.totalBillingAmount,
    required this.basePaidAmount,
    required this.paidAmount,
    required this.baseChangeAmount,
    required this.changeAmount,
    required this.accountForChangeAmount,
    required this.allocateAdvancesAutomatically,
    required this.onlyIncludeAllocatedPayments,
    required this.writeOffAmount,
    required this.baseWriteOffAmount,
    required this.writeOffOutstandingAmountAutomatically,
    required this.writeOffAccount,
    required this.writeOffCostCenter,
    required this.redeemLoyaltyPoints,
    required this.loyaltyPoints,
    required this.loyaltyAmount,
    required this.ignoreDefaultPaymentTermsTemplate,
    required this.paymentTermsTemplate,
    required this.poNo,
    required this.debitTo,
    required this.partyAccountCurrency,
    required this.isOpening,
    required this.againstIncomeAccount,
    required this.amountEligibleForCommission,
    required this.commissionRate,
    required this.totalCommission,
    required this.groupSameItems,
    required this.language,
    required this.status,
    required this.isInternalCustomer,
    required this.isDiscounted,
    required this.remarks,
    required this.repostRequired,
    required this.customRoyaltyPercentage,
    required this.customRoyaltyAmount,
    required this.doctype,
    required this.paymentSchedule,
    required this.payments,
    required this.pricingRules,
    required this.timesheets,
    required this.packedItems,
    required this.taxes,
    required this.items,
    required this.advances,
    required this.salesTeam,
  });

  var name;
  var owner;
  var creation;
  var modified;
  var modifiedBy;
  var docstatus;
  var idx;
  var qrCode;
  var title;
  var namingSeries;
  var customer;
  var customerName;
  var company;
  var companyTaxId;
  var customOrderOptions;
  var customPosCasherNumber;
  var postingDate;
  var postingTime;
  var setPostingTime;
  var dueDate;
  var isPos;
  var posProfile;
  var isConsolidated;
  var isReturn;
  var updateOutstandingForSelf;
  var updateBilledAmountInSalesOrder;
  var updateBilledAmountInDeliveryNote;
  var isDebitNote;
  var costCenter;
  var branch;
  var currency;
  var conversionRate;
  var sellingPriceList;
  var priceListCurrency;
  var plcConversionRate;
  var ignorePricingRule;
  var updateStock;
  var setWarehouse;
  var totalQty;
  var totalNetWeight;
  var baseTotal;
  var baseNetTotal;
  var total;
  var netTotal;
  var taxCategory;
  var baseTotalTaxesAndCharges;
  var totalTaxesAndCharges;
  var baseGrandTotal;
  var baseRoundingAdjustment;
  var baseRoundedTotal;
  var baseInWords;
  var grandTotal;
  var roundingAdjustment;
  var useCompanyRoundoffCostCenter;
  var roundedTotal;
  var inWords;
  var totalAdvance;
  var outstandingAmount;
  var disableRoundedTotal;
  var applyDiscountOn;
  var baseDiscountAmount;
  var isCashOrNonTradeDiscount;
  var additionalDiscountAccount;
  var additionalDiscountPercentage;
  var discountAmount;
  var totalBillingHours;
  var totalBillingAmount;
  var basePaidAmount;
  var paidAmount;
  var baseChangeAmount;
  var changeAmount;
  var accountForChangeAmount;
  var allocateAdvancesAutomatically;
  var onlyIncludeAllocatedPayments;
  var writeOffAmount;
  var baseWriteOffAmount;
  var writeOffOutstandingAmountAutomatically;
  var writeOffAccount;
  var writeOffCostCenter;
  var redeemLoyaltyPoints;
  var loyaltyPoints;
  var loyaltyAmount;
  var ignoreDefaultPaymentTermsTemplate;
  var paymentTermsTemplate;
  var poNo;
  var debitTo;
  var partyAccountCurrency;
  var isOpening;
  var againstIncomeAccount;
  var amountEligibleForCommission;
  var commissionRate;
  var totalCommission;
  var groupSameItems;
  var language;
  var status;
  var isInternalCustomer;
  var isDiscounted;
  var remarks;
  var repostRequired;
  var customRoyaltyPercentage;
  var customRoyaltyAmount;
  var doctype;
  final List<dynamic> paymentSchedule;
  final List<Payment> payments;
  final List<dynamic> pricingRules;
  final List<dynamic> timesheets;
  final List<dynamic> packedItems;
  final List<dynamic> taxes;
  final List<Item> items;
  final List<dynamic> advances;
  final List<dynamic> salesTeam;

  factory Message.fromJson(Map<dynamic, dynamic> json) {
    return Message(
      name: json["name"],
      owner: json["owner"],
      creation: json["creation"],
      modified: json["modified"],
      modifiedBy: json["modified_by"],
      docstatus: json["docstatus"],
      idx: json["idx"],
      qrCode: json["qr_code"],
      title: json["title"],
      namingSeries: json["naming_series"],
      customer: json["customer"],
      customerName: json["customer_name"],
      company: json["company"],
      companyTaxId: json["company_tax_id"],
      customOrderOptions: json["custom_order_options"],
      customPosCasherNumber: json["custom_pos_casher_number"],
      postingDate: json["posting_date"],
      postingTime: json["posting_time"],
      setPostingTime: json["set_posting_time"],
      dueDate: json["due_date"],
      isPos: json["is_pos"],
      posProfile: json["pos_profile"],
      isConsolidated: json["is_consolidated"],
      isReturn: json["is_return"],
      updateOutstandingForSelf: json["update_outstanding_for_self"],
      updateBilledAmountInSalesOrder: json["update_billed_amount_in_sales_order"],
      updateBilledAmountInDeliveryNote: json["update_billed_amount_in_delivery_note"],
      isDebitNote: json["is_debit_note"],
      costCenter: json["cost_center"],
      branch: json["branch"],
      currency: json["currency"],
      conversionRate: json["conversion_rate"]?.toDouble(),
      sellingPriceList: json["selling_price_list"],
      priceListCurrency: json["price_list_currency"],
      plcConversionRate: json["plc_conversion_rate"]?.toDouble(),
      ignorePricingRule: json["ignore_pricing_rule"],
      updateStock: json["update_stock"],
      setWarehouse: json["set_warehouse"],
      totalQty: json["total_qty"]?.toDouble(),
      totalNetWeight: json["total_net_weight"]?.toDouble(),
      baseTotal: json["base_total"]?.toDouble(),
      baseNetTotal: json["base_net_total"]?.toDouble(),
      total: json["total"]?.toDouble(),
      netTotal: json["net_total"]?.toDouble(),
      taxCategory: json["tax_category"],
      baseTotalTaxesAndCharges: json["base_total_taxes_and_charges"]?.toDouble(),
      totalTaxesAndCharges: json["total_taxes_and_charges"]?.toDouble(),
      baseGrandTotal: json["base_grand_total"]?.toDouble(),
      baseRoundingAdjustment: json["base_rounding_adjustment"]?.toDouble(),
      baseRoundedTotal: json["base_rounded_total"]?.toDouble(),
      baseInWords: json["base_in_words"],
      grandTotal: json["grand_total"]?.toDouble(),
      roundingAdjustment: json["rounding_adjustment"]?.toDouble(),
      useCompanyRoundoffCostCenter: json["use_company_roundoff_cost_center"],
      roundedTotal: json["rounded_total"]?.toDouble(),
      inWords: json["in_words"],
      totalAdvance: json["total_advance"]?.toDouble(),
      outstandingAmount: json["outstanding_amount"]?.toDouble(),
      disableRoundedTotal: json["disable_rounded_total"],
      applyDiscountOn: json["apply_discount_on"],
      baseDiscountAmount: json["base_discount_amount"]?.toDouble(),
      isCashOrNonTradeDiscount: json["is_cash_or_non_trade_discount"],
      additionalDiscountAccount: json["additional_discount_account"],
      additionalDiscountPercentage: json["additional_discount_percentage"]?.toDouble(),
      discountAmount: json["discount_amount"]?.toDouble(),
      totalBillingHours: json["total_billing_hours"]?.toDouble(),
      totalBillingAmount: json["total_billing_amount"]?.toDouble(),
      basePaidAmount: json["base_paid_amount"]?.toDouble(),
      paidAmount: json["paid_amount"]?.toDouble(),
      baseChangeAmount: json["base_change_amount"]?.toDouble(),
      changeAmount: json["change_amount"]?.toDouble(),
      accountForChangeAmount: json["account_for_change_amount"],
      allocateAdvancesAutomatically: json["allocate_advances_automatically"],
      onlyIncludeAllocatedPayments: json["only_include_allocated_payments"],
      writeOffAmount: json["write_off_amount"]?.toDouble(),
      baseWriteOffAmount: json["base_write_off_amount"]?.toDouble(),
      writeOffOutstandingAmountAutomatically: json["write_off_outstanding_amount_automatically"],
      writeOffAccount: json["write_off_account"],
      writeOffCostCenter: json["write_off_cost_center"],
      redeemLoyaltyPoints: json["redeem_loyalty_points"],
      loyaltyPoints: json["loyalty_points"],
      loyaltyAmount: json["loyalty_amount"]?.toDouble(),
      ignoreDefaultPaymentTermsTemplate: json["ignore_default_payment_terms_template"],
      paymentTermsTemplate: json["payment_terms_template"],
      poNo: json["po_no"],
      debitTo: json["debit_to"],
      partyAccountCurrency: json["party_account_currency"],
      isOpening: json["is_opening"],
      againstIncomeAccount: json["against_income_account"],
      amountEligibleForCommission: json["amount_eligible_for_commission"]?.toDouble(),
      commissionRate: json["commission_rate"]?.toDouble(),
      totalCommission: json["total_commission"]?.toDouble(),
      groupSameItems: json["group_same_items"],
      language: json["language"],
      status: json["status"],
      isInternalCustomer: json["is_internal_customer"],
      isDiscounted: json["is_discounted"],
      remarks: json["remarks"],
      repostRequired: json["repost_required"],
      customRoyaltyPercentage: json["custom_royalty_percentage"]?.toDouble(),
      customRoyaltyAmount: json["custom_royalty_amount"]?.toDouble(),
      doctype: json["doctype"],
      paymentSchedule: json["payment_schedule"] == null ? [] : List<dynamic>.from(json["payment_schedule"]),
      payments: json["payments"] == null ? [] : List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
      pricingRules: json["pricing_rules"] == null ? [] : List<dynamic>.from(json["pricing_rules"]),
      timesheets: json["timesheets"] == null ? [] : List<dynamic>.from(json["timesheets"]),
      packedItems: json["packed_items"] == null ? [] : List<dynamic>.from(json["packed_items"]),
      taxes: json["taxes"] == null ? [] : List<dynamic>.from(json["taxes"]),
      items: json["items"] == null ? [] : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      advances: json["advances"] == null ? [] : List<dynamic>.from(json["advances"]),
      salesTeam: json["sales_team"] == null ? [] : List<dynamic>.from(json["sales_team"]),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "name": name,
      "owner": owner,
      "creation": creation,
      "modified": modified,
      "modified_by": modifiedBy,
      "docstatus": docstatus,
      "idx": idx,
      "qr_code": qrCode,
      "title": title,
      "naming_series": namingSeries,
      "customer": customer,
      "customer_name": customerName,
      "company": company,
      "company_tax_id": companyTaxId,
      "custom_order_options": customOrderOptions,
      "custom_pos_casher_number": customPosCasherNumber,
      "posting_date": postingDate,
      "posting_time": postingTime,
      "set_posting_time": setPostingTime,
      "due_date": dueDate,
      "is_pos": isPos,
      "pos_profile": posProfile,
      "is_consolidated": isConsolidated,
      "is_return": isReturn,
      "update_outstanding_for_self": updateOutstandingForSelf,
      "update_billed_amount_in_sales_order": updateBilledAmountInSalesOrder,
      "update_billed_amount_in_delivery_note": updateBilledAmountInDeliveryNote,
      "is_debit_note": isDebitNote,
      "cost_center": costCenter,
      "branch": branch,
      "currency": currency,
      "conversion_rate": conversionRate,
      "selling_price_list": sellingPriceList,
      "price_list_currency": priceListCurrency,
      "plc_conversion_rate": plcConversionRate,
      "ignore_pricing_rule": ignorePricingRule,
      "update_stock": updateStock,
      "set_warehouse": setWarehouse,
      "total_qty": totalQty,
      "total_net_weight": totalNetWeight,
      "base_total": baseTotal,
      "base_net_total": baseNetTotal,
      "total": total,
      "net_total": netTotal,
      "tax_category": taxCategory,
      "base_total_taxes_and_charges": baseTotalTaxesAndCharges,
      "total_taxes_and_charges": totalTaxesAndCharges,
      "base_grand_total": baseGrandTotal,
      "base_rounding_adjustment": baseRoundingAdjustment,
      "base_rounded_total": baseRoundedTotal,
      "base_in_words": baseInWords,
      "grand_total": grandTotal,
      "rounding_adjustment": roundingAdjustment,
      "use_company_roundoff_cost_center": useCompanyRoundoffCostCenter,
      "rounded_total": roundedTotal,
      "in_words": inWords,
      "total_advance": totalAdvance,
      "outstanding_amount": outstandingAmount,
      "disable_rounded_total": disableRoundedTotal,
      "apply_discount_on": applyDiscountOn,
      "base_discount_amount": baseDiscountAmount,
      "is_cash_or_non_trade_discount": isCashOrNonTradeDiscount,
      "additional_discount_account": additionalDiscountAccount,
      "additional_discount_percentage": additionalDiscountPercentage,
      "discount_amount": discountAmount,
      "total_billing_hours": totalBillingHours,
      "total_billing_amount": totalBillingAmount,
      "base_paid_amount": basePaidAmount,
      "paid_amount": paidAmount,
      "base_change_amount": baseChangeAmount,
      "change_amount": changeAmount,
      "account_for_change_amount": accountForChangeAmount,
      "allocate_advances_automatically": allocateAdvancesAutomatically,
      "only_include_allocated_payments": onlyIncludeAllocatedPayments,
      "write_off_amount": writeOffAmount,
      "base_write_off_amount": baseWriteOffAmount,
      "write_off_outstanding_amount_automatically": writeOffOutstandingAmountAutomatically,
      "write_off_account": writeOffAccount,
      "write_off_cost_center": writeOffCostCenter,
      "redeem_loyalty_points": redeemLoyaltyPoints,
      "loyalty_points": loyaltyPoints,
      "loyalty_amount": loyaltyAmount,
      "ignore_default_payment_terms_template": ignoreDefaultPaymentTermsTemplate,
      "payment_terms_template": paymentTermsTemplate,
      "po_no": poNo,
      "debit_to": debitTo,
      "party_account_currency": partyAccountCurrency,
      "is_opening": isOpening,
      "against_income_account": againstIncomeAccount,
      "amount_eligible_for_commission": amountEligibleForCommission,
      "commission_rate": commissionRate,
      "total_commission": totalCommission,
      "group_same_items": groupSameItems,
      "language": language,
      "status": status,
      "is_internal_customer": isInternalCustomer,
      "is_discounted": isDiscounted,
      "remarks": remarks,
      "repost_required": repostRequired,
      "custom_royalty_percentage": customRoyaltyPercentage,
      "custom_royalty_amount": customRoyaltyAmount,
      "doctype": doctype,
      "payment_schedule": paymentSchedule,
      "payments": payments.map((x) => x.toJson()).toList(),
      "pricing_rules": pricingRules,
      "timesheets": timesheets,
      "packed_items": packedItems,
      "taxes": taxes,
      "items": items.map((x) => x.toJson()).toList(),
      "advances": advances,
      "sales_team": salesTeam,
    };
  }
}

class Payment {
  Payment({
    this.name,
    this.reference,
    this.amount,
    this.paymentMode,
    this.account,
    this.date,
    this.receivedAmount,
    this.outstandingAmount,
  });

  var name;
  var reference;
  var amount;
  var paymentMode;
  var account;
  var date;
  var receivedAmount;
  var outstandingAmount;

  factory Payment.fromJson(Map<dynamic, dynamic> json) {
    return Payment(
      name: json["name"],
      reference: json["reference"],
      amount: json["amount"]?.toDouble(),
      paymentMode: json["payment_mode"],
      account: json["account"],
      date: json["date"],
      receivedAmount: json["received_amount"]?.toDouble(),
      outstandingAmount: json["outstanding_amount"]?.toDouble(),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "name": name,
      "reference": reference,
      "amount": amount,
      "payment_mode": paymentMode,
      "account": account,
      "date": date,
      "received_amount": receivedAmount,
      "outstanding_amount": outstandingAmount,
    };
  }
}

class Item {
  Item({
    this.itemCode,
    this.itemName,
    this.description,
    this.itemGroup,
    this.uom,
    this.qty,
    this.baseRate,
    this.discountPercentage,
    this.rate,
    this.amount,
    this.taxCode,
    this.costCenter,
    this.deliveryDate,
  });

  var itemCode;
  var itemName;
  var description;
  var itemGroup;
  var uom;
  var qty;
  var baseRate;
  var discountPercentage;
  var rate;
  var amount;
  var taxCode;
  var costCenter;
  var deliveryDate;

  factory Item.fromJson(Map<dynamic, dynamic> json) {
    return Item(
      itemCode: json["item_code"],
      itemName: json["item_name"],
      description: json["description"],
      itemGroup: json["item_group"],
      uom: json["uom"],
      qty: json["qty"],
      baseRate: json["base_rate"],
      discountPercentage: json["discount_percentage"],
      rate: json["rate"],
      amount: json["amount"],
      taxCode: json["tax_code"],
      costCenter: json["cost_center"],
      deliveryDate: json["delivery_date"],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "item_code": itemCode,
      "item_name": itemName,
      "description": description,
      "item_group": itemGroup,
      "uom": uom,
      "qty": qty,
      "base_rate": baseRate,
      "discount_percentage": discountPercentage,
      "rate": rate,
      "amount": amount,
      "tax_code": taxCode,
      "cost_center": costCenter,
      "delivery_date": deliveryDate,
    };
  }
}
