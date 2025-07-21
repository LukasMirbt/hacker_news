// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReplyForm {

 Hnuser get hnuser; DateTime get age; String get htmlText; String get parent; String get goto; String get hmac; String get text;
/// Create a copy of ReplyForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyFormCopyWith<ReplyForm> get copyWith => _$ReplyFormCopyWithImpl<ReplyForm>(this as ReplyForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyForm&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.parent, parent) || other.parent == parent)&&(identical(other.goto, goto) || other.goto == goto)&&(identical(other.hmac, hmac) || other.hmac == hmac)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,hnuser,age,htmlText,parent,goto,hmac,text);

@override
String toString() {
  return 'ReplyForm(hnuser: $hnuser, age: $age, htmlText: $htmlText, parent: $parent, goto: $goto, hmac: $hmac, text: $text)';
}


}

/// @nodoc
abstract mixin class $ReplyFormCopyWith<$Res>  {
  factory $ReplyFormCopyWith(ReplyForm value, $Res Function(ReplyForm) _then) = _$ReplyFormCopyWithImpl;
@useResult
$Res call({
 Hnuser hnuser, DateTime age, String htmlText, String parent, String goto, String hmac, String text
});




}
/// @nodoc
class _$ReplyFormCopyWithImpl<$Res>
    implements $ReplyFormCopyWith<$Res> {
  _$ReplyFormCopyWithImpl(this._self, this._then);

  final ReplyForm _self;
  final $Res Function(ReplyForm) _then;

/// Create a copy of ReplyForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hnuser = null,Object? age = null,Object? htmlText = null,Object? parent = null,Object? goto = null,Object? hmac = null,Object? text = null,}) {
  return _then(ReplyForm(
hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,parent: null == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as String,goto: null == goto ? _self.goto : goto // ignore: cast_nullable_to_non_nullable
as String,hmac: null == hmac ? _self.hmac : hmac // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
