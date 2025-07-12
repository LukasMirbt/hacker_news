// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visited_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VisitedPostState {

 Set<String> get items;
/// Create a copy of VisitedPostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisitedPostStateCopyWith<VisitedPostState> get copyWith => _$VisitedPostStateCopyWithImpl<VisitedPostState>(this as VisitedPostState, _$identity);

  /// Serializes this VisitedPostState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VisitedPostState&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'VisitedPostState(items: $items)';
}


}

/// @nodoc
abstract mixin class $VisitedPostStateCopyWith<$Res>  {
  factory $VisitedPostStateCopyWith(VisitedPostState value, $Res Function(VisitedPostState) _then) = _$VisitedPostStateCopyWithImpl;
@useResult
$Res call({
 Set<String> items
});




}
/// @nodoc
class _$VisitedPostStateCopyWithImpl<$Res>
    implements $VisitedPostStateCopyWith<$Res> {
  _$VisitedPostStateCopyWithImpl(this._self, this._then);

  final VisitedPostState _self;
  final $Res Function(VisitedPostState) _then;

/// Create a copy of VisitedPostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VisitedPostState implements VisitedPostState {
  const _VisitedPostState({final  Set<String> items = const {}}): _items = items;
  factory _VisitedPostState.fromJson(Map<String, dynamic> json) => _$VisitedPostStateFromJson(json);

 final  Set<String> _items;
@override@JsonKey() Set<String> get items {
  if (_items is EqualUnmodifiableSetView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_items);
}


/// Create a copy of VisitedPostState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisitedPostStateCopyWith<_VisitedPostState> get copyWith => __$VisitedPostStateCopyWithImpl<_VisitedPostState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VisitedPostStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisitedPostState&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'VisitedPostState(items: $items)';
}


}

/// @nodoc
abstract mixin class _$VisitedPostStateCopyWith<$Res> implements $VisitedPostStateCopyWith<$Res> {
  factory _$VisitedPostStateCopyWith(_VisitedPostState value, $Res Function(_VisitedPostState) _then) = __$VisitedPostStateCopyWithImpl;
@override @useResult
$Res call({
 Set<String> items
});




}
/// @nodoc
class __$VisitedPostStateCopyWithImpl<$Res>
    implements _$VisitedPostStateCopyWith<$Res> {
  __$VisitedPostStateCopyWithImpl(this._self, this._then);

  final _VisitedPostState _self;
  final $Res Function(_VisitedPostState) _then;

/// Create a copy of VisitedPostState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_VisitedPostState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
