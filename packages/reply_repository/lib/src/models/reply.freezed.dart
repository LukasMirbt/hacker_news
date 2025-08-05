// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reply.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Reply {

 String get id; String get parentId; int get indent; Hnuser get hnuser; DateTime get age; String get htmlText; String? get replyUrl; int get score;
/// Create a copy of Reply
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReplyCopyWith<Reply> get copyWith => _$ReplyCopyWithImpl<Reply>(this as Reply, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reply&&(identical(other.id, id) || other.id == id)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.indent, indent) || other.indent == indent)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.replyUrl, replyUrl) || other.replyUrl == replyUrl)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,id,parentId,indent,hnuser,age,htmlText,replyUrl,score);

@override
String toString() {
  return 'Reply(id: $id, parentId: $parentId, indent: $indent, hnuser: $hnuser, age: $age, htmlText: $htmlText, replyUrl: $replyUrl, score: $score)';
}


}

/// @nodoc
abstract mixin class $ReplyCopyWith<$Res>  {
  factory $ReplyCopyWith(Reply value, $Res Function(Reply) _then) = _$ReplyCopyWithImpl;
@useResult
$Res call({
 String id, String parentId, int indent, Hnuser hnuser, DateTime age, String htmlText, String? replyUrl, int score
});




}
/// @nodoc
class _$ReplyCopyWithImpl<$Res>
    implements $ReplyCopyWith<$Res> {
  _$ReplyCopyWithImpl(this._self, this._then);

  final Reply _self;
  final $Res Function(Reply) _then;

/// Create a copy of Reply
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? parentId = null,Object? indent = null,Object? hnuser = null,Object? age = null,Object? htmlText = null,Object? replyUrl = freezed,Object? score = null,}) {
  return _then(Reply(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,parentId: null == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String,indent: null == indent ? _self.indent : indent // ignore: cast_nullable_to_non_nullable
as int,hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,replyUrl: freezed == replyUrl ? _self.replyUrl : replyUrl // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


// dart format on
