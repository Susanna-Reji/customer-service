import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  final descriptionController = TextEditingController();

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Future<void> signUpUser(BuildContext context) async {
    final String customer_name = nameController.text;
    final String email = emailController.text;
    final String contact = contactController.text;
    final String uname = usernameController.text;
    final String pass = passwordController.text;
    final String gender = genderController.text;
    final String description = descriptionController.text;

    // Additional validation can be done here if needed

    // Check if any of the fields are empty
    if ([customer_name, email, contact, uname, pass, gender, description].any((value) => value.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    // Proceed with sign-up logic
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.31:3000/api/signup'),
        body: jsonEncode({
          'customer_name': customer_name,
          'email': email,
          'contact': contact,
          'uname': uname,
          'pass': pass,
          'gender': gender,
          'description': description,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Handle response as before...
    } catch (e) {
      // Handle error as before...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 171, 171),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Icon(Icons.person_add, size: 100),
                SizedBox(height: 40),
                Text(
                  'Sign Up',
                  style: TextStyle(color: Color.fromARGB(255, 9, 9, 9), fontSize: 30),
                ),
                SizedBox(height: 25),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      MyTextField(controller: nameController, hintText: 'Name', obscureText: false, validator: validateField),
                      SizedBox(height: 10),
                      MyTextField(controller: emailController, hintText: 'Email', obscureText: false, validator: validateField),
                      SizedBox(height: 10),
                      MyTextField(controller: contactController, hintText: 'Contact', obscureText: false, validator: validateField),
                      SizedBox(height: 10),
                      MyTextField(controller: usernameController, hintText: 'Username', obscureText: false, validator: validateField),
                      SizedBox(height: 10),
                      MyTextField(controller: passwordController, hintText: 'Password', obscureText: true, validator: validateField),
                      SizedBox(height: 10),
                      MyTextField(controller: genderController, hintText: 'Gender', obscureText: false, validator: validateField),
                      SizedBox(height: 10),
                      MyTextField(controller: descriptionController, hintText: 'Description', obscureText: false, validator: validateField),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: MyButton(onTap: () => signUpUser(context)), // Pass BuildContext
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the login page
                  },
                  child: Text('Already Registered? Login'),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
