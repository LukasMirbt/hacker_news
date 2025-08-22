import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class ThemeEvent {
  const ThemeEvent();
}

final class ThemeOptionPressed extends ThemeEvent with EquatableMixin {
  const ThemeOptionPressed(this.mode);

  final ThemeMode mode;

  @override
  List<Object> get props => [mode];
}
