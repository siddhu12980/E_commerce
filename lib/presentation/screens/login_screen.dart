import 'package:e_com/auth/auth_methods.dart';
import 'package:e_com/presentation/screens/home.dart';
import 'package:e_com/presentation/screens/signup_screen.dart';
import 'package:e_com/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  showSnackbar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _loginuser() async {
    setState(() {
      _isloading = true;
    });

    String res = await AuthMethods().loginuser(
        email: _emailController.text, password: _passwordController.text);

    if (res == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      showSnackbar(res, context);
    }

    setState(() {
      _isloading = false;
    });
  }

  void _navigatetosignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignupScreen(),
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
                flex: 2,
                child: Container(),
              ),

              const SizedBox(
                height: 40,
              ),

              const SizedBox(height: 60),

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
                onTap: () => _loginuser(),
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
                flex: 2,
                child: Container(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Dont have account"),
                  ),
                  TextButton(
                      onPressed: _navigatetosignup,
                      child: const Text("Create New Accound"))
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
