import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final form = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String errorMessage = "";

  void login() {
    final isValid = form.currentState?.validate();
    if (isValid == false) return;
    if (email == "okoc@gmail.com" && password == "okoc") {
        print('fired..');
        Navigator.pushReplacementNamed(context, '/home');
    }
  }

//Muhammad fadli Hidayatullah 20104088
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page'), centerTitle: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64, bottom: 60),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset("asset/logo_flutter.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                    ),
                    onChanged: (value) => setState(() {
                      email = value;
                    }),
                    validator: (value) => value?.isEmpty == true ? 'Email tidak boleh kosong' : null,
                  ),
                ),
                //Muhammad Fadli Hidayatullah 20104088
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Password",
                    ),
                    onChanged: (value) => setState(() {
                      password = value;
                    }),
                    validator: (value) => value?.isEmpty == true ? 'Password tidak boleh kosong' : null,
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => login(),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                      ),
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
//Muhammad Fadli Hidayatullah 20104088