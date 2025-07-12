// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visited_post_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VisitedPostState _$VisitedPostStateFromJson(Map<String, dynamic> json) =>
    _VisitedPostState(
      items:
          (json['items'] as List<dynamic>?)?.map((e) => e as String).toSet() ??
          const {},
    );

Map<String, dynamic> _$VisitedPostStateToJson(_VisitedPostState instance) =>
    <String, dynamic>{'items': instance.items.toList()};
