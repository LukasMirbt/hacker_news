import 'package:flutter/material.dart';

class AppPostHeaderData {
  const AppPostHeaderData({
    required this.hasBeenVisited,
    required this.title,
    required this.age,
    required this.urlHost,
    required this.user,
    required this.htmlText,
    required this.onPressed,
    required this.onTextLinkPressed,
    required this.onSharePressed,
    required this.voteButton,
    required this.commentButton,
  });

  final bool hasBeenVisited;
  final String title;
  final String age;
  final String? urlHost;
  final String? user;
  final String? htmlText;
  final void Function() onPressed;
  final void Function(String) onTextLinkPressed;
  final void Function() onSharePressed;
  final Widget? voteButton;
  final Widget? commentButton;

  Color titleColor(ColorScheme colorScheme) {
    if (hasBeenVisited) return colorScheme.onSurfaceVariant;
    return colorScheme.onSurface;
  }
}
