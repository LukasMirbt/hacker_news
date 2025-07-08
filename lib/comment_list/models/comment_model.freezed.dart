// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommentModel {

 Comment get comment; bool get isExpanded; bool get isParentExpanded; DateFormatter get formatter;
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentModelCopyWith<CommentModel> get copyWith => _$CommentModelCopyWithImpl<CommentModel>(this as CommentModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentModel&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&(identical(other.isParentExpanded, isParentExpanded) || other.isParentExpanded == isParentExpanded)&&(identical(other.formatter, formatter) || other.formatter == formatter));
}


@override
int get hashCode => Object.hash(runtimeType,comment,isExpanded,isParentExpanded,formatter);

@override
String toString() {
  return 'CommentModel(comment: $comment, isExpanded: $isExpanded, isParentExpanded: $isParentExpanded, formatter: $formatter)';
}


}

/// @nodoc
abstract mixin class $CommentModelCopyWith<$Res>  {
  factory $CommentModelCopyWith(CommentModel value, $Res Function(CommentModel) _then) = _$CommentModelCopyWithImpl;
@useResult
$Res call({
 Comment comment, bool isExpanded, bool isParentExpanded, DateFormatter formatter
});


$CommentCopyWith<$Res> get comment;

}
/// @nodoc
class _$CommentModelCopyWithImpl<$Res>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._self, this._then);

  final CommentModel _self;
  final $Res Function(CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? comment = null,Object? isExpanded = null,Object? isParentExpanded = null,Object? formatter = null,}) {
  return _then(_self.copyWith(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as Comment,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,isParentExpanded: null == isParentExpanded ? _self.isParentExpanded : isParentExpanded // ignore: cast_nullable_to_non_nullable
as bool,formatter: null == formatter ? _self.formatter : formatter // ignore: cast_nullable_to_non_nullable
as DateFormatter,
  ));
}
/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentCopyWith<$Res> get comment {
  
  return $CommentCopyWith<$Res>(_self.comment, (value) {
    return _then(_self.copyWith(comment: value));
  });
}
}


/// @nodoc


class _CommentModel extends CommentModel {
  const _CommentModel({required this.comment, this.isExpanded = true, this.isParentExpanded = true, this.formatter = const DateFormatter()}): super._();
  

@override final  Comment comment;
@override@JsonKey() final  bool isExpanded;
@override@JsonKey() final  bool isParentExpanded;
@override@JsonKey() final  DateFormatter formatter;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentModelCopyWith<_CommentModel> get copyWith => __$CommentModelCopyWithImpl<_CommentModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentModel&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded)&&(identical(other.isParentExpanded, isParentExpanded) || other.isParentExpanded == isParentExpanded)&&(identical(other.formatter, formatter) || other.formatter == formatter));
}


@override
int get hashCode => Object.hash(runtimeType,comment,isExpanded,isParentExpanded,formatter);

@override
String toString() {
  return 'CommentModel(comment: $comment, isExpanded: $isExpanded, isParentExpanded: $isParentExpanded, formatter: $formatter)';
}


}

/// @nodoc
abstract mixin class _$CommentModelCopyWith<$Res> implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(_CommentModel value, $Res Function(_CommentModel) _then) = __$CommentModelCopyWithImpl;
@override @useResult
$Res call({
 Comment comment, bool isExpanded, bool isParentExpanded, DateFormatter formatter
});


@override $CommentCopyWith<$Res> get comment;

}
/// @nodoc
class __$CommentModelCopyWithImpl<$Res>
    implements _$CommentModelCopyWith<$Res> {
  __$CommentModelCopyWithImpl(this._self, this._then);

  final _CommentModel _self;
  final $Res Function(_CommentModel) _then;

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? comment = null,Object? isExpanded = null,Object? isParentExpanded = null,Object? formatter = null,}) {
  return _then(_CommentModel(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as Comment,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,isParentExpanded: null == isParentExpanded ? _self.isParentExpanded : isParentExpanded // ignore: cast_nullable_to_non_nullable
as bool,formatter: null == formatter ? _self.formatter : formatter // ignore: cast_nullable_to_non_nullable
as DateFormatter,
  ));
}

/// Create a copy of CommentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentCopyWith<$Res> get comment {
  
  return $CommentCopyWith<$Res>(_self.comment, (value) {
    return _then(_self.copyWith(comment: value));
  });
}
}

// dart format on
