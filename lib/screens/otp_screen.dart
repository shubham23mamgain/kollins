import 'package:flutter/material.dart';
import 'package:kollins/screens/dashboard_screen.dart';
import 'package:kollins/widgets/custom_text_field.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            'assets/images/b3.jpg',
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          const Text(
            'Welcome User',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.blue),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Form(
            key: _formKey,
            child: CustomTextField(
              controller: mobileController,
              hintText: 'OTP',
              isObscure: false,
              // keyboard: TextInputType.number,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ElevatedButton(
            onPressed: () {
              // db line
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const DashboardScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              foregroundColor: Colors.amber,
            ),
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.black),
            ),
          )
        ]),
      ),
    );
  }
}
