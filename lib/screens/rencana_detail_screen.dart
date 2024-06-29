import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/clipped_container.dart';
import '../models/rencana_model.dart'; // Pastikan sesuai dengan model yang digunakan

class RencanaDetailsScreen extends StatelessWidget {
  const RencanaDetailsScreen({
    Key? key,
    required this.rencana,
  }) : super(key: key);

  final Rencana rencana;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(rencana.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _RencanaImage(rencana: rencana),
          Expanded(
            child: _RencanaInformation(rencana: rencana),
          ),
        ],
      ),
    );
  }
}

class _RencanaImage extends StatelessWidget {
  const _RencanaImage({
    Key? key,
    required this.rencana,
  }) : super(key: key);

  final Rencana rencana;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ClippedContainer(height: 425),
        Hero(
          tag: '${rencana.id}_${rencana.title}',
          child: ClippedContainer(imageUrl: rencana.imageUrl),
        ),
      ],
    );
  }
}

class _RencanaInformation extends StatelessWidget {
  const _RencanaInformation({
    Key? key,
    required this.rencana,
  }) : super(key: key);

  final Rencana rencana;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            rencana.title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Lokasi: ${rencana.location}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Text(
            'Tentang',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            rencana.description,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rencana.date,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Fungsi untuk menangani tombol 'Checkout'
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 16, 138, 204),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text(
                      'Checkout',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      // Fungsi untuk menangani tombol 'Hapus'
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
