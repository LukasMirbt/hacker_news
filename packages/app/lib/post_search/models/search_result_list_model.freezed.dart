// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchResultListModel {

 List<Comment> get comments; String get query; TextParser get textParser; SnippetExtractor get snippetExtractor;
/// Create a copy of SearchResultListModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultListModelCopyWith<SearchResultListModel> get copyWith => _$SearchResultListModelCopyWithImpl<SearchResultListModel>(this as SearchResultListModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResultListModel&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.query, query) || other.query == query)&&(identical(other.textParser, textParser) || other.textParser == textParser)&&(identical(other.snippetExtractor, snippetExtractor) || other.snippetExtractor == snippetExtractor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(comments),query,textParser,snippetExtractor);

@override
String toString() {
  return 'SearchResultListModel(comments: $comments, query: $query, textParser: $textParser, snippetExtractor: $snippetExtractor)';
}


}

/// @nodoc
abstract mixin class $SearchResultListModelCopyWith<$Res>  {
  factory $SearchResultListModelCopyWith(SearchResultListModel value, $Res Function(SearchResultListModel) _then) = _$SearchResultListModelCopyWithImpl;
@useResult
$Res call({
 List<Comment> comments, String query, TextParser textParser, SnippetExtractor snippetExtractor
});




}
/// @nodoc
class _$SearchResultListModelCopyWithImpl<$Res>
    implements $SearchResultListModelCopyWith<$Res> {
  _$SearchResultListModelCopyWithImpl(this._self, this._then);

  final SearchResultListModel _self;
  final $Res Function(SearchResultListModel) _then;

/// Create a copy of SearchResultListModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comments = null,Object? query = null,Object? textParser = null,Object? snippetExtractor = null,}) {
  return _then(_self.copyWith(
comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,textParser: null == textParser ? _self.textParser : textParser // ignore: cast_nullable_to_non_nullable
as TextParser,snippetExtractor: null == snippetExtractor ? _self.snippetExtractor : snippetExtractor // ignore: cast_nullable_to_non_nullable
as SnippetExtractor,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchResultListModel].
extension SearchResultListModelPatterns on SearchResultListModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchResultListModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchResultListModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchResultListModel value)  $default,){
final _that = this;
switch (_that) {
case _SearchResultListModel():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchResultListModel value)?  $default,){
final _that = this;
switch (_that) {
case _SearchResultListModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Comment> comments,  String query,  TextParser textParser,  SnippetExtractor snippetExtractor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchResultListModel() when $default != null:
return $default(_that.comments,_that.query,_that.textParser,_that.snippetExtractor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Comment> comments,  String query,  TextParser textParser,  SnippetExtractor snippetExtractor)  $default,) {final _that = this;
switch (_that) {
case _SearchResultListModel():
return $default(_that.comments,_that.query,_that.textParser,_that.snippetExtractor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Comment> comments,  String query,  TextParser textParser,  SnippetExtractor snippetExtractor)?  $default,) {final _that = this;
switch (_that) {
case _SearchResultListModel() when $default != null:
return $default(_that.comments,_that.query,_that.textParser,_that.snippetExtractor);case _:
  return null;

}
}

}

/// @nodoc


class _SearchResultListModel extends SearchResultListModel {
  const _SearchResultListModel({required final  List<Comment> comments, required this.query, this.textParser = const TextParser(), this.snippetExtractor = const SnippetExtractor()}): _comments = comments,super._();
  

 final  List<Comment> _comments;
@override List<Comment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override final  String query;
@override@JsonKey() final  TextParser textParser;
@override@JsonKey() final  SnippetExtractor snippetExtractor;

/// Create a copy of SearchResultListModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultListModelCopyWith<_SearchResultListModel> get copyWith => __$SearchResultListModelCopyWithImpl<_SearchResultListModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultListModel&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.query, query) || other.query == query)&&(identical(other.textParser, textParser) || other.textParser == textParser)&&(identical(other.snippetExtractor, snippetExtractor) || other.snippetExtractor == snippetExtractor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comments),query,textParser,snippetExtractor);

@override
String toString() {
  return 'SearchResultListModel(comments: $comments, query: $query, textParser: $textParser, snippetExtractor: $snippetExtractor)';
}


}

/// @nodoc
abstract mixin class _$SearchResultListModelCopyWith<$Res> implements $SearchResultListModelCopyWith<$Res> {
  factory _$SearchResultListModelCopyWith(_SearchResultListModel value, $Res Function(_SearchResultListModel) _then) = __$SearchResultListModelCopyWithImpl;
@override @useResult
$Res call({
 List<Comment> comments, String query, TextParser textParser, SnippetExtractor snippetExtractor
});




}
/// @nodoc
class __$SearchResultListModelCopyWithImpl<$Res>
    implements _$SearchResultListModelCopyWith<$Res> {
  __$SearchResultListModelCopyWithImpl(this._self, this._then);

  final _SearchResultListModel _self;
  final $Res Function(_SearchResultListModel) _then;

/// Create a copy of SearchResultListModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comments = null,Object? query = null,Object? textParser = null,Object? snippetExtractor = null,}) {
  return _then(_SearchResultListModel(
comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,textParser: null == textParser ? _self.textParser : textParser // ignore: cast_nullable_to_non_nullable
as TextParser,snippetExtractor: null == snippetExtractor ? _self.snippetExtractor : snippetExtractor // ignore: cast_nullable_to_non_nullable
as SnippetExtractor,
  ));
}


}

// dart format on
