import 'package:flutter/material.dart';
import '../../models/user.dart'; // Make sure to adjust the path according to your project structure

class UserDetailsScreen extends StatelessWidget {
  final User user;

  UserDetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Avatar
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Text(
                  user.username[0].toUpperCase(),
                  style: TextStyle(fontSize: 40),
                ),
                backgroundColor: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 24),

            // User Information
            buildUserDetailItem('Username', user.username),
            Divider(),
            buildUserDetailItem('Email', user.email),
            Divider(),
            buildUserDetailItem('Job Role', user.jobRole),
            Divider(),
            buildUserDetailItem('Password Hash', user.passwordHash), // For display only
          ],
        ),
      ),
    );
  }

  // Helper method to build the user detail widgets
  Widget buildUserDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 18),
              overflow: TextOverflow.ellipsis, // Prevent text overflow
            ),
          ),
        ],
      ),
    );
  }
}
