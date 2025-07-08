// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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

 WebRedirectModel get redirect; InitialLoadStatus get initialLoadStatus; bool get canGoBack; bool get canGoForward; int get progress;
/// Create a copy of WebRedirectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebRedirectStateCopyWith<WebRedirectState> get copyWith => _$WebRedirectStateCopyWithImpl<WebRedirectState>(this as WebRedirectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebRedirectState&&(identical(other.redirect, redirect) || other.redirect == redirect)&&(identical(other.initialLoadStatus, initialLoadStatus) || other.initialLoadStatus == initialLoadStatus)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,redirect,initialLoadStatus,canGoBack,canGoForward,progress);

@override
String toString() {
  return 'WebRedirectState(redirect: $redirect, initialLoadStatus: $initialLoadStatus, canGoBack: $canGoBack, canGoForward: $canGoForward, progress: $progress)';
}


}

/// @nodoc
abstract mixin class $WebRedirectStateCopyWith<$Res>  {
  factory $WebRedirectStateCopyWith(WebRedirectState value, $Res Function(WebRedirectState) _then) = _$WebRedirectStateCopyWithImpl;
@useResult
$Res call({
 WebRedirectModel redirect, InitialLoadStatus initialLoadStatus, bool canGoBack, bool canGoForward, int progress
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
@pragma('vm:prefer-inline') @override $Res call({Object? redirect = null,Object? initialLoadStatus = null,Object? canGoBack = null,Object? canGoForward = null,Object? progress = null,}) {
  return _then(_self.copyWith(
redirect: null == redirect ? _self.redirect : redirect // ignore: cast_nullable_to_non_nullable
as WebRedirectModel,initialLoadStatus: null == initialLoadStatus ? _self.initialLoadStatus : initialLoadStatus // ignore: cast_nullable_to_non_nullable
as InitialLoadStatus,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _WebRedirectState extends WebRedirectState {
  const _WebRedirectState({required this.redirect, this.initialLoadStatus = InitialLoadStatus.loading, this.canGoBack = false, this.canGoForward = false, this.progress = 0}): super._();
  

@override final  WebRedirectModel redirect;
@override@JsonKey() final  InitialLoadStatus initialLoadStatus;
@override@JsonKey() final  bool canGoBack;
@override@JsonKey() final  bool canGoForward;
@override@JsonKey() final  int progress;

/// Create a copy of WebRedirectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebRedirectStateCopyWith<_WebRedirectState> get copyWith => __$WebRedirectStateCopyWithImpl<_WebRedirectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebRedirectState&&(identical(other.redirect, redirect) || other.redirect == redirect)&&(identical(other.initialLoadStatus, initialLoadStatus) || other.initialLoadStatus == initialLoadStatus)&&(identical(other.canGoBack, canGoBack) || other.canGoBack == canGoBack)&&(identical(other.canGoForward, canGoForward) || other.canGoForward == canGoForward)&&(identical(other.progress, progress) || other.progress == progress));
}


@override
int get hashCode => Object.hash(runtimeType,redirect,initialLoadStatus,canGoBack,canGoForward,progress);

@override
String toString() {
  return 'WebRedirectState(redirect: $redirect, initialLoadStatus: $initialLoadStatus, canGoBack: $canGoBack, canGoForward: $canGoForward, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$WebRedirectStateCopyWith<$Res> implements $WebRedirectStateCopyWith<$Res> {
  factory _$WebRedirectStateCopyWith(_WebRedirectState value, $Res Function(_WebRedirectState) _then) = __$WebRedirectStateCopyWithImpl;
@override @useResult
$Res call({
 WebRedirectModel redirect, InitialLoadStatus initialLoadStatus, bool canGoBack, bool canGoForward, int progress
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
@override @pragma('vm:prefer-inline') $Res call({Object? redirect = null,Object? initialLoadStatus = null,Object? canGoBack = null,Object? canGoForward = null,Object? progress = null,}) {
  return _then(_WebRedirectState(
redirect: null == redirect ? _self.redirect : redirect // ignore: cast_nullable_to_non_nullable
as WebRedirectModel,initialLoadStatus: null == initialLoadStatus ? _self.initialLoadStatus : initialLoadStatus // ignore: cast_nullable_to_non_nullable
as InitialLoadStatus,canGoBack: null == canGoBack ? _self.canGoBack : canGoBack // ignore: cast_nullable_to_non_nullable
as bool,canGoForward: null == canGoForward ? _self.canGoForward : canGoForward // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
