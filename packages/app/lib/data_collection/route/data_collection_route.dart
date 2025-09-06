import 'package:app/app_router/app_router.dart';
import 'package:app/app_shell/app_shell.dart';
import 'package:app/data_collection/data_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DataCollectionRoute extends GoRouteData
    with $DataCollectionRoute, EquatableMixin {
  const DataCollectionRoute();

  static final $parentNavigatorKey = AppRouter.navigatorKey;

  static const config = TypedGoRoute<DataCollectionRoute>(
    path: 'data-collection',
  );

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const DataCollectionPage();
  }

  @override
  List<Object> get props => [];
}
