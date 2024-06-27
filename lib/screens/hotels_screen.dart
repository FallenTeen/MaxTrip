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
            const CustomHeader(title: 'Wisata'),
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
      padding: const EdgeInsets.all(10.0),
      itemCount: hotels.length,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: '${hotel.namaHotel}_${hotel.lokasi}',
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(hotel.gambar),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                  SizedBox(height: 5),
                  Text(
                    hotel.lokasi,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text(
                    hotel.deskripsi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10),
                  Text(
                    hotel.harga,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                  ),
                  SizedBox(height: 5),
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
    );
  }
}