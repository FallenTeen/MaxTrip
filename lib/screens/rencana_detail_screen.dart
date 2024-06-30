import 'package:flutter/material.dart';
import '../widgets/clipped_container.dart';
import '../models/rencana_model.dart';
import '../screens/confirm_checkout_screen.dart';

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _RencanaImage(rencana: rencana),
              _RencanaInformation(rencana: rencana),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ConfirmCheckoutScreen(rencana: rencana),
                        ),
                      );
                    },
                    child: Text('Checkout'),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Rencana.removeRencana(rencana.id);
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(context, '/rencanas');
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
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
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Lokasi: ${rencana.location}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Tentang',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            rencana.description,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rencana.date,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
