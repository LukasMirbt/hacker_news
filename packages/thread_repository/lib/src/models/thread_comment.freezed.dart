// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CurrentUserThreadComment {

 String get id; int get indent; Hnuser get hnuser; DateTime get age; String get htmlText; String? get replyUrl; String? get parentUrl; String? get contextUrl; String? get onUrl; String? get onTitle; int get score; String? get editUrl; String? get deleteUrl;
/// Create a copy of CurrentUserThreadComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentUserThreadCommentCopyWith<CurrentUserThreadComment> get copyWith => _$CurrentUserThreadCommentCopyWithImpl<CurrentUserThreadComment>(this as CurrentUserThreadComment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentUserThreadComment&&(identical(other.id, id) || other.id == id)&&(identical(other.indent, indent) || other.indent == indent)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.replyUrl, replyUrl) || other.replyUrl == replyUrl)&&(identical(other.parentUrl, parentUrl) || other.parentUrl == parentUrl)&&(identical(other.contextUrl, contextUrl) || other.contextUrl == contextUrl)&&(identical(other.onUrl, onUrl) || other.onUrl == onUrl)&&(identical(other.onTitle, onTitle) || other.onTitle == onTitle)&&(identical(other.score, score) || other.score == score)&&(identical(other.editUrl, editUrl) || other.editUrl == editUrl)&&(identical(other.deleteUrl, deleteUrl) || other.deleteUrl == deleteUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,indent,hnuser,age,htmlText,replyUrl,parentUrl,contextUrl,onUrl,onTitle,score,editUrl,deleteUrl);

@override
String toString() {
  return 'CurrentUserThreadComment(id: $id, indent: $indent, hnuser: $hnuser, age: $age, htmlText: $htmlText, replyUrl: $replyUrl, parentUrl: $parentUrl, contextUrl: $contextUrl, onUrl: $onUrl, onTitle: $onTitle, score: $score, editUrl: $editUrl, deleteUrl: $deleteUrl)';
}


}

/// @nodoc
abstract mixin class $CurrentUserThreadCommentCopyWith<$Res>  {
  factory $CurrentUserThreadCommentCopyWith(CurrentUserThreadComment value, $Res Function(CurrentUserThreadComment) _then) = _$CurrentUserThreadCommentCopyWithImpl;
@useResult
$Res call({
 String id, int indent, Hnuser hnuser, DateTime age, String htmlText, String? replyUrl, String? parentUrl, String? contextUrl, String? onUrl, String? onTitle, int score, String? editUrl, String? deleteUrl
});




}
/// @nodoc
class _$CurrentUserThreadCommentCopyWithImpl<$Res>
    implements $CurrentUserThreadCommentCopyWith<$Res> {
  _$CurrentUserThreadCommentCopyWithImpl(this._self, this._then);

  final CurrentUserThreadComment _self;
  final $Res Function(CurrentUserThreadComment) _then;

/// Create a copy of CurrentUserThreadComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? indent = null,Object? hnuser = null,Object? age = null,Object? htmlText = null,Object? replyUrl = freezed,Object? parentUrl = freezed,Object? contextUrl = freezed,Object? onUrl = freezed,Object? onTitle = freezed,Object? score = null,Object? editUrl = freezed,Object? deleteUrl = freezed,}) {
  return _then(CurrentUserThreadComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,indent: null == indent ? _self.indent : indent // ignore: cast_nullable_to_non_nullable
as int,hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,replyUrl: freezed == replyUrl ? _self.replyUrl : replyUrl // ignore: cast_nullable_to_non_nullable
as String?,parentUrl: freezed == parentUrl ? _self.parentUrl : parentUrl // ignore: cast_nullable_to_non_nullable
as String?,contextUrl: freezed == contextUrl ? _self.contextUrl : contextUrl // ignore: cast_nullable_to_non_nullable
as String?,onUrl: freezed == onUrl ? _self.onUrl : onUrl // ignore: cast_nullable_to_non_nullable
as String?,onTitle: freezed == onTitle ? _self.onTitle : onTitle // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,editUrl: freezed == editUrl ? _self.editUrl : editUrl // ignore: cast_nullable_to_non_nullable
as String?,deleteUrl: freezed == deleteUrl ? _self.deleteUrl : deleteUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentUserThreadComment].
extension CurrentUserThreadCommentPatterns on CurrentUserThreadComment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

/// @nodoc
mixin _$OtherUserThreadComment {

 String get id; int get indent; Hnuser get hnuser; DateTime get age; String get htmlText; String? get replyUrl; String? get parentUrl; String? get contextUrl; String? get onUrl; String? get onTitle; String get upvoteUrl; bool get hasBeenUpvoted;
/// Create a copy of OtherUserThreadComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtherUserThreadCommentCopyWith<OtherUserThreadComment> get copyWith => _$OtherUserThreadCommentCopyWithImpl<OtherUserThreadComment>(this as OtherUserThreadComment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtherUserThreadComment&&(identical(other.id, id) || other.id == id)&&(identical(other.indent, indent) || other.indent == indent)&&(identical(other.hnuser, hnuser) || other.hnuser == hnuser)&&(identical(other.age, age) || other.age == age)&&(identical(other.htmlText, htmlText) || other.htmlText == htmlText)&&(identical(other.replyUrl, replyUrl) || other.replyUrl == replyUrl)&&(identical(other.parentUrl, parentUrl) || other.parentUrl == parentUrl)&&(identical(other.contextUrl, contextUrl) || other.contextUrl == contextUrl)&&(identical(other.onUrl, onUrl) || other.onUrl == onUrl)&&(identical(other.onTitle, onTitle) || other.onTitle == onTitle)&&(identical(other.upvoteUrl, upvoteUrl) || other.upvoteUrl == upvoteUrl)&&(identical(other.hasBeenUpvoted, hasBeenUpvoted) || other.hasBeenUpvoted == hasBeenUpvoted));
}


@override
int get hashCode => Object.hash(runtimeType,id,indent,hnuser,age,htmlText,replyUrl,parentUrl,contextUrl,onUrl,onTitle,upvoteUrl,hasBeenUpvoted);

@override
String toString() {
  return 'OtherUserThreadComment(id: $id, indent: $indent, hnuser: $hnuser, age: $age, htmlText: $htmlText, replyUrl: $replyUrl, parentUrl: $parentUrl, contextUrl: $contextUrl, onUrl: $onUrl, onTitle: $onTitle, upvoteUrl: $upvoteUrl, hasBeenUpvoted: $hasBeenUpvoted)';
}


}

