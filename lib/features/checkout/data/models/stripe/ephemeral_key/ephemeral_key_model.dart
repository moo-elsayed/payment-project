import 'package:json_annotation/json_annotation.dart';

part 'ephemeral_key_model.g.dart';

@JsonSerializable()
class EphemeralKey {
  final String id;
  @JsonKey(name: 'object')
  final String objectType;
  final dynamic associatedObjects;
  final int created;
  final int expires;
  final bool livemode;
  final String secret;

  EphemeralKey({
    required this.id,
    required this.objectType,
    required this.associatedObjects,
    required this.created,
    required this.expires,
    required this.livemode,
    required this.secret,
  });

  factory EphemeralKey.fromJson(Map<String, dynamic> json) =>
      _$EphemeralKeyFromJson(json);

  Map<String, dynamic> toJson() => _$EphemeralKeyToJson(this);
}

@JsonSerializable()
class AssociatedObject {
  final String id;
  final String type;

  AssociatedObject({
    required this.id,
    required this.type,
  });

  factory AssociatedObject.fromJson(Map<String, dynamic> json) =>
      _$AssociatedObjectFromJson(json);

  Map<String, dynamic> toJson() => _$AssociatedObjectToJson(this);
}
