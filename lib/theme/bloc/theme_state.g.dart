// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThemeState _$ThemeStateFromJson(Map<String, dynamic> json) => _ThemeState(
  mode:
      $enumDecodeNullable(_$ThemeModeEnumMap, json['mode']) ?? ThemeMode.system,
);

Map<String, dynamic> _$ThemeStateToJson(_ThemeState instance) =>
    <String, dynamic>{'mode': _$ThemeModeEnumMap[instance.mode]!};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
