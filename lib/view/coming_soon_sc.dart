import 'package:flutter/material.dart';

class ComingSoonSc extends StatelessWidget {
  const ComingSoonSc({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Coming Soon!',style: TextStyle(fontSize: 18.0),),
        ),
      ),
    );
  }
}
