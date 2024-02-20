// signup_screen.dart
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        backgroundColor: Colors.green, // Set the app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTextField(
          controller: _firstNameController,
          labelText: 'First Name',
          icon: Icons.person,
          fillColor: Colors.white, // Set text field background color
        ),
        SizedBox(height: 16.0),
        _buildTextField(
          controller: _lastNameController,
          labelText: 'Last Name',
          icon: Icons.person,
          fillColor: Colors.white,
        ),
        SizedBox(height: 16.0),
        _buildTextField(
          controller: _phoneNumberController,
          labelText: 'Phone Number',
          icon: Icons.phone,
          fillColor: Colors.white,
        ),
        SizedBox(height: 16.0),
        _buildTextField(
          controller: _emailController,
          labelText: 'Email',
          icon: Icons.email,
          fillColor: Colors.white,
        ),
        SizedBox(height: 16.0),
        _buildTextField(
          controller: _passwordController,
          labelText: 'Password',
          icon: Icons.lock,
          obscureText: true,
          fillColor: Colors.white,
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            // Add your signup logic here
            // For simplicity, we'll just print the data
            print('First Name: ${_firstNameController.text}');
            print('Last Name: ${_lastNameController.text}');
            print('Phone Number: ${_phoneNumberController.text}');
            print('Email: ${_emailController.text}');
            print('Password: ${_passwordController.text}');
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green, // Set button background color
          ),
          child: Text('Sign Up'),
        ),
        SizedBox(height: 16.0),
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
          style: TextButton.styleFrom(
            primary: Colors.green, // Set text button color
          ),
          child: Text('Already have an account? Sign In'),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    required Color fillColor,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(fontSize: 16.0),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        fillColor: fillColor,
        filled: true,
      ),
    );
  }
}
