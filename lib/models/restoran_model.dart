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
          'https://lsupariwisata.com/wp-content/uploads/2016/03/pringsewu-purwokerto.jpg',
      rating: 5.0,
      price: 30000,
      menu: 'Ayam banyumasan cocol sambal, Puding berbentuk hati',
    ),
    Restaurant(
      id: '2',
      name: 'Bebek Haji Slamet',
      description:
          'Bosen makan makanan itu itu aja ? Nih ada tempat makan legendaris yang menjaga standarisasi rasanya, mana lagi kalau bukan Bebek Goreng H Slamet, dengan aneka banyak macam menu bebek goreng, tidak hanya bebek goreng, bebek bakarnya pun tidak kalah enak loh. Recomended banget deh pokoknya buat makan bareng keluarga, teman atau kolega. Tunggu apa lagi, yuk segera merapat rasakan kenikmatan olahan bebek di rumah makan bebek goreng H Slamet.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/bebek-h-slamet.jpg',
      rating: 5.0,
      price: 15000,
      menu: 'Bebek goreng, Bebek bakar, Bebek sambal hijau',
    ),
    Restaurant(
      id: '3',
      name: 'Kaliandra Baturraden',
      description:
          'Rumah makan ayam bakar Kaliandra Baturaden.Makan enak + pemandangan indah.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/kaliandra-baturraden.jpg',
      rating: 4.5,
      price: 15000,
      menu: 'Ayam goreng dan Ayam Bakar',
    ),
    Restaurant(
      id: '4',
      name: 'Gubug Makan Mang Engking',
      description:
          'Berkunjung ke Gubug Makan Mang Engking merupakan salah satu rekomendasi restoran khas Sunda yang bernuansa ala pedesaan. Suasana tersebut bisa dilihat dari interior dan eksterior bangunan yang sangat unik, mulai dari sawah yang ada di sekelilingnya, kolam ikan, gasebo atau gubug ciri khas Mang Engking. di gubug itulah, pengunjung akan dihidangkan oleh makanan yang telah dipesan. Begitu menariknya restoran ini, maka pengunjung tidak akan lupa untuk mengabadikan momen dan banyaknya spot foto instagramable disini membuat pengunjung happy dan tertarik untuk berkunjung kembali. Tempat yang biasa dijadikan untuk meeting kantor atau acara keluarga ini memiliki menu spesial seperti ikan dan seafood,  serta jenis minuman tradisional sampai modern juga tersedia disini. Gubug Makan Mang Engking merupakan rekomendasi terbaik sebagai restoran yang unik dan menarik.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/gubug-makan-mang-engking.jpg',
      rating: 5.0,
      price: 50000,
      menu: 'Gurame bakar, Gurame goreng asam manis, Ayam sambal korek',
    ),
    Restaurant(
      id: '5',
      name: 'Lik Chip Tepi Sawah',
      description:
          'Ingin makan dengan suasana yang berbeda ? Disini rumah makan Lik Chip tepi sawah dengan suasana yang sangatlah berbeda dari yang lain. Disini kita bisa mendapatkan suasanya yang sangat asri dengan pemandangan sawah yang luas dan indah. Disini ada menu andalannya loh! Makanannya yang super enak yaitu bebek goreng, bebeknya gurih crispy diluar tapi dalam dagingnya lembut, di rumah makan lik chip tepi sawah ini masih  banyak lagi loh menu menu andalannya. Disini juga ada live musik dengan iringan gitar dan harmonika dengan lagu lagu nostalgianya. Tunggu apa lagi buruan datang ajak sanak saudaranya dan keluarga dijamin puas deh.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/lik-chip-tepi-sawah.jpg',
      rating: 4.0,
      price: 18000,
      menu: 'Ayam Bakar dan Ayam Goreng',
    ),
    Restaurant(
      id: '6',
      name: 'Lombok Idjo',
      description:
          'Belum lengkap rasanya belum datang di rumah  makan lombok idjo. Rumah makan khas jawa yang menyajikan makanan jawa dan tempat makan yang khas juga dengan bangunan rumah joglo dan mempunyai ikon patung semar di depan menambah daya tarik tersendiri. Disini menyediakan aneka makanan khas jawa dengan sambel yang spesial yaitu sambel lombok ijonya. Yuk buruan datang di rumah makan lombok idjo, jangan lupa ajak pasangan atau keluarga supaya menambah kesan yang lebih spesial.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/lombok-idjo.jpg',
      rating: 4.0,
      price: 20000,
      menu: 'Makanan khas jawa dipadukan dengan sambel lombok : Ayam srundeng, Ayam kalasan',
    ),
    Restaurant(
      id: '7',
      name: 'Madhang Maning Park',
      description:
          'Madhang Maning Park merupakan salah satu destinasi wisata baru berbasis sentral kuliner atau UMKM di Kecamatan Purwokerto Timur Kawasan Kota baru Purwokerto Kabupaten Banyumas. Madhang atau madang merupakan istilah Bahasa jawa disebut orang Indonesia sebagai “makan”. ',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/madhang-maning-park.JPG',
      rating: 4.0,
      price: 15000,
      menu: 'Ketoprak, Gado Gado, Soto, Bubur',
    ),
    Restaurant(
      id: '8',
      name: 'Oemah Daun',
      description:
          'Oemah Daun merupakan salah satu Restaurant favorite di Kabupaten Banyumas karena tempatnya yang adem, memiliki interior restaurant yang keren, dan sangat instagramable. Lokasinya yang terletak di tengah perkotaan membuat kita tidak kesulitan untuk mencarinya. Mungkin banyak yang beranggapan jika ada restaurant yang terletak di tengah kota maka atmosfernya tidak terlalu menyenangkan. Namun anggapan tersebut tidak berlaku di Restaurant Oemah Daun karena disini para pelanggan akan dimanjakan dengan tempat yang sangat nyaman, penataanya yang baik dan serasi membuat terkesan mewah. Untuk menunya sangat bervariasi namun lebih didominasi masakan – masakan khas jawa. Dan soal masakannya tidak perlu diragukan lagi rasanya karena Oemah Daun sudah terbukti sangat nikmat dan lezat. ',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/oemah-daun-cafe-resto.jpg',
      rating: 4.0,
      price: 25000,
      menu: 'Ikan Bakar, Ikan Goreng, Ayam Bakar, dan Ayam Goreng',
    ),
    Restaurant(
      id: '9',
      name: 'Gereh Lodeh',
      description:
          'Berwisata ke Purwokerto akan terasa kurang lengkap jika kita tidak mengunjungi salah satu rumah makan yang sangat terkenal yaitu Gereh Lodeh. Dengan lokasi yang nyaman karena letaknya yang sangat dekat dengan Gunung Slamet sehingga sangat cocok untuk acara keluarga, meeting, dan acara pesta lainnya. Selain itu, tempatnya yang memberikan ketenangan karena panorama alam pedesaan yang asri dan memiliki fasilitas yang cukup lengkap seperti lahan parkir yang luas dan tersedianya lapangan kecil untuk bermain. Gereh Lodeh sendiri menyajikan menu – menu masakan khas jawa yang pastinya sangat nikmat dan terjamin kelezatanya. Contoh menunya seperti Gereh, Lodeh, Mangut, Lele, dan Ayam. Masakan ini sangat cocok untuk anda yang ingin sekali mencoba masakan khas asli daerah Banyumasan. Dan untuk soal harga disini sangat terjangkau sekali, sehingga tidak memberatkan para pelanggan, dengan harga yang terjangkau anda sudah bisa menikmati masakan khas daerah Banyumasan. ',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/rm-gereh-lodeh.jpg',
      rating: 4.0,
      price: 22000,
      menu: 'Gereh, Lodeh, Mangut, Lele, dan Ayam.',
    ),
  ];

  String get title => name;
}
