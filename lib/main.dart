import 'package:flutter/material.dart';

void main() => runApp(const LogoApp());

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      });
      controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LogoAnimation(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
}

class LogoAnimation extends AnimatedWidget {
  const LogoAnimation({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: animation.value,
        height: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}