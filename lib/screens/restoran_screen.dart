import 'package:flutter/material.dart';
import 'restoran_details_screen.dart'; // Pastikan import yang sesuai dengan struktur aplikasi Anda
import '../models/restoran_model.dart'; // Sesuaikan dengan struktur model Anda
import '../widgets/custom_header.dart'; // Sesuaikan dengan lokasi widget Anda

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({Key? key}) : super(key: key);

  static const routeName = '/restaurants';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Restaurant> restaurants = Restaurant.restaurants;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const CustomHeader(title: 'Restoran Banyumas'), // Ganti judul sesuai kebutuhan
          Expanded(
            child: _RestaurantsGrid(
              width: width,
              restaurants: restaurants,
            ),
          ),
        ],
      ),
    );
  }
}

class _RestaurantsGrid extends StatelessWidget {
  const _RestaurantsGrid({
    Key? key,
    required this.width,
    required this.restaurants,
  }) : super(key: key);

  final double width;
  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10.0),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: restaurants.map((restaurant) => _buildRestaurantCard(context, restaurant)).toList(),
    );
  }

  InkWell _buildRestaurantCard(
    BuildContext context,
    Restaurant restaurant,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantsDetailsScreen(restaurant: restaurant),
          ),
        );
      },
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Hero(
              tag: '${restaurant.id}_${restaurant.name}',
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      restaurant.rating.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Text(
                  restaurant.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
