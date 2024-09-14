// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

ModelSalesInvoiceCreated modelSalesInvoiceCreatedFromJson(String str) => ModelSalesInvoiceCreated.fromJson(json.decode(str));

String modelSalesInvoiceCreatedToJson(ModelSalesInvoiceCreated data) => json.encode(data.toJson());

class ModelSalesInvoiceCreated {
  final Message message;

  ModelSalesInvoiceCreated({required this.message});

  factory ModelSalesInvoiceCreated.fromJson(Map<String, dynamic> json) => ModelSalesInvoiceCreated(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
      };
}

class Message {
  final String message;
  final SalesInvoice salesInvoice;

  Message({required this.message, required this.salesInvoice});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"],
        salesInvoice: SalesInvoice.fromJson(json["sales_invoice"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "sales_invoice": salesInvoice.toJson(),
      };
}

class SalesInvoice {
  var name;
  var owner;
  var creation;
  var modified;
  var modifiedBy;
  var docstatus;
  var idx;
  var qr_code;
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
  var isConsolidated;
  var isReturn;
  var updateOutstandingForSelf;
  var updateBilledAmountInSalesOrder;
  var updateBilledAmountInDeliveryNote;
  var isDebitNote;
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
  var taxesAndCharges;
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
  var otherChargesCalculation;
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
  var customerGroup;
  var isInternalCustomer;
  var isDiscounted;
  var remarks;
  var repostRequired;
  var customRoyaltyPercentage;
  var customRoyaltyAmount;
  var doctype;

  final List<dynamic> salesTeam;
  final List<dynamic> pricingRules;
  final List<dynamic> paymentSchedule;
  final List<dynamic> packedItems;
  final List<dynamic> timesheets;
  final List<dynamic> taxes;
  final List<dynamic> advances;
  final List<Payment> payments;
  final List<Sales_Item> items;

  SalesInvoice({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.docstatus,
    required this.idx,
    required this.qr_code,
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
    required this.isConsolidated,
    required this.isReturn,
    required this.updateOutstandingForSelf,
    required this.updateBilledAmountInSalesOrder,
    required this.updateBilledAmountInDeliveryNote,
    required this.isDebitNote,
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
    required this.taxesAndCharges,
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
    required this.otherChargesCalculation,
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
    required this.customerGroup,
    required this.isInternalCustomer,
    required this.isDiscounted,
    required this.remarks,
    required this.repostRequired,
    required this.customRoyaltyPercentage,
    required this.customRoyaltyAmount,
    required this.doctype,
    required this.timesheets,
    required this.salesTeam,
    required this.pricingRules,
    required this.paymentSchedule,
    required this.packedItems,
    required this.taxes,
    required this.payments,
    required this.items,
    required this.advances,
  });

