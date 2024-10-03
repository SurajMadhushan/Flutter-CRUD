import 'package:flutter/material.dart';
import '../../services/user_service.dart';
import '../../models/user.dart';
import './homeScreen.dart';

class SignInPage extends StatefulWidget {
  _SignInPageState createState() => _SignInPageState();
}

        
class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _selectedJobRole;

  // Job roles for the dropdown list
  final List<String> _jobRoles = ['Developer', 'Engineer', 'Manager'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username field
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // email field
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Password Hash field (as normal password field)
            TextFormField(
              controller: _passwordController,
              obscureText: true, // To hide the password input
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Job Role Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Job Role',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              value: _selectedJobRole,
              items: _jobRoles.map((String jobRole) {
                return DropdownMenuItem<String>(
                  value: jobRole,
                  child: Text(jobRole),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedJobRole = newValue;
                });
              },
            ),
            SizedBox(height: 16),

            // Sign In Button
            ElevatedButton(
              onPressed: () async {
                final UserService _userService = UserService();
                // Handle sign in action
                print('Username: ${_usernameController.text}');
                print('Password Hash: ${_passwordController.text}');
                print('Selected Job Role: $_selectedJobRole');

                User newUser = User(
                    username: _usernameController.text,
                    passwordHash: _passwordController.text,
                    email: _emailController.text,
                    jobRole: _selectedJobRole ?? 'None');

                bool success = await _userService.addUser(newUser);

                if(success){
                  // Show success message or navigate to another screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User added successfully')),
                  );
                  Navigator.pop(context);

                } else {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to add user')),
                  );
                }
              },
              child: Text('Sign In'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Full width button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
