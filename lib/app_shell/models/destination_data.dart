import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DestinationData extends Equatable {
  const DestinationData({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  List<Object> get props => [
    icon,
    label,
  ];
}
