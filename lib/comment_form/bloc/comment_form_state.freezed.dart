// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentFormState {

 Post get post; CommentFormModel get form; CommentFormStatus get status;
/// Create a copy of CommentFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentFormStateCopyWith<CommentFormState> get copyWith => _$CommentFormStateCopyWithImpl<CommentFormState>(this as CommentFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentFormState&&(identical(other.post, post) || other.post == post)&&(identical(other.form, form) || other.form == form)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,post,form,status);

@override
String toString() {
  return 'CommentFormState(post: $post, form: $form, status: $status)';
}


}

/// @nodoc
abstract mixin class $CommentFormStateCopyWith<$Res>  {
  factory $CommentFormStateCopyWith(CommentFormState value, $Res Function(CommentFormState) _then) = _$CommentFormStateCopyWithImpl;
@useResult
$Res call({
 Post post, CommentFormModel form, CommentFormStatus status
});


$PostCopyWith<$Res> get post;

}
/// @nodoc
class _$CommentFormStateCopyWithImpl<$Res>
    implements $CommentFormStateCopyWith<$Res> {
  _$CommentFormStateCopyWithImpl(this._self, this._then);

  final CommentFormState _self;
  final $Res Function(CommentFormState) _then;

/// Create a copy of CommentFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? post = null,Object? form = null,Object? status = null,}) {
  return _then(_self.copyWith(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CommentFormModel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommentFormStatus,
  ));
}
/// Create a copy of CommentFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}


/// @nodoc


class _CommentFormState extends CommentFormState {
  const _CommentFormState({required this.post, required this.form, this.status = CommentFormStatus.initial}): super._();
  

@override final  Post post;
@override final  CommentFormModel form;
@override@JsonKey() final  CommentFormStatus status;

/// Create a copy of CommentFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentFormStateCopyWith<_CommentFormState> get copyWith => __$CommentFormStateCopyWithImpl<_CommentFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentFormState&&(identical(other.post, post) || other.post == post)&&(identical(other.form, form) || other.form == form)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,post,form,status);

@override
String toString() {
  return 'CommentFormState(post: $post, form: $form, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CommentFormStateCopyWith<$Res> implements $CommentFormStateCopyWith<$Res> {
  factory _$CommentFormStateCopyWith(_CommentFormState value, $Res Function(_CommentFormState) _then) = __$CommentFormStateCopyWithImpl;
@override @useResult
$Res call({
 Post post, CommentFormModel form, CommentFormStatus status
});


@override $PostCopyWith<$Res> get post;

}
/// @nodoc
class __$CommentFormStateCopyWithImpl<$Res>
    implements _$CommentFormStateCopyWith<$Res> {
  __$CommentFormStateCopyWithImpl(this._self, this._then);

  final _CommentFormState _self;
  final $Res Function(_CommentFormState) _then;

/// Create a copy of CommentFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? post = null,Object? form = null,Object? status = null,}) {
  return _then(_CommentFormState(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,form: null == form ? _self.form : form // ignore: cast_nullable_to_non_nullable
as CommentFormModel,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CommentFormStatus,
  ));
}

/// Create a copy of CommentFormState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}
}

// dart format on
