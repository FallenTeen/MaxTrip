import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang di MaxTrip, Rencanakan Perjalanan Anda!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildPreviewCard(
              context,
              'Wisata',
              'Jelajahi destinasi wisata menarik.',
              Icons.location_on,
              '/activities',
            ),
            const SizedBox(height: 10),
            _buildPreviewCard(
              context,
              'Hotel',
              'Temukan penginapan terbaik.',
              Icons.hotel,
              '/hotels',
            ),
            const SizedBox(height: 10),
            _buildPreviewCard(
              context,
              'Restoran',
              'Nikmati kuliner terbaik.',
              Icons.restaurant,
              '/restaurants',
            ),
            const SizedBox(height: 10),
            _buildPreviewCard(
              context,
              'Perencanaan',
              'Rencanakan perjalanan Anda.',
              Icons.calendar_today,
              '/planning',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    String routeName,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
