import 'package:flutter/material.dart';
import '../models/rencana_model.dart';

class ConfirmCheckoutScreen extends StatelessWidget {
  final Rencana rencana;

  const ConfirmCheckoutScreen({Key? key, required this.rencana}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Anda akan checkout rencana ini:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              rencana.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                rencana.checkout(context); // Panggil fungsi checkout dari rencana
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Checkout berhasil')),
                );
              },
              child: Text('Konfirmasi Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
