import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:maxtrip/halaman/authpage.dart';
import 'package:maxtrip/screens/rencana_screen.dart';
import 'package:maxtrip/screens/activities_screen.dart';
import 'package:maxtrip/screens/hotels_screen.dart';
import 'package:maxtrip/screens/restoran_screen.dart';

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
                    "Hello, Welcome $userName",
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
                  // Search bar
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for places',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Discover Section
                  Text(
                    "Discover",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDiscoverCard(
                        context,
                        Icons.beach_access,
                        'Wisata',
                        ActivitiesScreen.routeName,
                      ),
                      _buildDiscoverCard(
                        context,
                        Icons.hotel,
                        'Hotel',
                        HotelScreen.routeName,
                      ),
                      _buildDiscoverCard(
                        context,
                        Icons.restaurant,
                        'Restoran',
                        RestaurantsScreen.routeName,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Special Offers Section
                  Text(
                    "Special Offers",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildSpecialOffers(),
                  SizedBox(height: 20),
                  // Recommended Places Section
                  Text(
                    "Recommended Places",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildRecommendedPlaces(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscoverCard(
      BuildContext context, IconData icon, String title, String routeName) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Card(
          child: Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.blue),
                SizedBox(height: 10),
                Text(title, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialOffers() {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildOfferCard('Discount up to 60%!',
              'Valid for new customers in MaxTrip', 'JALANYUK'),
          _buildOfferCard(
              'Extra Disc. up to 50%', 'Valid for PayLater users', 'MaxTrip'),
        ],
      ),
    );
  }

  Widget _buildOfferCard(String title, String subtitle, String code) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(right: 10),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              SizedBox(height: 10),
              Text('CODE: $code',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendedPlaces() {
    return Column(
      children: [
        _buildPlaceCard('Beautiful Beach', 'Enjoy the sunny beach'),
        _buildPlaceCard('Mountain Hiking', 'Experience the adventure'),
        _buildPlaceCard('City Tours', 'Discover the city vibes'),
      ],
    );
  }

  Widget _buildPlaceCard(String title, String subtitle) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(Icons.place, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          // Navigate to place details
        },
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Logout"),
          content: Text("Apakah anda benar benar ingin logout?"),
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

void main() => runApp(MaterialApp(home: DashboardProfile()));
