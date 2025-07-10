// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppState _$AppStateFromJson(Map<String, dynamic> json) => _AppState(
  status:
      $enumDecodeNullable(_$AppStatusEnumMap, json['status']) ??
      AppStatus.initial,
);

Map<String, dynamic> _$AppStateToJson(_AppState instance) => <String, dynamic>{
  'status': _$AppStatusEnumMap[instance.status]!,
};

const _$AppStatusEnumMap = {
  AppStatus.analyticsConsent: 'analyticsConsent',
  AppStatus.home: 'home',
};
