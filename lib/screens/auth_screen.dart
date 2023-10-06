import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.cyan, Colors.amber])),
          ),
          title: Text(
            'Kollins',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }
}
