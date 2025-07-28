// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply_parent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReplyParent {

 String get id; String get upvoteUrl; bool get hasBeenUpvoted; Hnuser get hnuser; DateTime get age; String get htmlText;
/// Create a copy of ReplyParent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyParentCopyWith<ReplyParent> get copyWith => _$ReplyParentCopyWithImpl<ReplyParent>(this as ReplyParent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReplyParent&&(identical(other.id, id) || other.id == id)&&(identical(other.upvoteUrl, upvoteUrl) || other.upvoteUrl == upvoteUrl)&&(identical(other.hasBeenUpvoted, hasBeenUpvoted) || other.hasBeenUpvoted == hasBeenUpvoted)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText));
}


@override
int get hashCode => Object.hash(runtimeType,id,upvoteUrl,hasBeenUpvoted,hnuser,age,htmlText);

@override
String toString() {
  return 'ReplyParent(id: $id, upvoteUrl: $upvoteUrl, hasBeenUpvoted: $hasBeenUpvoted, hnuser: $hnuser, age: $age, htmlText: $htmlText)';
}


}

/// @nodoc
abstract mixin class $ReplyParentCopyWith<$Res>  {
  factory $ReplyParentCopyWith(ReplyParent value, $Res Function(ReplyParent) _then) = _$ReplyParentCopyWithImpl;
@useResult
$Res call({
 String id, String upvoteUrl, bool hasBeenUpvoted, Hnuser hnuser, DateTime age, String htmlText
});




}
/// @nodoc
class _$ReplyParentCopyWithImpl<$Res>
    implements $ReplyParentCopyWith<$Res> {
  _$ReplyParentCopyWithImpl(this._self, this._then);

  final ReplyParent _self;
  final $Res Function(ReplyParent) _then;

/// Create a copy of ReplyParent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? upvoteUrl = null,Object? hasBeenUpvoted = null,Object? hnuser = null,Object? age = null,Object? htmlText = null,}) {
  return _then(ReplyParent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,upvoteUrl: null == upvoteUrl ? _self.upvoteUrl : upvoteUrl // ignore: cast_nullable_to_non_nullable
as String,hasBeenUpvoted: null == hasBeenUpvoted ? _self.hasBeenUpvoted : hasBeenUpvoted // ignore: cast_nullable_to_non_nullable
as bool,hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
