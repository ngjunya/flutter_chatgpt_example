import 'package:example/modules/chat/ui/chat_body.dart';
import 'package:flutter/material.dart';

import 'core/injection/injection_container.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
