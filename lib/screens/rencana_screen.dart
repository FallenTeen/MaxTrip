import 'package:flutter/material.dart';
import '../models/rencana_model.dart';
import 'rencana_detail_screen.dart';

class RencanaScreen extends StatefulWidget {
  const RencanaScreen({Key? key}) : super(key: key);

  static const routeName = '/rencanas';

  @override
  _RencanaScreenState createState() => _RencanaScreenState();
}

class _RencanaScreenState extends State<RencanaScreen> {
  List<Rencana> rencanas = Rencana.rencanas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rencana Perjalanan'),
      ),
      body: ListView.builder(
        itemCount: rencanas.length,
        itemBuilder: (context, index) {
          Rencana rencana = rencanas[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RencanaDetailsScreen(rencana: rencana),
                ),
              );
            },
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: '${rencana.id}_${rencana.title}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        rencana.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rencana.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(rencana.location),
                      ],
                    ),
                  ),
                  Icon(_getIconForPlace(rencana.jenisTempat),
                      color: Colors.grey),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Contoh untuk menambah rencana baru
          Rencana newRencana = Rencana(
            id: (rencanas.length + 1),
            title: 'Rencana Baru',
            description: 'test',
            date: 'aa',
            imageUrl: 'https://example.com/new.jpg',
            location: 'Tempat Baru',
            jenisTempat: 'Wisata',
          );
          setState(() {
            rencanas.add(newRencana);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  IconData _getIconForPlace(String jenisTempat) {
    switch (jenisTempat) {
      case 'Hotel':
        return Icons.hotel;
      case 'Restoran':
        return Icons.restaurant;
      case 'Wisata':
        return Icons.beach_access;
      default:
        return Icons.place;
    }
  }
}
