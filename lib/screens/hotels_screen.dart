import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:maxtrip/models/hotel_model.dart';
import '../widgets/custom_header.dart';
import 'package:maxtrip/screens/hotel_detail_screen.dart'; // Halaman detail hotel jika diperlukan

class HotelScreen extends StatelessWidget {
  const HotelScreen({Key? key}) : super(key: key);

  static const routeName = '/hotels';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<Hotel> hotels = Hotel.hotels;

    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const CustomHeader(title: 'Hotel'),
            _HotelsMasonryGrid(
              width: width,
              hotels: hotels,
            ),
          ],
        ),
      );
  }
}

class _HotelsMasonryGrid extends StatelessWidget {
  const _HotelsMasonryGrid({
    Key? key,
    required this.width,
    required this.hotels,
  }) : super(key: key);

  final double width;
  final List<Hotel> hotels;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(5.0),
      itemCount: hotels.length,
      crossAxisCount: 1,
      mainAxisSpacing: 3,
      crossAxisSpacing: 3,
      itemBuilder: (context, index) {
        Hotel hotel = hotels[index];
        return _buildHotelCard(
          context,
          hotel,
          index,
        );
      },
    );
  }

  InkWell _buildHotelCard(
    BuildContext context,
    Hotel hotel,
    int index,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(hotel: hotel), // Halaman detail hotel jika diperlukan
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.symmetric(vertical: 3.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Hero(
                tag: '${hotel.namaHotel}_${hotel.lokasi}',
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage(hotel.gambar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotel.namaHotel,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
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
                          iconData = Icons.hotel; // Default icon
                          break;
                      }
                      return Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(iconData, size: 16),
                      );
                    }).toList(),
                  ),
                    const SizedBox(height: 3),
                    Text(
                      hotel.lokasi,
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      hotel.deskripsi,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Rp ${hotel.harga}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: List.generate(
                        hotel.jmlBintang,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}