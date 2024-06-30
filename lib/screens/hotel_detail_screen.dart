import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maxtrip/models/rencana_model.dart';
import 'package:maxtrip/screens/rencana_screen.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _HotelImage(hotel: hotel),
            _HotelInformation(hotel: hotel),
          ],
        ),
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
          Row(
            children: hotel.fasilitas.map((facility) {
              IconData iconData;
              switch (facility) {
                case 'wifi':
                  iconData = Icons.wifi;
                  break;
                case 'pool':
                  iconData = Icons.pool;
                  break;
                case 'parking':
                  iconData = Icons.local_parking;
                  break;
                case 'restaurant':
                  iconData = Icons.restaurant;
                  break;
                case 'bathub':
                  iconData = Icons.bathtub;
                  break;
                case 'shower':
                  iconData = Icons.shower;
                  break;
                // Add more cases for other facilities as needed
                default:
                  iconData = Icons.hotel;
                  break;
              }
              return Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Icon(iconData, size: 16),
              );
            }).toList(),
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
          Text(
            'About',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            hotel.deskripsi,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp ${hotel.harga}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  final newRencana = Rencana(
                    id: Rencana.getNextId(),
                    jenisTempat: 'Hotel',
                    title: hotel.namaHotel,
                    description: hotel.deskripsi,
                    imageUrl: hotel.gambar,
                    date: DateTime.now().toString().split(' ')[0],
                    location: hotel.lokasi,
                  );

                  Rencana.addRencana(newRencana);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RencanaScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 16, 138, 204),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  'Buat Rencana',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
