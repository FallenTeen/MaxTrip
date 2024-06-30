import 'package:flutter/material.dart';
import 'package:maxtrip/screens/confirm_checkout_screen.dart';

class Rencana {
  final int id;
  final String jenisTempat;
  final String title;
  final String description;
  final String imageUrl;
  final String date;
  final String location;

  Rencana({
    required this.id,
    required this.jenisTempat,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.location,
  });

  static List<Rencana> rencanas = [
    Rencana(
      id: 1,
      jenisTempat: 'Restoran',
      title: 'Gubug Makan Mang Engking',
      description:  'Berkunjung ke Gubug Makan Mang Engking merupakan salah satu rekomendasi restoran khas Sunda yang bernuansa ala pedesaan. Suasana tersebut bisa dilihat dari interior dan eksterior bangunan yang sangat unik, mulai dari sawah yang ada di sekelilingnya, kolam ikan, gasebo atau gubug ciri khas Mang Engking. di gubug itulah, pengunjung akan dihidangkan oleh makanan yang telah dipesan. Begitu menariknya restoran ini, maka pengunjung tidak akan lupa untuk mengabadikan momen dan banyaknya spot foto instagramable disini membuat pengunjung happy dan tertarik untuk berkunjung kembali. Tempat yang biasa dijadikan untuk meeting kantor atau acara keluarga ini memiliki menu spesial seperti ikan dan seafood,  serta jenis minuman tradisional sampai modern juga tersedia disini. Gubug Makan Mang Engking merupakan rekomendasi terbaik sebagai restoran yang unik dan menarik.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/gubug-makan-mang-engking.jpg',
      date: '2024-07-01',
      location: 'Gurame bakar, Gurame goreng asam manis, Ayam sambal korek',
    ),
    Rencana(
      id: 2,
      jenisTempat: 'Restoran',
      title: 'Bebek Haji Slamet',
      description:
          'Bosen makan makanan itu itu aja ? Nih ada tempat makan legendaris yang menjaga standarisasi rasanya, mana lagi kalau bukan Bebek Goreng H Slamet, dengan aneka banyak macam menu bebek goreng, tidak hanya bebek goreng, bebek bakarnya pun tidak kalah enak loh. Recomended banget deh pokoknya buat makan bareng keluarga, teman atau kolega. Tunggu apa lagi, yuk segera merapat rasakan kenikmatan olahan bebek di rumah makan bebek goreng H Slamet.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/bebek-h-slamet.jpg',
      date: '2024-08-15',
      location: 'Bebek goreng, Bebek bakar, Bebek sambal hijau',
    ),
    Rencana(
      id: 3,
      jenisTempat: 'Wisata',
      title: 'Taman Panemon',
      description:
          'Kolam renang dengan konsep pantai dan pemandangan yang indah.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/taman-panemon.jpg',
      date: '2024-09-10',
      location: 'Banyumas',
    ),
    Rencana(
      id: 4,
      jenisTempat: 'Wisata',
      title: 'Lokawisata Baturraden',
      description: 'Wisata alam dengan udara sejuk dan panorama yang memukau.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/lokawisata-baturraden.JPG',
      date: '2024-10-05',
      location: 'Baturraden, Banyumas',
    ),
    Rencana(
      id: 5,
      jenisTempat: 'Hotel',
      title: 'Lembu Benggolo Farm & Resort',
      description:
          'Resort dengan fasilitas mini zoo dan udara segar di pegunungan.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/lembu-benggolo-farm-resort.jpg',
      date: '2024-11-20',
      location: 'Banyumas',
    ),
  ];

  static int getNextId() {
    return rencanas.isNotEmpty ? rencanas.last.id + 1 : 1;
  }

  static void addRencana(Rencana rencana) {
    rencanas.add(rencana);
  }

  static void removeRencana(int id) {
    rencanas.removeWhere((rencana) => rencana.id == id);
  }

  void checkout(BuildContext context) {
    // Implementasi fungsi checkout
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConfirmCheckoutScreen(rencana: this),
      ),
    );
  }
}
