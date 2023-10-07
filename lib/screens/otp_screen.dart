import 'package:flutter/material.dart';
import 'package:kollins/screens/auth_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController mobileController = TextEditingController();
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _otpChanged(int index) {
  if (index < otpControllers.length - 1 && otpControllers[index].text.isNotEmpty) {
    FocusScope.of(context).requestFocus(focusNodes[index + 1]);
  }
}

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
            'Enter Your OTP',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.blue),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Form(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Container(
                  width: 50,
                  margin: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: otpControllers[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    // maxLength: 1,
                    focusNode: focusNodes[index],
                    onChanged: (value) {
                      _otpChanged(index);
                    },
                
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter OTP';
                      }
                      return null;
                    },
                  
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ElevatedButton(
            onPressed: () {
              // db line
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => const AuthScreen()));
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
              'Confirm',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
