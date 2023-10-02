import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();


  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CargoLinker"),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7)
                    ),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email';
                    }
                    else if (!EmailValidator.validate(value.trim())) {
                    return "Invalid email address";
                  }
                    return null;
                  },
                ),

                SizedBox(height: 16.0,),

                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7)
                  ),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                
                
                SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      
                      }
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(width: 12,),
                    TextButton(onPressed: (){},
                    child: 
                    Text("Signup"))
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
