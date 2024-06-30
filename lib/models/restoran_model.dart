class Restaurant {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final double price;
  final String menu;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.price,
    required this.menu,
  });

  static const List<Restaurant> restaurants = [
    Restaurant(
      id: '1',
      name: 'Pringsewu Baturraden',
      description:
          'Belum lengkap rasanya kalau berkunjung ke Baturraden tapi belum singgah di Pringsewu Baturraden. Dari luar, resto ini tampak biasa saja hanya terlihat toko souvenir dan oleh-oleh khas Purwokerto. Setelah melewati pintu masuk yang tidak terlalu besar, barulah terlihat bagaimana suasana di dalamnya. ruang makan di dalam cukup luas dan menampung sekitar 200 orang. Fasilitas di Pringsewu Baturraden ini beragam, meeting room, seperti panggung hiburan, taman yang cukup luas dan indah, kolam terapi ikan, mushola, gazebo dan taman bermain anak. Di sudut taman tersedia bangunan seperti villa untuk disewakan. Asyiknya makan di restoran Pringsewu ini, ada hadiah khusus untuk yang ulang tahun, biasanya seperti puding berbentuk hati. Menu unik dari resto ini adalah Ayam Kodok cocol sambal.',
      imageUrl:
          'https://www.kemutuglor-baturraden.desa.id/wp-content/uploads/Lokasi-Kawasan-Hutan-Lindung-Kebun-Raya-Baturraden-kabupaten-Banyumas.webp',
      rating: 4.0,
      price: 15000,
      menu: 'Ayam Kodok cocol sambal, Puding berbentuk hati',
    ),
    Restaurant(
      id: '2',
      name: 'Warung Soto Sokaraja',
      description:
          'Hutan Pinus Limpakuwus tidak seperti hutan lainnya yang mungkin sering terasa menyeramkan.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/hutan-pinus-limpakuwus.jpg',
      rating: 4.0,
      price: 15000,
      menu: 'Soto Sokaraja',
    ),
    Restaurant(
      id: '3',
      name: 'The Village Purwokerto',
      description:
          'The Village Purwokerto adalah taman yang indah untuk dikunjungi bersama keluarga.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/.jpeg',
      rating: 4.0,
      price: 10000,
      menu: 'Menu 1, Menu 2',
    ),
    Restaurant(
      id: '4',
      name: 'Berenang di eksotisnya Taman Panemon',
      description:
          'Taman Panemon adalah kolam renang yang memberikan konsep pantai, semakin ke tepi kedalamannya semakin dangkal. Selain itu di tengah-tengah terdapat pulau kecil tempat dari pohon kelapa berdiri. Kolam renang berwarna putih di tepian dan warna biru di dasar kolam.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/taman-panemon.jpg',
      rating: 4.0,
      price: 15000,
      menu: 'Menu 1, Menu 2',
    ),
    Restaurant(
      id: '5',
      name: 'Lihat Keajaiban Alam di Lazuardi',
      description:
          'Taman Botani menyajikan bermacam jenis tanaman hias bunga anggrek yang menjadi sarana edukasi mengenal tanaman hias dengan berbagai keunikannya.',
      imageUrl:
          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/468355905.jpg?k=c81fa83a7fec367987d5850e5ba40021d2a724f1ab8539587ce462c169579b45&o=&hp=1',
      rating: 4.0,
      price: 7000,
      menu: 'Menu 1, Menu 2',
    ),
    Restaurant(
      id: '6',
      name: 'Melihat Cerahnya Gunung Slamet',
      description:
          'Siapa si yang ngga mau keliling dunia dan mengunjungi berbagai negara di luar sana? Hampir setiap orang setidaknya memiliki satu negara impian yang ingin dikunjungi. Akan tetapi, tidak membutuhkan biaya dan usaha yang sedikit untuk untuk mencapainya.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/new-small-word.jpg',
      rating: 4.0,
      price: 15000,
      menu: 'Menu 1, Menu 2',
    ),
    Restaurant(
      id: '7',
      name: 'Temukan Hal kecil di alam',
      description:
          'Taman Botani menyajikan bermacam jenis tanaman hias bunga anggrek yang menjadi sarana edukasi mengenal tanaman hias dengan berbagai keunikannya.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/taman-botani.png',
      rating: 4.0,
      price: 15000,
      menu: 'Menu 1, Menu 2',
    ),
    Restaurant(
      id: '8',
      name: 'Berinteraksi dengan hewan',
      description:
          'Lembu Benggolo merupakan tempat wisata yang memiliki daya tarik mini zoo, yaitu terdapat banyak hewan-hewan.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/lembu-benggolo-farm-resort.jpg',
      rating: 4.0,
      price: 20000,
      menu: 'Menu 1, Menu 2',
    ),
    Restaurant(
      id: '9',
      name: 'Menikmati Alam',
      description:
          'Salah satu tempat wisata yang menjadi idola dan wajib dikunjungi saat berada di Kabupaten Banyumas adalah Lokawisata Baturraden.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/lokawisata-baturraden.JPG',
      rating: 4.0,
      price: 19000,
      menu: 'Menu 1, Menu 2',
    ),
  ];

  String get title => name;
}
