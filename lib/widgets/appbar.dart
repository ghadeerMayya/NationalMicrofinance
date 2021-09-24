import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      AppBar(
        title: Text('test'),
      )
      // Container(
      //     height: 200,
      //     padding: const EdgeInsets.symmetric(horizontal: 15),
      //     decoration: const BoxDecoration(
      //       image: DecorationImage(
      //         image: AssetImage("lib/img/alwataniya_logo.png"),
      //         fit: BoxFit.contain,
      //       ),
      //     ),
      //     child: null)
    ;
  }
}
