import 'package:json_annotation/json_annotation.dart';

part 'customer_model.g.dart';

@JsonSerializable()
class Customer {
  final String id;
  @JsonKey(name: 'object')
  final String objectType;
  final dynamic address;
  final int balance;
  final int created;
  final dynamic currency;
  final dynamic defaultSource;
  final bool delinquent;
  final dynamic description;
  final dynamic discount;
  final String email;
  final String invoicePrefix;
  final InvoiceSettings invoiceSettings;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final String name;
  final int nextInvoiceSequence;
  final dynamic phone;
  final List<dynamic> preferredLocales;
  final dynamic shipping;
  final String taxExempt;
  final dynamic testClock;

  Customer({
    required this.id,
    required this.objectType,
    required this.address,
    required this.balance,
    required this.created,
    required this.currency,
    required this.defaultSource,
    required this.delinquent,
    required this.description,
    required this.discount,
    required this.email,
    required this.invoicePrefix,
    required this.invoiceSettings,
    required this.livemode,
    required this.metadata,
    required this.name,
    required this.nextInvoiceSequence,
    required this.phone,
    required this.preferredLocales,
    required this.shipping,
    required this.taxExempt,
    required this.testClock,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class InvoiceSettings {
  final dynamic customFields;
  final dynamic defaultPaymentMethod;
  final dynamic footer;
  final dynamic renderingOptions;

  InvoiceSettings({
    required this.customFields,
    required this.defaultPaymentMethod,
    required this.footer,
    required this.renderingOptions,
  });

  factory InvoiceSettings.fromJson(Map<String, dynamic> json) =>
      _$InvoiceSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceSettingsToJson(this);
}