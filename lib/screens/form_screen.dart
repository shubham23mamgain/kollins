import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kollins/widgets/custom_text_field.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  XFile? imageXFile;

  final ImagePicker picker = ImagePicker();

  Future<void> getImage() async {
    imageXFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      imageXFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              getImage();
            },
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.20,
              backgroundColor: Colors.white,
              backgroundImage: imageXFile == null
                  ? null
                  : FileImage(
                      File(imageXFile!.path),
                    ),
              child: imageXFile == null
                  ? Icon(
                      Icons.add_photo_alternate,
                      size: MediaQuery.of(context).size.width * 0.20,
                      color: Colors.grey,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: fnameController,
                  data: Icons.person,
                  hintText: 'First Name',
                  keyboard: TextInputType.name,
                  isObscure: false,
                ),
                CustomTextField(
                  controller: lnameController,
                  data: Icons.person,
                  hintText: 'Last Name',
                  keyboard: TextInputType.name,
                  isObscure: false,
                ),
                CustomTextField(
                  controller: ageController,
                  data: Icons.calendar_month_outlined,
                  hintText: 'Age',
                  keyboard: TextInputType.number,
                  isObscure: false,
                ),
                const SizedBox(height: 30),
                Container(
                  width: 600,
                  height: 100,
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.recycling_rounded,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Submit Data',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
