import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/hotel_model.dart';
import '../widgets/clipped_container.dart';

class HotelDetailsScreen extends StatelessWidget {
  const HotelDetailsScreen({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.namaHotel),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _HotelImage(hotel: hotel),
          Expanded(
            child: _HotelInformation(hotel: hotel),
          ),
        ],
      ),
    );
  }
}

class _HotelImage extends StatelessWidget {
  const _HotelImage({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ClippedContainer(height: 300),
        Hero(
          tag: '${hotel.namaHotel}_${hotel.lokasi}',
          child: ClippedContainer(imageUrl: hotel.gambar),
        ),
      ],
    );
  }
}

class _HotelInformation extends StatelessWidget {
  const _HotelInformation({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotel.namaHotel,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RatingBar.builder(
            initialRating: hotel.jmlBintang.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 20,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
          const SizedBox(height: 20),
          //icon fasilitas
          Text(
            'About',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            hotel.deskripsi,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hotel.harga,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle 'Buat Rencana' button press
                },
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
      ),
    );
  }
}
