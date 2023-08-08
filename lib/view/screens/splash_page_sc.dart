import 'package:e_commerce_app/view/homepage_sc.dart';
import 'package:flutter/material.dart';
import '../utils/constant_color.dart';

class SplashPageSc extends StatefulWidget {
  const SplashPageSc({Key? key}) : super(key: key);

  @override
  State<SplashPageSc> createState() => _SplashPageScState();
}

class _SplashPageScState extends State<SplashPageSc> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomepageSc(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: kIconColor,
          ),
        ),
      ),
    );
  }
}
