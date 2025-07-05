import 'package:flutter/material.dart';

enum ViewAction { unbound, open, close, expand, collapse, pan, shift, duplicate}

class AppViewRegistry {
  final String key;
  final Widget? value;
  final String renderedYN;
  final ViewAction action;

  const AppViewRegistry({required this.key, required this.value, required this.renderedYN, required this.action});
}