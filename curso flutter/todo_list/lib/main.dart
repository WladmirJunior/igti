import 'dart:io';

import 'package:flutter/material.dart';
import 'apps/app_ios.dart' as ios;
import 'apps/app_android.dart' as android;

void main() {
  if (Platform.isAndroid) {
    runApp(const ios.MyApp());
  } else {
    runApp(const android.MyApp());
  }
}
