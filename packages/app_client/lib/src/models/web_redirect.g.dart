// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_redirect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlRedirect _$UrlRedirectFromJson(Map<String, dynamic> json) =>
    UrlRedirect(Uri.parse(json['url'] as String));

Map<String, dynamic> _$UrlRedirectToJson(UrlRedirect instance) =>
    <String, dynamic>{'url': instance.url.toString()};

HtmlRedirect _$HtmlRedirectFromJson(Map<String, dynamic> json) => HtmlRedirect(
  baseUrl: Uri.parse(json['baseUrl'] as String),
  html: json['html'] as String,
);

Map<String, dynamic> _$HtmlRedirectToJson(HtmlRedirect instance) =>
    <String, dynamic>{
      'baseUrl': instance.baseUrl.toString(),
      'html': instance.html,
    };
