import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _SignUpState();
}

class _SignUpState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const Text(
                'Forget Password?',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'SFUIDisplay'),
              ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFields(
                    icon: const Icon(Icons.email_outlined),
                    label: 'EMAIL',
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                          onPressed: () {},
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('RESET',style: TextStyle(fontFamily: 'SFUIDisplay')),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 24.0,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          )),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'already have an account',
              style: TextStyle(
                  fontFamily: "SFUIDisplay", color: Colors.black, fontSize: 15),
            ),
            const SizedBox(
              width: 5,
            ),
            TextButton(
                onPressed: () =>() {

                }

                // } Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => SignIn(),
                // )),
               , child: const Text(
                  'Sign In',
                  style: TextStyle(
                      fontFamily: 'SFUIDisplay',
                      color: Colors.green,
                      fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  final Icon icon;
  final String label;
  final TextEditingController controller;
  final bool secureText;

  const TextFields(
      {super.key,
        required this.icon,
        required this.label,
        required this.controller,
        this.secureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: secureText,
        style: const TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
            prefixIcon: icon,
            labelStyle: const TextStyle(fontSize: 12)),
      ),
    );
  }
}
