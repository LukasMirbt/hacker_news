// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_router_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppRouterState {

 GoRouter get goRouter; List<String> get history;
/// Create a copy of AppRouterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppRouterStateCopyWith<AppRouterState> get copyWith => _$AppRouterStateCopyWithImpl<AppRouterState>(this as AppRouterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppRouterState&&(identical(other.goRouter, goRouter) || other.goRouter == goRouter)&&const DeepCollectionEquality().equals(other.history, history));
}


@override
int get hashCode => Object.hash(runtimeType,goRouter,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'AppRouterState(goRouter: $goRouter, history: $history)';
}


}

/// @nodoc
abstract mixin class $AppRouterStateCopyWith<$Res>  {
  factory $AppRouterStateCopyWith(AppRouterState value, $Res Function(AppRouterState) _then) = _$AppRouterStateCopyWithImpl;
@useResult
$Res call({
 GoRouter goRouter, List<String> history
});




}
/// @nodoc
class _$AppRouterStateCopyWithImpl<$Res>
    implements $AppRouterStateCopyWith<$Res> {
  _$AppRouterStateCopyWithImpl(this._self, this._then);

  final AppRouterState _self;
  final $Res Function(AppRouterState) _then;

/// Create a copy of AppRouterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? goRouter = null,Object? history = null,}) {
  return _then(_self.copyWith(
goRouter: null == goRouter ? _self.goRouter : goRouter // ignore: cast_nullable_to_non_nullable
as GoRouter,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc


class _AppRouterState extends AppRouterState {
  const _AppRouterState({required this.goRouter, final  List<String> history = const []}): _history = history,super._();
  

@override final  GoRouter goRouter;
 final  List<String> _history;
@override@JsonKey() List<String> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}


/// Create a copy of AppRouterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppRouterStateCopyWith<_AppRouterState> get copyWith => __$AppRouterStateCopyWithImpl<_AppRouterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppRouterState&&(identical(other.goRouter, goRouter) || other.goRouter == goRouter)&&const DeepCollectionEquality().equals(other._history, _history));
}


@override
int get hashCode => Object.hash(runtimeType,goRouter,const DeepCollectionEquality().hash(_history));

@override
String toString() {
  return 'AppRouterState(goRouter: $goRouter, history: $history)';
}


}

/// @nodoc
abstract mixin class _$AppRouterStateCopyWith<$Res> implements $AppRouterStateCopyWith<$Res> {
  factory _$AppRouterStateCopyWith(_AppRouterState value, $Res Function(_AppRouterState) _then) = __$AppRouterStateCopyWithImpl;
@override @useResult
$Res call({
 GoRouter goRouter, List<String> history
});




}
/// @nodoc
class __$AppRouterStateCopyWithImpl<$Res>
    implements _$AppRouterStateCopyWith<$Res> {
  __$AppRouterStateCopyWithImpl(this._self, this._then);

  final _AppRouterState _self;
  final $Res Function(_AppRouterState) _then;

/// Create a copy of AppRouterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? goRouter = null,Object? history = null,}) {
  return _then(_AppRouterState(
goRouter: null == goRouter ? _self.goRouter : goRouter // ignore: cast_nullable_to_non_nullable
as GoRouter,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
