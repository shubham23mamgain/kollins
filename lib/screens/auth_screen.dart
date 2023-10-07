import 'package:flutter/material.dart';
import 'package:kollins/screens/document_screen.dart';
import 'package:kollins/screens/form_screen.dart';
import 'package:image_picker/image_picker.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<AuthScreen> {
  final String? firstName;
  final String? lastName;
  final String? age;
  final XFile? imageXFile;

  _RegisterScreenState({this.firstName, this.lastName, this.age, this.imageXFile});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan,
                  Colors.amber,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          title: const Text(
            'Kollins',
            style: TextStyle(
              fontSize: 60,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person, color: Colors.white),
                text: 'Register',
              ),
              Tab(
                icon: Icon(Icons.document_scanner, color: Colors.white),
                text: 'Documents',
              ),
            ],
            indicatorColor: Colors.pinkAccent,
            indicatorWeight: 6,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber,
                Colors.cyan,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: const TabBarView(
            children: [
              FormScreen(),
               DocumentScreen(
                firstName:  'John',
                lastName: 'Deo',
                age: '23',
                imageXFile: null,
              ),            
            ],
          ),
        ),
      ),
    );
  }
}
