// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'draft_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DraftState {

 List<Draft> get drafts; DraftStatus get status;
/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftStateCopyWith<DraftState> get copyWith => _$DraftStateCopyWithImpl<DraftState>(this as DraftState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftState&&const DeepCollectionEquality().equals(other.drafts, drafts)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(drafts),status);

@override
String toString() {
  return 'DraftState(drafts: $drafts, status: $status)';
}


}

/// @nodoc
abstract mixin class $DraftStateCopyWith<$Res>  {
  factory $DraftStateCopyWith(DraftState value, $Res Function(DraftState) _then) = _$DraftStateCopyWithImpl;
@useResult
$Res call({
 List<Draft> drafts, DraftStatus status
});




}
/// @nodoc
class _$DraftStateCopyWithImpl<$Res>
    implements $DraftStateCopyWith<$Res> {
  _$DraftStateCopyWithImpl(this._self, this._then);

  final DraftState _self;
  final $Res Function(DraftState) _then;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drafts = null,Object? status = null,}) {
  return _then(_self.copyWith(
drafts: null == drafts ? _self.drafts : drafts // ignore: cast_nullable_to_non_nullable
as List<Draft>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DraftStatus,
  ));
}

}


/// @nodoc


class _DraftState implements DraftState {
  const _DraftState({final  List<Draft> drafts = const [], this.status = DraftStatus.loading}): _drafts = drafts;
  

 final  List<Draft> _drafts;
@override@JsonKey() List<Draft> get drafts {
  if (_drafts is EqualUnmodifiableListView) return _drafts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_drafts);
}

@override@JsonKey() final  DraftStatus status;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftStateCopyWith<_DraftState> get copyWith => __$DraftStateCopyWithImpl<_DraftState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftState&&const DeepCollectionEquality().equals(other._drafts, _drafts)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_drafts),status);

@override
String toString() {
  return 'DraftState(drafts: $drafts, status: $status)';
}


}

/// @nodoc
abstract mixin class _$DraftStateCopyWith<$Res> implements $DraftStateCopyWith<$Res> {
  factory _$DraftStateCopyWith(_DraftState value, $Res Function(_DraftState) _then) = __$DraftStateCopyWithImpl;
@override @useResult
$Res call({
 List<Draft> drafts, DraftStatus status
});




}
/// @nodoc
class __$DraftStateCopyWithImpl<$Res>
    implements _$DraftStateCopyWith<$Res> {
  __$DraftStateCopyWithImpl(this._self, this._then);

  final _DraftState _self;
  final $Res Function(_DraftState) _then;

/// Create a copy of DraftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drafts = null,Object? status = null,}) {
  return _then(_DraftState(
drafts: null == drafts ? _self._drafts : drafts // ignore: cast_nullable_to_non_nullable
as List<Draft>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DraftStatus,
  ));
}


}

// dart format on
