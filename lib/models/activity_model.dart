class Activity {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;

  const Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });

  static const List<Activity> activities = [
    Activity(
      id: '1',
      title: 'Nikmati Wisata Kebun Raya Baturraden',
      description:
          'Kebun Raya Baturraden Banyumas ini merupakan satu diantara sekian banyak tempat wisata di Purwokerto yang mengoleksi aneka tanaman, terutama tanaman bunga anggrek.',
      imageUrl:
          'https://www.kemutuglor-baturraden.desa.id/wp-content/uploads/Lokasi-Kawasan-Hutan-Lindung-Kebun-Raya-Baturraden-kabupaten-Banyumas.webp',
      price: 15.000,
      rating: 4,
    ),
    Activity(
      id: '2',
      title: 'Nikmati Sejuknya Limpakuwus',
      description:
          'Hutan Pinus Limpakuwus tidak seperti hutan lainnya yang mungkin sering terasa menyeramkan.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/hutan-pinus-limpakuwus.jpg',
      price: 15.000,
      rating: 4,
    ),
    Activity(
      id: '3',
      title: 'The Village Purwokerto',
      description:
          'https://dolanbanyumas.banyumaskab.go.id/objek_wisata/detail?o=the-village-purwokerto',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/.jpeg',
      price: 10.000,
      rating: 4,
    ),
    Activity(
      id: '4',
      title: 'Berrenang di eksotisnya Taman Panemon',
      description:
          'Taman Panemon adalah  kolam renang yang memberikan konsep pantai, semakin ke tepi kedalamannya semakin dangkal. Selain itu di tengah-tengah terdapat pulau kecil tempat dari pohon kelapa berdiri. Kolam renang berwarna putih di tepian dan warna biru di dasar kolam.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/taman-panemon.jpg',
      price: 15.000,
      rating: 4,
    ),
    Activity(
      id: '5',
      title: 'Lihat Keajaiban Alam di Lazuardi',
      description:
          'Taman Botani menyajikan bermacam jenis tanaman hias bunga anggrek yang menjadi sarana edukasi mengenal tanaman hias dengan berbagai keunikannya',
      imageUrl:
          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/468355905.jpg?k=c81fa83a7fec367987d5850e5ba40021d2a724f1ab8539587ce462c169579b45&o=&hp=1',
      price: 7.000,
      rating: 4,
    ),
    Activity(
      id: '6',
      title: 'Melihat Cerahnya Gunung Slamet',
      description:
          'Siapa si yang ngga mau keliling dunia dan mengunjungi berbagai negara di luar sana? Hampir setiap orang setidaknya memiliki satu negara impian yang ingin dikunjungi. Akan tetapi, tidak membutuhkan biaya dan usaha yang sedikit untuk untuk mencapainya.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/new-small-word.jpg',
      price: 15.000,
      rating: 4,
    ),
    Activity(
      id: '7',
      title: 'Temukan Hal kecil di alam',
      description:
          'Taman Botani menyajikan bermacam jenis tanaman hias bunga anggrek yang menjadi sarana edukasi mengenal tanaman hias dengan berbagai keunikannya.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/taman-botani.png',
      price: 15.000,
      rating: 4,
    ),
    Activity(
      id: '8',
      title: 'Berinteraksi dengan hewan',
      description:
          'Lembu Benggolo merupakan di tempat wisata  yang memiliki daya tarik mini zoo, yaitu terdapat banyak hewan- hewan ',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/lembu-benggolo-farm-resort.jpg',
      price: 20.000,
      rating: 4,
    ),
    Activity(
      id: '9',
      title: 'Menikmati Alam',
      description:
          'Salah satu tempat wisata yang menjadi idola dan wajib di kunjungi saat berada di Kabupaten Banyumas adalah Lokawisata Baturraden.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/lokawisata-baturraden.JPG',
      price: 19.000,
      rating: 4,
    ),
  ];
}
