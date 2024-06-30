import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maxtrip/halaman/authpage.dart';
import 'package:maxtrip/screens/rencana_screen.dart';

class DashboardProfile extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser;
    final userName = user?.displayName ?? '';
    final userEmail = user?.email ?? '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 138, 204),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              _showLogoutConfirmationDialog(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 16, 138, 204),
                    Color.fromARGB(255, 52, 168, 235),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("lib/images/profil.png"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    userEmail,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RencanaScreen()), // Ganti dengan ProfileScreen
                      );
                    },
                    child: Text("Lihat Rencana Anda"),
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(200, 40), // Set the width and height here
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You're our Bronze Priority",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey),
                  Text(
                    "My Payment Options",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text("PayLater"),
                      subtitle: Text("Promos for new users are waiting!"),
                      onTap: () {},
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.account_balance_wallet),
                      title: Text("travelokaPay"),
                      subtitle: Text("UANGKU Balance"),
                      onTap: () {},
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.account_balance),
                      title: Text("UANGKU Balance"),
                      subtitle: Text(
                          "Activate now to enjoy quick and easy payments 24/7"),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "My Rewards",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.card_giftcard),
                      title: Text("0 Points"),
                      subtitle: Text(
                          "Trade points for coupons and learn how to earn more!"),
                      onTap: () {},
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.redeem),
                      title: Text("Reward Zone"),
                      onTap: () {},
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

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout Confirmation"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                _logout(context);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthPage()),
    );
  }
}
