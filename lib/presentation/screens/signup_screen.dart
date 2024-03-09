import 'package:e_com/auth/auth_methods.dart';
import 'package:e_com/presentation/screens/home.dart';
import 'package:e_com/presentation/screens/login_screen.dart';
import 'package:e_com/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

// ignore: camel_case_types
class _SignupScreenState extends State<SignupScreen> {
  showSnackbar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  bool _isloading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernamecontroller.dispose();
  }

  void _nagivatetologin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  Future<String> _signupuser() async {
    setState(() {
      _isloading = true;
    });
    String res = await AuthMethods().signupuser(
      email: _emailController.text,
      username: _usernamecontroller.text,
      password: _passwordController.text,
    );
    // ignore: avoid_print
    return (res);
  }

  void _redirect() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MyHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),

              const SizedBox(
                height: 40,
              ),

              Stack(
                children: [
                  const CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () => {print("image Clicked")},
                        icon: const Icon(Icons.add_a_photo),
                      ))
                ],
              ),

              const SizedBox(height: 60),
              TextFieldInput(
                  textEditingController: _usernamecontroller,
                  hinttext: "Enter your username",
                  textInputType: TextInputType.text),

              const SizedBox(height: 25),

              TextFieldInput(
                  textEditingController: _emailController,
                  hinttext: "Enter your email",
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 25),

              TextFieldInput(
                textEditingController: _passwordController,
                hinttext: "Enter your password",
                textInputType: TextInputType.text,
                isPass: true,
              ),

              const SizedBox(height: 25),

              InkWell(
                onTap: () async {
                  String res = await _signupuser();
                  print('this is res from signup user :$res');

                  final current = context;

                  if (res != "sucess") {
                    print('if res is not sucess then $res');

                    showSnackbar(res, current);
                  } else {
                    _redirect();
                  }
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    color: Colors.blue,
                  ),
                  child: _isloading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text("login"),
                ),
              ),
              const SizedBox(
                height: 14,
              ),

              Flexible(
                flex: 1,
                child: Container(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Already,Have an account?"),
                  ),
                  GestureDetector(
                    // ignore: avoid_print
                    onTap: () => _nagivatetologin(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        " Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )

              //login and signup
            ],
          ),
        ),
      ),
    );
  }
}