  factory SalesInvoice.fromJson(Map<String, dynamic> json) => SalesInvoice(
        name: json['name'],
        owner: json['owner'],
        creation: DateTime.parse(json['creation']),
        modified: DateTime.parse(json['modified']),
        modifiedBy: json['modified_by'],
        docstatus: json['docstatus'],
        idx: json['idx'],
        qr_code: json['qr_code'],
        title: json['title'],
        namingSeries: json['naming_series'],
        customer: json['customer'],
        customerName: json['customer_name'],
        company: json['company'],
        companyTaxId: json['company_tax_id'],
        customOrderOptions: json['custom_order_options'],
        customPosCasherNumber: json['custom_pos_casher_number'],
        postingDate: DateTime.parse(json['posting_date']),
        postingTime: json['posting_time'],
        setPostingTime: json['set_posting_time'],
        dueDate: DateTime.parse(json['due_date']),
        isPos: json['is_pos'],
        isConsolidated: json['is_consolidated'],
        isReturn: json['is_return'],
        updateOutstandingForSelf: json['update_outstanding_for_self'],
        updateBilledAmountInSalesOrder: json['update_billed_amount_in_sales_order'],
        updateBilledAmountInDeliveryNote: json['update_billed_amount_in_delivery_note'],
        isDebitNote: json['is_debit_note'],
        branch: json['branch'],
        currency: json['currency'],
        conversionRate: json['conversion_rate'],
        sellingPriceList: json['selling_price_list'],
        priceListCurrency: json['price_list_currency'],
        plcConversionRate: json['plc_conversion_rate'],
        ignorePricingRule: json['ignore_pricing_rule'],
        updateStock: json['update_stock'],
        setWarehouse: json['set_warehouse'],
        totalQty: json['total_qty'].toDouble(),
        totalNetWeight: json['total_net_weight'].toDouble(),
        baseTotal: json['base_total'].toDouble(),
        baseNetTotal: json['base_net_total'].toDouble(),
        total: json['total'].toDouble(),
        netTotal: json['net_total'].toDouble(),
        taxCategory: json['tax_category'],
        taxesAndCharges: json['taxes_and_charges'],
        baseTotalTaxesAndCharges: json['base_total_taxes_and_charges'].toDouble(),
        totalTaxesAndCharges: json['total_taxes_and_charges'].toDouble(),
        baseGrandTotal: json['base_grand_total'].toDouble(),
        baseRoundingAdjustment: json['base_rounding_adjustment'].toDouble(),
        baseRoundedTotal: json['base_rounded_total'].toDouble(),
        baseInWords: json['base_in_words'],
        grandTotal: json['grand_total'].toDouble(),
        roundingAdjustment: json['rounding_adjustment'].toDouble(),
        useCompanyRoundoffCostCenter: json['use_company_roundoff_cost_center'],
        roundedTotal: json['rounded_total'].toDouble(),
        inWords: json['in_words'],
        totalAdvance: json['total_advance'].toDouble(),
        outstandingAmount: json['outstanding_amount'].toDouble(),
        disableRoundedTotal: json['disable_rounded_total'],
        applyDiscountOn: json['apply_discount_on'],
        baseDiscountAmount: json['base_discount_amount'].toDouble(),
        isCashOrNonTradeDiscount: json['is_cash_or_non_trade_discount'],
        additionalDiscountAccount: json['additional_discount_account'],
        additionalDiscountPercentage: json['additional_discount_percentage'].toDouble(),
        discountAmount: json['discount_amount'].toDouble(),
        otherChargesCalculation: json['other_charges_calculation'],
        totalBillingHours: json['total_billing_hours'].toDouble(),
        totalBillingAmount: json['total_billing_amount'].toDouble(),
        basePaidAmount: json['base_paid_amount'].toDouble(),
        paidAmount: json['paid_amount'].toDouble(),
        baseChangeAmount: json['base_change_amount'].toDouble(),
        changeAmount: json['change_amount'].toDouble(),
        accountForChangeAmount: json['account_for_change_amount'],
        allocateAdvancesAutomatically: json['allocate_advances_automatically'],
        onlyIncludeAllocatedPayments: json['only_include_allocated_payments'],
        writeOffAmount: json['write_off_amount'].toDouble(),
        baseWriteOffAmount: json['base_write_off_amount'].toDouble(),
        writeOffOutstandingAmountAutomatically: json['write_off_outstanding_amount_automatically'],
        redeemLoyaltyPoints: json['redeem_loyalty_points'],
        loyaltyPoints: json['loyalty_points'],
        loyaltyAmount: json['loyalty_amount'].toDouble(),
        ignoreDefaultPaymentTermsTemplate: json['ignore_default_payment_terms_template'],
        paymentTermsTemplate: json['payment_terms_template'],
        poNo: json['po_no'],
        debitTo: json['debit_to'],
        partyAccountCurrency: json['party_account_currency'],
        isOpening: json['is_opening'],
        againstIncomeAccount: json['against_income_account'],
        amountEligibleForCommission: json['amount_eligible_for_commission'].toDouble(),
        commissionRate: json['commission_rate'].toDouble(),
        totalCommission: json['total_commission'].toDouble(),
        groupSameItems: json['group_same_items'],
        language: json['language'],
        status: json['status'],
        customerGroup: json['customer_group'],
        isInternalCustomer: json['is_internal_customer'],
        isDiscounted: json['is_discounted'],
        remarks: json['remarks'],
        repostRequired: json['repost_required'],
        customRoyaltyPercentage: json['custom_royalty_percentage'].toDouble(),
        customRoyaltyAmount: json['custom_royalty_amount'].toDouble(),
        doctype: json['doctype'],
        salesTeam: json['sales_team'],
        pricingRules: json['pricing_rules'],
        paymentSchedule: json['payment_schedule'],
        packedItems: json['packed_items'],
        taxes: List<dynamic>.from(json["taxes"].map((x) => x)),
        advances: json['advances'],
        timesheets: List<dynamic>.from(json["timesheets"].map((x) => x)),
        payments: List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
        items: List<Sales_Item>.from(json["items"].map((x) => Sales_Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation.toIso8601String(),
        "modified": modified.toIso8601String(),
        "modified_by": modifiedBy,
        "docstatus": docstatus,
        "idx": idx,
        "qr_code": qr_code,
        "title": title,
        "naming_series": namingSeries,
        "customer": customer,
        "customer_name": customerName,
        "company": company,
        "company_tax_id": companyTaxId,
        "posting_date": postingDate.toIso8601String(),
        "posting_time": postingTime,
        "set_posting_time": setPostingTime,
        "due_date": dueDate.toIso8601String(),
        "is_pos": isPos,
        "is_consolidated": isConsolidated,
        "is_return": isReturn,
        "update_outstanding_for_self": updateOutstandingForSelf,
        "update_billed_amount_in_sales_order": updateBilledAmountInSalesOrder,
        "update_billed_amount_in_delivery_note": updateBilledAmountInDeliveryNote,
        "is_debit_note": isDebitNote,
        "branch": branch,
        "currency": currency,
        "conversion_rate": conversionRate,
        "selling_price_list": sellingPriceList,
        "price_list_currency": priceListCurrency,
        "plc_conversion_rate": plcConversionRate,
        "ignore_pricing_rule": ignorePricingRule,
        "update_stock": updateStock,
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
        "customer_group": customerGroup,
        "is_internal_customer": isInternalCustomer,
        "is_discounted": isDiscounted,
        "remarks": remarks,
        "repost_required": repostRequired,
        "custom_royalty_percentage": customRoyaltyPercentage,
        "custom_royalty_amount": customRoyaltyAmount,
        "doctype": doctype,
        "taxes": List<dynamic>.from(taxes.map((x) => x)),
        "sales_team": List<dynamic>.from(salesTeam.map((x) => x)),
        "pricing_rules": List<dynamic>.from(pricingRules.map((x) => x)),
        "payment_schedule": List<dynamic>.from(paymentSchedule.map((x) => x)),
        "packed_items": List<dynamic>.from(packedItems.map((x) => x)),
        "timesheets": List<dynamic>.from(timesheets.map((x) => x)),
        "advances": List<dynamic>.from(advances.map((x) => x)),
        "payments": List<dynamic>.from(payments.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Tax {
  var name;
  var owner;
  var creation;
  var modified;
  var modifiedBy;
  var docstatus;
  var idx;
  var chargeType;
  var accountHead;
  var description;
  var includedInPrintRate;
  var includedInPaidAmount;
  var costCenter;
  var rate;
  var accountCurrency;
  var taxAmount;
  var total;
  var taxAmountAfterDiscountAmount;
  var baseTaxAmount;
  var baseTotal;
  var baseTaxAmountAfterDiscountAmount;
  var itemWiseTaxDetail;
  var dontRecomputeTax;
  var parent;
  var parentfield;
  var parenttype;
  var doctype;
  var unsaved;

  Tax({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.docstatus,
    required this.idx,
    required this.chargeType,
    required this.accountHead,
    required this.description,
    required this.includedInPrintRate,
    required this.includedInPaidAmount,
    required this.costCenter,
    required this.rate,
    required this.accountCurrency,
    required this.taxAmount,
    required this.total,
    required this.taxAmountAfterDiscountAmount,
    required this.baseTaxAmount,
    required this.baseTotal,
    required this.baseTaxAmountAfterDiscountAmount,
    required this.itemWiseTaxDetail,
    required this.dontRecomputeTax,
    required this.parent,
    required this.parentfield,
    required this.parenttype,
    required this.doctype,
    required this.unsaved,
  });

  factory Tax.fromJson(Map<String, dynamic> json) {
    return Tax(
      name: json['name'],
      owner: json['owner'],
      creation: DateTime.parse(json['creation']),
      modified: DateTime.parse(json['modified']),
      modifiedBy: json['modified_by'],
      docstatus: json['docstatus'],
      idx: json['idx'],
      chargeType: json['charge_type'],
      accountHead: json['account_head'],
      description: json['description'],
      includedInPrintRate: json['included_in_print_rate'],
      includedInPaidAmount: json['included_in_paid_amount'],
      costCenter: json['cost_center'],
      rate: json['rate'].toDouble(),
      accountCurrency: json['account_currency'],
      taxAmount: json['tax_amount'].toDouble(),
      total: json['total'].toDouble(),
      taxAmountAfterDiscountAmount: json['tax_amount_after_discount_amount'].toDouble(),
      baseTaxAmount: json['base_tax_amount'].toDouble(),
      baseTotal: json['base_total'].toDouble(),
      baseTaxAmountAfterDiscountAmount: json['base_tax_amount_after_discount_amount'].toDouble(),
      itemWiseTaxDetail: json['item_wise_tax_detail'],
      dontRecomputeTax: json['dont_recompute_tax'],
      parent: json['parent'],
      parentfield: json['parentfield'],
      parenttype: json['parenttype'],
      doctype: json['doctype'],
      unsaved: json['__unsaved'],
    );
  }
}

class Payment {
  var name;
  var owner;
  var creation;
  var modified;
  var modifiedBy;
  var docstatus;
  var idx;
  var defaultPayment;
  var modeOfPayment;
  var amount;
  var account;
  var type;
  var baseAmount;
  var parent;
  var parentfield;
  var parenttype;
  var doctype;
  var unsaved;

  Payment({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.docstatus,
    required this.idx,
    required this.defaultPayment,
    required this.modeOfPayment,
    required this.amount,
    required this.account,
    required this.type,
    required this.baseAmount,
    required this.parent,
    required this.parentfield,
    required this.parenttype,
    required this.doctype,
    required this.unsaved,
  });

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        name: json['name'],
        owner: json['owner'],
        creation: DateTime.parse(json['creation']),
        modified: DateTime.parse(json['modified']),
        modifiedBy: json['modified_by'],
        docstatus: json['docstatus'],
        idx: json['idx'],
        defaultPayment: json['default'],
        modeOfPayment: json['mode_of_payment'],
        amount: json['amount'].toDouble(),
        account: json['account'],
        type: json['type'],
        baseAmount: json['base_amount'].toDouble(),
        parent: json['parent'],
        parentfield: json['parentfield'],
        parenttype: json['parenttype'],
        doctype: json['doctype'],
        unsaved: json['__unsaved'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation.toIso8601String(),
        "modified": modified.toIso8601String(),
        "modified_by": modifiedBy,
        "docstatus": docstatus,
        "idx": idx,
        "default": defaultPayment,
        "mode_of_payment": modeOfPayment,
        "amount": amount,
        "account": account,
        "type": type,
        "base_amount": baseAmount,
        "parent": parent,
        "parentfield": parentfield,
        "parenttype": parenttype,
        "doctype": doctype,
        "__unsaved": unsaved,
      };
}

class Sales_Item {
  var itemCode;
  var itemName;
  var qty;
  var rate;
  var amount;

  var name;
  var owner;
  var creation;
  var modified;
  var modifiedBy;
  var docstatus;
  var idx;
  var barcode;
  var hasItemScanned;
  var description;
  var itemGroup;
  var image;
  var stockUom;
  var uom;
  var conversionFactor;
  var stockQty;
  var priceListRate;
  var basePriceListRate;
  var marginType;
  var marginRateOrAmount;
  var rateWithMargin;
  var discountPercentage;
  var discountAmount;
  var baseRateWithMargin;
  var baseRate;
  var baseAmount;
  var stockUomRate;
  var isFreeItem;
  var grantCommission;
  var netRate;
  var netAmount;
  var baseNetRate;
  var baseNetAmount;
  var deliveredBySupplier;
  var incomeAccount;
  var isFixedAsset;
  var expenseAccount;
  var enableDeferredRevenue;
  var weightPerUnit;
  var totalWeight;
  var warehouse;
  var useSerialBatchFields;
  var allowZeroValuationRate;
  var incomingRate;
  var itemTaxRate;
  var actualBatchQty;
  var actualQty;
  var deliveredQty;
  var costCenter;
  var pageBreak;
  var parent;
  var parentfield;
  var parenttype;
  var doctype;
  var unsaved;

  Sales_Item({
    required this.name,
    required this.owner,
    required this.creation,
    required this.modified,
    required this.modifiedBy,
    required this.docstatus,
    required this.idx,
    required this.barcode,
    required this.hasItemScanned,
    required this.itemCode,
    required this.itemName,
    required this.description,
    required this.itemGroup,
    required this.image,
    required this.qty,
    required this.stockUom,
    required this.uom,
    required this.conversionFactor,
    required this.stockQty,
    required this.priceListRate,
    required this.basePriceListRate,
    required this.marginType,
    required this.marginRateOrAmount,
    required this.rateWithMargin,
    required this.discountPercentage,
    required this.discountAmount,
    required this.baseRateWithMargin,
    required this.rate,
    required this.amount,
    required this.baseRate,
    required this.baseAmount,
    required this.stockUomRate,
    required this.isFreeItem,
    required this.grantCommission,
    required this.netRate,
    required this.netAmount,
    required this.baseNetRate,
    required this.baseNetAmount,
    required this.deliveredBySupplier,
    required this.incomeAccount,
    required this.isFixedAsset,
    required this.expenseAccount,
    required this.enableDeferredRevenue,
    required this.weightPerUnit,
    required this.totalWeight,
    required this.warehouse,
    required this.useSerialBatchFields,
    required this.allowZeroValuationRate,
    required this.incomingRate,
    required this.itemTaxRate,
    required this.actualBatchQty,
    required this.actualQty,
    required this.deliveredQty,
    required this.costCenter,
    required this.pageBreak,
    required this.parent,
    required this.parentfield,
    required this.parenttype,
    required this.doctype,
    required this.unsaved,
  });

  factory Sales_Item.fromJson(Map<String, dynamic> json) => Sales_Item(
        name: json['name'],
        owner: json['owner'],
        creation: DateTime.parse(json['creation']),
        modified: DateTime.parse(json['modified']),
        modifiedBy: json['modified_by'],
        docstatus: json['docstatus'],
        idx: json['idx'],
        barcode: json['barcode'],
        hasItemScanned: json['has_item_scanned'],
        itemCode: json['item_code'],
        itemName: json['item_name'],
        description: json['description'],
        itemGroup: json['item_group'],
        image: json['image'],
        qty: json['qty'].toDouble(),
        stockUom: json['stock_uom'],
        uom: json['uom'],
        conversionFactor: json['conversion_factor'].toDouble(),
        stockQty: json['stock_qty'].toDouble(),
        priceListRate: json['price_list_rate'].toDouble(),
        basePriceListRate: json['base_price_list_rate'].toDouble(),
        marginType: json['margin_type'],
        marginRateOrAmount: json['margin_rate_or_amount'].toDouble(),
        rateWithMargin: json['rate_with_margin'].toDouble(),
        discountPercentage: json['discount_percentage'].toDouble(),
        discountAmount: json['discount_amount'].toDouble(),
        baseRateWithMargin: json['base_rate_with_margin'].toDouble(),
        rate: json['rate'].toDouble(),
        amount: json['amount'].toDouble(),
        baseRate: json['base_rate'].toDouble(),
        baseAmount: json['base_amount'].toDouble(),
        stockUomRate: json['stock_uom_rate'].toDouble(),
        isFreeItem: json['is_free_item'],
        grantCommission: json['grant_commission'],
        netRate: json['net_rate'].toDouble(),
        netAmount: json['net_amount'].toDouble(),
        baseNetRate: json['base_net_rate'].toDouble(),
        baseNetAmount: json['base_net_amount'].toDouble(),
        deliveredBySupplier: json['delivered_by_supplier'],
        incomeAccount: json['income_account'],
        isFixedAsset: json['is_fixed_asset'],
        expenseAccount: json['expense_account'],
        enableDeferredRevenue: json['enable_deferred_revenue'],
        weightPerUnit: json['weight_per_unit'].toDouble(),
        totalWeight: json['total_weight'].toDouble(),
        warehouse: json['warehouse'],
        useSerialBatchFields: json['use_serial_batch_fields'],
        allowZeroValuationRate: json['allow_zero_valuation_rate'],
        incomingRate: json['incoming_rate'].toDouble(),
        itemTaxRate: json['item_tax_rate'],
        actualBatchQty: json['actual_batch_qty'].toDouble(),
        actualQty: json['actual_qty'].toDouble(),
        deliveredQty: json['delivered_qty'].toDouble(),
        costCenter: json['cost_center'],
        pageBreak: json['page_break'],
        parent: json['parent'],
        parentfield: json['parentfield'],
        parenttype: json['parenttype'],
        doctype: json['doctype'],
        unsaved: json['__unsaved'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "owner": owner,
        "creation": creation.toIso8601String(),
        "modified": modified.toIso8601String(),
        "modified_by": modifiedBy,
        "docstatus": docstatus,
        "idx": idx,
        "barcode": barcode,
        "has_item_scanned": hasItemScanned,
        "item_code": itemCode,
        "item_name": itemName,
        "description": description,
        "item_group": itemGroup,
        "image": image,
        "qty": qty,
        "stock_uom": stockUom,
        "uom": uom,
        "conversion_factor": conversionFactor,
        "stock_qty": stockQty,
        "price_list_rate": priceListRate,
        "base_price_list_rate": basePriceListRate,
        "margin_type": marginType,
        "margin_rate_or_amount": marginRateOrAmount,
        "rate_with_margin": rateWithMargin,
        "discount_percentage": discountPercentage,
        "discount_amount": discountAmount,
        "base_rate_with_margin": baseRateWithMargin,
        "rate": rate,
        "amount": amount,
        "base_rate": baseRate,
        "base_amount": baseAmount,
        "stock_uom_rate": stockUomRate,
        "is_free_item": isFreeItem,
        "grant_commission": grantCommission,
        "net_rate": netRate,
        "net_amount": netAmount,
        "base_net_rate": baseNetRate,
        "base_net_amount": baseNetAmount,
        "delivered_by_supplier": deliveredBySupplier,
        "income_account": incomeAccount,
        "is_fixed_asset": isFixedAsset,
        "expense_account": expenseAccount,
        "enable_deferred_revenue": enableDeferredRevenue,
        "weight_per_unit": weightPerUnit,
        "total_weight": totalWeight,
        "warehouse": warehouse,
        "use_serial_batch_fields": useSerialBatchFields,
        "allow_zero_valuation_rate": allowZeroValuationRate,
        "incoming_rate": incomingRate,
        "item_tax_rate": itemTaxRate,
        "actual_batch_qty": actualBatchQty,
        "actual_qty": actualQty,
        "delivered_qty": deliveredQty,
        "cost_center": costCenter,
        "page_break": pageBreak,
        "parent": parent,
        "parentfield": parentfield,
        "parenttype": parenttype,
        "doctype": doctype,
        "__unsaved": unsaved,
      };
}
