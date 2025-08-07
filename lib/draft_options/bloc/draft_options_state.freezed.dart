// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_options_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DraftOptionsState {

 DraftModel get draft;
/// Create a copy of DraftOptionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftOptionsStateCopyWith<DraftOptionsState> get copyWith => _$DraftOptionsStateCopyWithImpl<DraftOptionsState>(this as DraftOptionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftOptionsState&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'DraftOptionsState(draft: $draft)';
}


}

/// @nodoc
abstract mixin class $DraftOptionsStateCopyWith<$Res>  {
  factory $DraftOptionsStateCopyWith(DraftOptionsState value, $Res Function(DraftOptionsState) _then) = _$DraftOptionsStateCopyWithImpl;
@useResult
$Res call({
 DraftModel draft
});




}
/// @nodoc
class _$DraftOptionsStateCopyWithImpl<$Res>
    implements $DraftOptionsStateCopyWith<$Res> {
  _$DraftOptionsStateCopyWithImpl(this._self, this._then);

  final DraftOptionsState _self;
  final $Res Function(DraftOptionsState) _then;

/// Create a copy of DraftOptionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? draft = null,}) {
  return _then(_self.copyWith(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as DraftModel,
  ));
}

}


/// @nodoc


class _DraftOptionsState implements DraftOptionsState {
  const _DraftOptionsState({required this.draft});
  

@override final  DraftModel draft;

/// Create a copy of DraftOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftOptionsStateCopyWith<_DraftOptionsState> get copyWith => __$DraftOptionsStateCopyWithImpl<_DraftOptionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftOptionsState&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'DraftOptionsState(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$DraftOptionsStateCopyWith<$Res> implements $DraftOptionsStateCopyWith<$Res> {
  factory _$DraftOptionsStateCopyWith(_DraftOptionsState value, $Res Function(_DraftOptionsState) _then) = __$DraftOptionsStateCopyWithImpl;
@override @useResult
$Res call({
 DraftModel draft
});




}
/// @nodoc
class __$DraftOptionsStateCopyWithImpl<$Res>
    implements _$DraftOptionsStateCopyWith<$Res> {
  __$DraftOptionsStateCopyWithImpl(this._self, this._then);

  final _DraftOptionsState _self;
  final $Res Function(_DraftOptionsState) _then;

/// Create a copy of DraftOptionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_DraftOptionsState(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as DraftModel,
  ));
}


}

// dart format on
