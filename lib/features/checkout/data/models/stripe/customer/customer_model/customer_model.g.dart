// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as String,
      objectType: json['object'] as String,
      address: json['address'],
      balance: (json['balance'] as num).toInt(),
      created: (json['created'] as num).toInt(),
      currency: json['currency'],
      defaultSource: json['defaultSource'],
      delinquent: json['delinquent'] as bool,
      description: json['description'],
      discount: json['discount'],
      email: json['email'] as String,
      invoicePrefix: json['invoicePrefix'] as String,
      invoiceSettings: InvoiceSettings.fromJson(
          json['invoiceSettings'] as Map<String, dynamic>),
      livemode: json['livemode'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>,
      name: json['name'] as String,
      nextInvoiceSequence: (json['nextInvoiceSequence'] as num).toInt(),
      phone: json['phone'],
      preferredLocales: json['preferredLocales'] as List<dynamic>,
      shipping: json['shipping'],
      taxExempt: json['taxExempt'] as String,
      testClock: json['testClock'],
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.objectType,
      'address': instance.address,
      'balance': instance.balance,
      'created': instance.created,
      'currency': instance.currency,
      'defaultSource': instance.defaultSource,
      'delinquent': instance.delinquent,
      'description': instance.description,
      'discount': instance.discount,
      'email': instance.email,
      'invoicePrefix': instance.invoicePrefix,
      'invoiceSettings': instance.invoiceSettings,
      'livemode': instance.livemode,
      'metadata': instance.metadata,
      'name': instance.name,
      'nextInvoiceSequence': instance.nextInvoiceSequence,
      'phone': instance.phone,
      'preferredLocales': instance.preferredLocales,
      'shipping': instance.shipping,
      'taxExempt': instance.taxExempt,
      'testClock': instance.testClock,
    };

InvoiceSettings _$InvoiceSettingsFromJson(Map<String, dynamic> json) =>
    InvoiceSettings(
      customFields: json['customFields'],
      defaultPaymentMethod: json['defaultPaymentMethod'],
      footer: json['footer'],
      renderingOptions: json['renderingOptions'],
    );

Map<String, dynamic> _$InvoiceSettingsToJson(InvoiceSettings instance) =>
    <String, dynamic>{
      'customFields': instance.customFields,
      'defaultPaymentMethod': instance.defaultPaymentMethod,
      'footer': instance.footer,
      'renderingOptions': instance.renderingOptions,
    };
