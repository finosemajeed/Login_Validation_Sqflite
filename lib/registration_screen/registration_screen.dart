import 'package:fitness_appliction/db/db.dart';
import 'package:flutter/material.dart';

class RegestrationScreen extends StatelessWidget {
  RegestrationScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    bool viewPassword = true;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(children: [
              const SizedBox(height: 150),
              const Text(
                'Please signup your account,',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'username@example.com',
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _usernameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'username@example.com',
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                ),
                validator: (text) {
                  if (text!.isEmpty || !(text.contains('@'))) {
                    return "Please check your user name and password!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                textInputAction: TextInputAction.done,
                obscuringCharacter: '*',
                obscureText: viewPassword,
                decoration: InputDecoration(
                    suffixIconColor: Colors.black,
                    suffixIcon: IconButton(
                        onPressed: () {
                          // setState(() {
                          //   if (viewPassword) {
                          //     viewPassword = false;
                          //   } else {
                          //     viewPassword = true;
                          //   }
                          // });
                        },
                        icon: Icon(viewPassword == true
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    hintText: '**********',
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    labelText: 'Password',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    )),
                validator: (text) {
                  if (text!.isEmpty || text.length < 6) {
                    return 'Please check your user name and password!';
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  final isValid = formkey.currentState!.validate();
                  if (isValid) {
                    registerUser();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  fixedSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                // ButtonStyle(
                //     minimumSize: MaterialStateProperty.all(const Size(250, 40)),
                //     backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text(
                  'Sign-up',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    await SqlHelper.userRegistration(_nameController.text,
        _usernameController.text, _passwordController.text);
  }
}
