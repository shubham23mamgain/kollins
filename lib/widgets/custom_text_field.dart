import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? data;
  bool? isObscure = true;
  final String? hintText;
  final TextInputType? keyboard;

  CustomTextField({
    super.key,
    this.controller,
    this.data,
    this.hintText,
    this.isObscure,
    this.keyboard,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        scrollPadding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        controller: controller,
        obscureText: isObscure!,
        keyboardType: keyboard,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
           focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 3.0),
            ),
          
          // border: UnderlineInputBorder(),
          // border: InputBorder.none,
          prefixIcon: Icon(
            data,
            // size: 40,
            color: Colors.blue.shade700,
          ),
          hintText: hintText,
          focusColor: Theme.of(context).secondaryHeaderColor,
        ),
      ),
    );
  }
}
