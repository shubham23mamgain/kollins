import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DocumentScreen extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final String? age;
  final XFile? imageXFile;

  const DocumentScreen({
    // super.key,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.imageXFile,
  });

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: 
           Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                borderRadius: BorderRadius.circular(16), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // CircleAvatar(
                  //   radius: MediaQuery.of(context).size.width * 0.10,
                  //   backgroundImage: FileImage(File(widget.imageXFile!.path)),
                  // ),
                  SizedBox(height: 10),
                  Text(
                    'First Name: ${widget.firstName}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,  color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Last Name: ${widget.lastName}',
                    style: TextStyle(fontSize: 14,  color: Colors.black),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Age: ${widget.age}',
                    style: TextStyle(fontSize: 16,  color: Colors.black),
                  ),
                ],
              ),
            )
          
    );
  }
}
