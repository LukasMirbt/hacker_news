// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  karma: (json['karma'] as num).toInt(),
  profileUrl: json['profileUrl'] as String,
  logoutUrl: json['logoutUrl'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'karma': instance.karma,
  'profileUrl': instance.profileUrl,
  'logoutUrl': instance.logoutUrl,
};
