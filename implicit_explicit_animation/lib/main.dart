import 'package:flutter/material.dart';

import 'explicit_animation_with_animated_builder.dart';
import 'explicit_ready_to_use_widget_animation.dart';
import 'implicit_tween_animation.dart';
import 'implicit_widget_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimatedBuilderExample(),
    );
  }
}
