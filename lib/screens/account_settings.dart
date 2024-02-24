import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green[600],
        title: Text('Account Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Edit Profile'),
              leading: Icon(Icons.person),
              onTap: () {
                // Navigate to edit profile screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('Change Password'),
              leading: Icon(Icons.lock),
              onTap: () {
                // Navigate to change password screen
              },
            ),
            Divider(),
            SizedBox(height: 24),
            Text(
              'Preferences',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text('Dark Mode'),
              leading: Icon(Icons.brightness_4),
              trailing: Switch(
                value: false, // Replace with actual value from preferences
                onChanged: (value) {
                  // Update dark mode preference
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Language'),
              leading: Icon(Icons.language),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to language selection screen
              },
            ),
            Divider(),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.info),
              onTap: () {
                // Perform logout action
              },
            ),
          ],
        ),
      ),
    );
  }
}
