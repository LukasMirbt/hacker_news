// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentForm {

 String get parentId; String get goto; String get hmac; String get text;
/// Create a copy of CommentForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentFormCopyWith<CommentForm> get copyWith => _$CommentFormCopyWithImpl<CommentForm>(this as CommentForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentForm&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.goto, goto) || other.goto == goto)&&(identical(other.hmac, hmac) || other.hmac == hmac)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,parentId,goto,hmac,text);

@override
String toString() {
  return 'CommentForm(parentId: $parentId, goto: $goto, hmac: $hmac, text: $text)';
}


}

/// @nodoc
abstract mixin class $CommentFormCopyWith<$Res>  {
  factory $CommentFormCopyWith(CommentForm value, $Res Function(CommentForm) _then) = _$CommentFormCopyWithImpl;
@useResult
$Res call({
 String parentId, String goto, String hmac, String text
});




}
/// @nodoc
class _$CommentFormCopyWithImpl<$Res>
    implements $CommentFormCopyWith<$Res> {
  _$CommentFormCopyWithImpl(this._self, this._then);

  final CommentForm _self;
  final $Res Function(CommentForm) _then;

/// Create a copy of CommentForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? parentId = null,Object? goto = null,Object? hmac = null,Object? text = null,}) {
  return _then(CommentForm(
parentId: null == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String,goto: null == goto ? _self.goto : goto // ignore: cast_nullable_to_non_nullable
as String,hmac: null == hmac ? _self.hmac : hmac // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
