// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThreadCommentModel {

 ThreadComment get comment; bool get isExpanded; bool get isParentExpanded; DateFormatter get formatter;
/// Create a copy of ThreadCommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreadCommentModelCopyWith<ThreadCommentModel> get copyWith => _$ThreadCommentModelCopyWithImpl<ThreadCommentModel>(this as ThreadCommentModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreadCommentModel&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&(identical(other.isParentExpanded, isParentExpanded) || other.isParentExpanded == isParentExpanded)&&(identical(other.formatter, formatter) || other.formatter == formatter));
}


@override
int get hashCode => Object.hash(runtimeType,comment,isExpanded,isParentExpanded,formatter);

@override
String toString() {
  return 'ThreadCommentModel(comment: $comment, isExpanded: $isExpanded, isParentExpanded: $isParentExpanded, formatter: $formatter)';
}


}

/// @nodoc
abstract mixin class $ThreadCommentModelCopyWith<$Res>  {
  factory $ThreadCommentModelCopyWith(ThreadCommentModel value, $Res Function(ThreadCommentModel) _then) = _$ThreadCommentModelCopyWithImpl;
@useResult
$Res call({
 ThreadComment comment, bool isExpanded, bool isParentExpanded, DateFormatter formatter
});


$ThreadCommentCopyWith<$Res> get comment;

}
/// @nodoc
class _$ThreadCommentModelCopyWithImpl<$Res>
    implements $ThreadCommentModelCopyWith<$Res> {
  _$ThreadCommentModelCopyWithImpl(this._self, this._then);

  final ThreadCommentModel _self;
  final $Res Function(ThreadCommentModel) _then;

/// Create a copy of ThreadCommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comment = null,Object? isExpanded = null,Object? isParentExpanded = null,Object? formatter = null,}) {
  return _then(_self.copyWith(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as ThreadComment,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,isParentExpanded: null == isParentExpanded ? _self.isParentExpanded : isParentExpanded // ignore: cast_nullable_to_non_nullable
as bool,formatter: null == formatter ? _self.formatter : formatter // ignore: cast_nullable_to_non_nullable
as DateFormatter,
  ));
}
/// Create a copy of ThreadCommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThreadCommentCopyWith<$Res> get comment {
  
  return $ThreadCommentCopyWith<$Res>(_self.comment, (value) {
    return _then(_self.copyWith(comment: value));
  });
}
}


/// @nodoc


class _ThreadCommentModel extends ThreadCommentModel {
  const _ThreadCommentModel({required this.comment, this.isExpanded = true, this.isParentExpanded = true, this.formatter = const DateFormatter()}): super._();
  

@override final  ThreadComment comment;
@override@JsonKey() final  bool isExpanded;
@override@JsonKey() final  bool isParentExpanded;
@override@JsonKey() final  DateFormatter formatter;

/// Create a copy of ThreadCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreadCommentModelCopyWith<_ThreadCommentModel> get copyWith => __$ThreadCommentModelCopyWithImpl<_ThreadCommentModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreadCommentModel&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&(identical(other.isParentExpanded, isParentExpanded) || other.isParentExpanded == isParentExpanded)&&(identical(other.formatter, formatter) || other.formatter == formatter));
}


@override
int get hashCode => Object.hash(runtimeType,comment,isExpanded,isParentExpanded,formatter);

@override
String toString() {
  return 'ThreadCommentModel(comment: $comment, isExpanded: $isExpanded, isParentExpanded: $isParentExpanded, formatter: $formatter)';
}


}

/// @nodoc
abstract mixin class _$ThreadCommentModelCopyWith<$Res> implements $ThreadCommentModelCopyWith<$Res> {
  factory _$ThreadCommentModelCopyWith(_ThreadCommentModel value, $Res Function(_ThreadCommentModel) _then) = __$ThreadCommentModelCopyWithImpl;
@override @useResult
$Res call({
 ThreadComment comment, bool isExpanded, bool isParentExpanded, DateFormatter formatter
});


@override $ThreadCommentCopyWith<$Res> get comment;

}
/// @nodoc
class __$ThreadCommentModelCopyWithImpl<$Res>
    implements _$ThreadCommentModelCopyWith<$Res> {
  __$ThreadCommentModelCopyWithImpl(this._self, this._then);

  final _ThreadCommentModel _self;
  final $Res Function(_ThreadCommentModel) _then;

/// Create a copy of ThreadCommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comment = null,Object? isExpanded = null,Object? isParentExpanded = null,Object? formatter = null,}) {
  return _then(_ThreadCommentModel(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as ThreadComment,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,isParentExpanded: null == isParentExpanded ? _self.isParentExpanded : isParentExpanded // ignore: cast_nullable_to_non_nullable
as bool,formatter: null == formatter ? _self.formatter : formatter // ignore: cast_nullable_to_non_nullable
as DateFormatter,
  ));
}

/// Create a copy of ThreadCommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThreadCommentCopyWith<$Res> get comment {
  
  return $ThreadCommentCopyWith<$Res>(_self.comment, (value) {
    return _then(_self.copyWith(comment: value));
  });
}
}

// dart format on
