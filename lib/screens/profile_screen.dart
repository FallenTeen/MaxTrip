import 'package:flutter/material.dart';
import 'package:maxtrip/halaman/authpage.dart';

class DashboardProfile extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 16, 138, 204),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.settings),
            onSelected: (String result) {
              if (result == 'logout') {
                _logout(context);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
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
                    backgroundImage:
                        AssetImage("lib/images/profilKaryawan.png"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Dicky Arya Saputra",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Logged in with Google",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    "0 Posts",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("View My Profile"),
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

  void _logout(BuildContext context) {
    // Implement your logout functionality here
    Navigator.of(context).pop(); // Example: Navigate back to login screen
  }
}
