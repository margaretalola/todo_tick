import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

Color getCategoryColor(String? category) {
  final Random random = Random();
  switch(category) {
    case 'Exam':
      return const Color.fromARGB(255, 255, 165, 0);
    case 'Classes':
      return const Color.fromARGB(255, 0, 128, 255);
    case 'Personal':
      return const Color.fromARGB(255, 128, 1, 203);
    case 'Homeworks':
      return const Color.fromARGB(255, 10, 150, 128);
    case 'Other':
      return const Color.fromARGB(200, 50, 200, 100);
    default:
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
  }
}