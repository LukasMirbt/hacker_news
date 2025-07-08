// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_header_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostHeaderState {

 String get id; PostHeaderModel get header;
/// Create a copy of PostHeaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostHeaderStateCopyWith<PostHeaderState> get copyWith => _$PostHeaderStateCopyWithImpl<PostHeaderState>(this as PostHeaderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostHeaderState&&(identical(other.id, id) || other.id == id)&&(identical(other.header, header) || other.header == header));
}


@override
int get hashCode => Object.hash(runtimeType,id,header);

@override
String toString() {
  return 'PostHeaderState(id: $id, header: $header)';
}


}

/// @nodoc
abstract mixin class $PostHeaderStateCopyWith<$Res>  {
  factory $PostHeaderStateCopyWith(PostHeaderState value, $Res Function(PostHeaderState) _then) = _$PostHeaderStateCopyWithImpl;
@useResult
$Res call({
 String id, PostHeaderModel header
});




}
/// @nodoc
class _$PostHeaderStateCopyWithImpl<$Res>
    implements $PostHeaderStateCopyWith<$Res> {
  _$PostHeaderStateCopyWithImpl(this._self, this._then);

  final PostHeaderState _self;
  final $Res Function(PostHeaderState) _then;

/// Create a copy of PostHeaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? header = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as PostHeaderModel,
  ));
}

}


/// @nodoc


class _PostHeaderState implements PostHeaderState {
  const _PostHeaderState({required this.id, required this.header});
  

@override final  String id;
@override final  PostHeaderModel header;

/// Create a copy of PostHeaderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostHeaderStateCopyWith<_PostHeaderState> get copyWith => __$PostHeaderStateCopyWithImpl<_PostHeaderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostHeaderState&&(identical(other.id, id) || other.id == id)&&(identical(other.header, header) || other.header == header));
}


@override
int get hashCode => Object.hash(runtimeType,id,header);

@override
String toString() {
  return 'PostHeaderState(id: $id, header: $header)';
}


}

/// @nodoc
abstract mixin class _$PostHeaderStateCopyWith<$Res> implements $PostHeaderStateCopyWith<$Res> {
  factory _$PostHeaderStateCopyWith(_PostHeaderState value, $Res Function(_PostHeaderState) _then) = __$PostHeaderStateCopyWithImpl;
@override @useResult
$Res call({
 String id, PostHeaderModel header
});




}
/// @nodoc
class __$PostHeaderStateCopyWithImpl<$Res>
    implements _$PostHeaderStateCopyWith<$Res> {
  __$PostHeaderStateCopyWithImpl(this._self, this._then);

  final _PostHeaderState _self;
  final $Res Function(_PostHeaderState) _then;

/// Create a copy of PostHeaderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? header = null,}) {
  return _then(_PostHeaderState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as PostHeaderModel,
  ));
}


}

// dart format on
