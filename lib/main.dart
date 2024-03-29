import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rentomatic_app/splashScreen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MyApp(
      child: MaterialApp(
        title: 'Rentomatic',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: MySplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Widget? child;

  // ignore: use_key_in_widget_constructors
  const MyApp({this.child});
  static void restartApp(BuildContext context) {
    // ignore: invalid_use_of_protected_member
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}
