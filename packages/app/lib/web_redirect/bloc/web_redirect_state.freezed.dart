// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_redirect_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WebRedirectState {

 WebRedirectModel get redirect; InitialLoadStatus get initialLoadStatus; WebRedirectProgressModel get progress; bool get canGoBack; bool get canGoForward;
/// Create a copy of WebRedirectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebRedirectStateCopyWith<WebRedirectState> get copyWith => _$WebRedirectStateCopyWithImpl<WebRedirectState>(this as WebRedirectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebRedirectState&&(identical(other.redirect, redirect) || other.redirect == redirect)&&(identical(other.initialLoadStatus, initialLoadStatus) || other.initialLoadStatus == initialLoadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward));
}


@override
int get hashCode => Object.hash(runtimeType,redirect,initialLoadStatus,progress,canGoBack,canGoForward);

@override
String toString() {
  return 'WebRedirectState(redirect: $redirect, initialLoadStatus: $initialLoadStatus, progress: $progress, canGoBack: $canGoBack, canGoForward: $canGoForward)';
}


}

/// @nodoc
abstract mixin class $WebRedirectStateCopyWith<$Res>  {
  factory $WebRedirectStateCopyWith(WebRedirectState value, $Res Function(WebRedirectState) _then) = _$WebRedirectStateCopyWithImpl;
@useResult
$Res call({
 WebRedirectModel redirect, InitialLoadStatus initialLoadStatus, WebRedirectProgressModel progress, bool canGoBack, bool canGoForward
});




}
/// @nodoc
class _$WebRedirectStateCopyWithImpl<$Res>
    implements $WebRedirectStateCopyWith<$Res> {
  _$WebRedirectStateCopyWithImpl(this._self, this._then);

  final WebRedirectState _self;
  final $Res Function(WebRedirectState) _then;

/// Create a copy of WebRedirectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? redirect = null,Object? initialLoadStatus = null,Object? progress = null,Object? canGoBack = null,Object? canGoForward = null,}) {
  return _then(_self.copyWith(
redirect: null == redirect ? _self.redirect : redirect // ignore: cast_nullable_to_non_nullable
as WebRedirectModel,initialLoadStatus: null == initialLoadStatus ? _self.initialLoadStatus : initialLoadStatus // ignore: cast_nullable_to_non_nullable
as InitialLoadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as WebRedirectProgressModel,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WebRedirectState].
extension WebRedirectStatePatterns on WebRedirectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WebRedirectState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WebRedirectState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WebRedirectState value)  $default,){
final _that = this;
switch (_that) {
case _WebRedirectState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WebRedirectState value)?  $default,){
final _that = this;
switch (_that) {
case _WebRedirectState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WebRedirectModel redirect,  InitialLoadStatus initialLoadStatus,  WebRedirectProgressModel progress,  bool canGoBack,  bool canGoForward)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WebRedirectState() when $default != null:
return $default(_that.redirect,_that.initialLoadStatus,_that.progress,_that.canGoBack,_that.canGoForward);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WebRedirectModel redirect,  InitialLoadStatus initialLoadStatus,  WebRedirectProgressModel progress,  bool canGoBack,  bool canGoForward)  $default,) {final _that = this;
switch (_that) {
case _WebRedirectState():
return $default(_that.redirect,_that.initialLoadStatus,_that.progress,_that.canGoBack,_that.canGoForward);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WebRedirectModel redirect,  InitialLoadStatus initialLoadStatus,  WebRedirectProgressModel progress,  bool canGoBack,  bool canGoForward)?  $default,) {final _that = this;
switch (_that) {
case _WebRedirectState() when $default != null:
return $default(_that.redirect,_that.initialLoadStatus,_that.progress,_that.canGoBack,_that.canGoForward);case _:
  return null;

}
}

}

/// @nodoc


class _WebRedirectState implements WebRedirectState {
  const _WebRedirectState({required this.redirect, this.initialLoadStatus = InitialLoadStatus.loading, this.progress = const WebRedirectProgressModel(), this.canGoBack = false, this.canGoForward = false});
  

@override final  WebRedirectModel redirect;
@override@JsonKey() final  InitialLoadStatus initialLoadStatus;
@override@JsonKey() final  WebRedirectProgressModel progress;
@override@JsonKey() final  bool canGoBack;
@override@JsonKey() final  bool canGoForward;

/// Create a copy of WebRedirectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebRedirectStateCopyWith<_WebRedirectState> get copyWith => __$WebRedirectStateCopyWithImpl<_WebRedirectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebRedirectState&&(identical(other.redirect, redirect) || other.redirect == redirect)&&(identical(other.initialLoadStatus, initialLoadStatus) || other.initialLoadStatus == initialLoadStatus)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward));
}


@override
int get hashCode => Object.hash(runtimeType,redirect,initialLoadStatus,progress,canGoBack,canGoForward);

@override
String toString() {
  return 'WebRedirectState(redirect: $redirect, initialLoadStatus: $initialLoadStatus, progress: $progress, canGoBack: $canGoBack, canGoForward: $canGoForward)';
}


}

/// @nodoc
abstract mixin class _$WebRedirectStateCopyWith<$Res> implements $WebRedirectStateCopyWith<$Res> {
  factory _$WebRedirectStateCopyWith(_WebRedirectState value, $Res Function(_WebRedirectState) _then) = __$WebRedirectStateCopyWithImpl;
@override @useResult
$Res call({
 WebRedirectModel redirect, InitialLoadStatus initialLoadStatus, WebRedirectProgressModel progress, bool canGoBack, bool canGoForward
});




}
/// @nodoc
class __$WebRedirectStateCopyWithImpl<$Res>
    implements _$WebRedirectStateCopyWith<$Res> {
  __$WebRedirectStateCopyWithImpl(this._self, this._then);

  final _WebRedirectState _self;
  final $Res Function(_WebRedirectState) _then;

/// Create a copy of WebRedirectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? redirect = null,Object? initialLoadStatus = null,Object? progress = null,Object? canGoBack = null,Object? canGoForward = null,}) {
  return _then(_WebRedirectState(
redirect: null == redirect ? _self.redirect : redirect // ignore: cast_nullable_to_non_nullable
as WebRedirectModel,initialLoadStatus: null == initialLoadStatus ? _self.initialLoadStatus : initialLoadStatus // ignore: cast_nullable_to_non_nullable
as InitialLoadStatus,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as WebRedirectProgressModel,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