/// @nodoc
abstract mixin class $OtherUserThreadCommentCopyWith<$Res>  {
  factory $OtherUserThreadCommentCopyWith(OtherUserThreadComment value, $Res Function(OtherUserThreadComment) _then) = _$OtherUserThreadCommentCopyWithImpl;
@useResult
$Res call({
 String id, int indent, Hnuser hnuser, DateTime age, String htmlText, String? replyUrl, String? parentUrl, String? contextUrl, String? onUrl, String? onTitle, String upvoteUrl, bool hasBeenUpvoted
});




}
/// @nodoc
class _$OtherUserThreadCommentCopyWithImpl<$Res>
    implements $OtherUserThreadCommentCopyWith<$Res> {
  _$OtherUserThreadCommentCopyWithImpl(this._self, this._then);

  final OtherUserThreadComment _self;
  final $Res Function(OtherUserThreadComment) _then;

/// Create a copy of OtherUserThreadComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? indent = null,Object? hnuser = null,Object? age = null,Object? htmlText = null,Object? replyUrl = freezed,Object? parentUrl = freezed,Object? contextUrl = freezed,Object? onUrl = freezed,Object? onTitle = freezed,Object? upvoteUrl = null,Object? hasBeenUpvoted = null,}) {
  return _then(OtherUserThreadComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,indent: null == indent ? _self.indent : indent // ignore: cast_nullable_to_non_nullable
as int,hnuser: null == hnuser ? _self.hnuser : hnuser // ignore: cast_nullable_to_non_nullable
as Hnuser,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as DateTime,htmlText: null == htmlText ? _self.htmlText : htmlText // ignore: cast_nullable_to_non_nullable
as String,replyUrl: freezed == replyUrl ? _self.replyUrl : replyUrl // ignore: cast_nullable_to_non_nullable
as String?,parentUrl: freezed == parentUrl ? _self.parentUrl : parentUrl // ignore: cast_nullable_to_non_nullable
as String?,contextUrl: freezed == contextUrl ? _self.contextUrl : contextUrl // ignore: cast_nullable_to_non_nullable
as String?,onUrl: freezed == onUrl ? _self.onUrl : onUrl // ignore: cast_nullable_to_non_nullable
as String?,onTitle: freezed == onTitle ? _self.onTitle : onTitle // ignore: cast_nullable_to_non_nullable
as String?,upvoteUrl: null == upvoteUrl ? _self.upvoteUrl : upvoteUrl // ignore: cast_nullable_to_non_nullable
as String,hasBeenUpvoted: null == hasBeenUpvoted ? _self.hasBeenUpvoted : hasBeenUpvoted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OtherUserThreadComment].
extension OtherUserThreadCommentPatterns on OtherUserThreadComment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
