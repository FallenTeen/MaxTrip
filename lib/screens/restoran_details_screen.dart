import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/clipped_container.dart';
import '../models/restoran_model.dart'; // Pastikan sesuai dengan model yang digunakan

class RestaurantsDetailsScreen extends StatelessWidget {
  const RestaurantsDetailsScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  void _handlePlanButtonPress(BuildContext context) {
    // Fungsi untuk menangani tombol 'Buat Rencana'
    // Ganti dengan navigasi ke halaman rencana
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlanScreen(restaurant: restaurant),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _RestaurantImage(restaurant: restaurant),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _RestaurantInformation(
                restaurant: restaurant,
                onPlanButtonPressed: () => _handlePlanButtonPress(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RestaurantImage extends StatelessWidget {
  const _RestaurantImage({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ClippedContainer(height: 425),
        Hero(
          tag: '${restaurant.id}_${restaurant.title}',
          child: ClippedContainer(imageUrl: restaurant.imageUrl),
        ),
      ],
    );
  }
}

class _RestaurantInformation extends StatelessWidget {
  const _RestaurantInformation({
    Key? key,
    required this.restaurant,
    required this.onPlanButtonPressed,
  }) : super(key: key);

  final Restaurant restaurant;
  final VoidCallback onPlanButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          restaurant.title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        RatingBar.builder(
          initialRating: restaurant.rating,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true, // Jika diperlukan rating setengah bintang
          itemCount: 5,
          itemSize: 20,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            // Callback saat rating diubah
          },
        ),
        const SizedBox(height: 20),
        Text(
          'About',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          restaurant.description,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\Rp ${restaurant.price}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: onPlanButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 16, 138, 204),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Text(
                'Buat Rencana',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PlanScreen extends StatelessWidget {
  final Restaurant restaurant;

  const PlanScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rencana untuk ${restaurant.title}'),
      ),
      body: Center(
        child: Text('Telah dibuat Rencana untuk mengunjungi ${restaurant.title}'),
      ),
    );
  }
}
