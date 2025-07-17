// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThreadComment {

 String get id; Hnuser get hnuser; DateTime get age; String get htmlText; int get indent; int? get score; bool? get hasBeenUpvoted; String? get parentUrl; String? get contextUrl;
/// Create a copy of ThreadComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadCommentCopyWith<ThreadComment> get copyWith => _$ThreadCommentCopyWithImpl<ThreadComment>(this as ThreadComment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadComment&&(identical(other.id, id) || other.id == id)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.indent, indent) || other.indent == indent)&&(identical(other.score, score) || other.score == score)&&(identical(other.hasBeenUpvoted, hasBeenUpvoted) || other.hasBeenUpvoted == hasBeenUpvoted)&&(identical(other.parentUrl, parentUrl) || other.parentUrl == parentUrl)&&(identical(other.contextUrl, contextUrl) || other.contextUrl == contextUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,hnuser,age,htmlText,indent,score,hasBeenUpvoted,parentUrl,contextUrl);

@override
String toString() {
  return 'ThreadComment(id: $id, hnuser: $hnuser, age: $age, htmlText: $htmlText, indent: $indent, score: $score, hasBeenUpvoted: $hasBeenUpvoted, parentUrl: $parentUrl, contextUrl: $contextUrl)';
}


}

/// @nodoc
abstract mixin class $ThreadCommentCopyWith<$Res>  {
  factory $ThreadCommentCopyWith(ThreadComment value, $Res Function(ThreadComment) _then) = _$ThreadCommentCopyWithImpl;
@useResult
$Res call({
 String id, Hnuser hnuser, DateTime age, String htmlText, int indent, int? score, bool? hasBeenUpvoted, String? parentUrl, String? contextUrl
});




}
/// @nodoc
class _$ThreadCommentCopyWithImpl<$Res>
    implements $ThreadCommentCopyWith<$Res> {
  _$ThreadCommentCopyWithImpl(this._self, this._then);

  final ThreadComment _self;
  final $Res Function(ThreadComment) _then;

/// Create a copy of ThreadComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hnuser = null,Object? age = null,Object? htmlText = null,Object? indent = null,Object? score = freezed,Object? hasBeenUpvoted = freezed,Object? parentUrl = freezed,Object? contextUrl = freezed,}) {
  return _then(ThreadComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,indent: null == indent ? _self.indent : indent // ignore: cast_nullable_to_non_nullable
as int,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,hasBeenUpvoted: freezed == hasBeenUpvoted ? _self.hasBeenUpvoted : hasBeenUpvoted // ignore: cast_nullable_to_non_nullable
as bool?,parentUrl: freezed == parentUrl ? _self.parentUrl : parentUrl // ignore: cast_nullable_to_non_nullable
as String?,contextUrl: freezed == contextUrl ? _self.contextUrl : contextUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


// dart format on
