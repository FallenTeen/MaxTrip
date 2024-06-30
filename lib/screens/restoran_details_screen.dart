import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/clipped_container.dart';
import '../models/restoran_model.dart'; // Import your restaurant model here
import '../models/rencana_model.dart'; // Import your rencana model here
import '../screens/rencana_screen.dart'; // Import your rencana screen here

class RestaurantsDetailsScreen extends StatelessWidget {
  const RestaurantsDetailsScreen({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  void _handlePlanButtonPress(BuildContext context) {
    final newRencana = Rencana(
      id: Rencana.getNextId(),
      jenisTempat: 'Restoran',
      title: restaurant.title,
      description: restaurant.description,
      imageUrl: restaurant.imageUrl,
      date: DateTime.now().toString().split(' ')[0],
      location: "",
    );

    Rencana.addRencana(newRencana);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RencanaScreen(),
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
            _RestaurantImage(restaurant: restaurant), // Call _RestaurantImage widget here
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
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        RatingBar.builder(
          initialRating: restaurant.rating,
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            // Handle rating update
          },
        ),
        const SizedBox(height: 20),
        Text(
          'About',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          restaurant.description,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\Rp ${restaurant.price}',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
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
                style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
