// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentState {

 Post get post; CommentForm get form; CommentStatus get status;
/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentStateCopyWith<CommentState> get copyWith => _$CommentStateCopyWithImpl<CommentState>(this as CommentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentState&&(identical(other.post, post) || other.post == post)&&(identical(other.form, form) || other.form == form)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,post,form,status);

@override
String toString() {
  return 'CommentState(post: $post, form: $form, status: $status)';
}


}

/// @nodoc
abstract mixin class $CommentStateCopyWith<$Res>  {
  factory $CommentStateCopyWith(CommentState value, $Res Function(CommentState) _then) = _$CommentStateCopyWithImpl;
@useResult
$Res call({
 Post post, CommentForm form, CommentStatus status
});


$PostCopyWith<$Res> get post;$CommentFormCopyWith<$Res> get form;

}
/// @nodoc
class _$CommentStateCopyWithImpl<$Res>
    implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._self, this._then);

  final CommentState _self;
  final $Res Function(CommentState) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? post = null,Object? form = null,Object? status = null,}) {
  return _then(_self.copyWith(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CommentForm,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommentStatus,
  ));
}
/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentFormCopyWith<$Res> get form {
  
  return $CommentFormCopyWith<$Res>(_self.form, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}


/// @nodoc


class _CommentState extends CommentState {
  const _CommentState({required this.post, required this.form, this.status = CommentStatus.initial}): super._();
  

@override final  Post post;
@override final  CommentForm form;
@override@JsonKey() final  CommentStatus status;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentStateCopyWith<_CommentState> get copyWith => __$CommentStateCopyWithImpl<_CommentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentState&&(identical(other.post, post) || other.post == post)&&(identical(other.form, form) || other.form == form)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,post,form,status);

@override
String toString() {
  return 'CommentState(post: $post, form: $form, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CommentStateCopyWith<$Res> implements $CommentStateCopyWith<$Res> {
  factory _$CommentStateCopyWith(_CommentState value, $Res Function(_CommentState) _then) = __$CommentStateCopyWithImpl;
@override @useResult
$Res call({
 Post post, CommentForm form, CommentStatus status
});


@override $PostCopyWith<$Res> get post;@override $CommentFormCopyWith<$Res> get form;

}
/// @nodoc
class __$CommentStateCopyWithImpl<$Res>
    implements _$CommentStateCopyWith<$Res> {
  __$CommentStateCopyWithImpl(this._self, this._then);

  final _CommentState _self;
  final $Res Function(_CommentState) _then;

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? post = null,Object? form = null,Object? status = null,}) {
  return _then(_CommentState(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CommentForm,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommentStatus,
  ));
}

/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}/// Create a copy of CommentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentFormCopyWith<$Res> get form {
  
  return $CommentFormCopyWith<$Res>(_self.form, (value) {
    return _then(_self.copyWith(form: value));
  });
}
}

// dart format on
