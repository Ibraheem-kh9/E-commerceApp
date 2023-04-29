import 'package:flutter/material.dart';

class SettingSc extends StatelessWidget {
  const SettingSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Settign Screen'),
        ),
      ),
    );
  }
}
