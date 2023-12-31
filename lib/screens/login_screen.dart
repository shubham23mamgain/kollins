import 'package:flutter/material.dart';
import 'package:kollins/screens/otp_screen.dart';
import 'package:kollins/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            'assets/images/b2.jpg',
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          const Text(
            'Enter Your Mobile Number',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.blue),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Form(
            key: _formKey,
            child: CustomTextField(
              controller: mobileController,
              data: Icons.phone,
              hintText: 'Mobile Number',
              isObscure: false,
              keyboard: TextInputType.phone,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ElevatedButton(
            onPressed: () {
              // db line
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const OTPScreen()));
            },
            // style: ElevatedButton.styleFrom(
            //   backgroundColor: Colors.cyan,
            //   foregroundColor: Colors.amber,
            // ),
            style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
            child: const Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,),
            ),
          )
        ]),
      ),
    );
  }
  
}
