import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxtrip/halaman/hal_login.dart'; // Import HalLogin page

class HalUtama extends StatelessWidget {
  const HalUtama({Key? key}) : super(key: key);

  void signOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // After signing out, navigate back to the login screen (HalLogin)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HalLogin(), // Navigate to HalLogin
        ),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => signOutUser(context),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user?.displayName ?? 'Guest'),
              accountEmail: Text(user?.email ?? 'guest@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  user?.email?.substring(0, 1).toUpperCase() ?? 'G',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle Home navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle Settings navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Handle About navigation
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => signOutUser(context),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user != null ? 'Welcome, ${user.email}' : 'User not logged in',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Dashboard',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 2),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
                  Card(
                    child: InkWell(
                      onTap: () {
                        // Handle feature 1 navigation
                      },
                      child: Center(
                        child: Text('Feature 1'),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        // Handle feature 2 navigation
                      },
                      child: Center(
                        child: Text('Feature 2'),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        // Handle feature 3 navigation
                      },
                      child: Center(
                        child: Text('Feature 3'),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      onTap: () {
                        // Handle feature 4 navigation
                      },
                      child: Center(
                        child: Text('Feature 4'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
