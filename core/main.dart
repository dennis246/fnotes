import 'package:flutter/material.dart';
import 'package:overlaytest/AppViewRegistry.dart';
import 'package:overlaytest/CenterView.dart';

import 'AppViewRouter.dart';

void main() {

  AppViewRouter.registerToAppViewRegistry();
  runApp(const CenterView());
}

