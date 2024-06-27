class Hotel {
  final String namaHotel;
  final String lokasi;
  final String deskripsi;
  final String telepon;
  final String harga;
  final int jmlBintang;
  final String gambar;

  Hotel({
    required this.namaHotel,
    required this.lokasi,
    required this.deskripsi,
    required this.telepon,
    required this.harga,
    required this.jmlBintang,
    required this.gambar,
  });

  static List<Hotel> hotels = [
    Hotel(
      namaHotel: "Grand Karlita",
      lokasi: "Jl. S. Parman No.102, Karangbawang, Purwokerto Kulon, Purwokerto Selatan",
      deskripsi: "ini adalah deskripsi singkat tentang produk ini, apakah anda dapat membaca tulisan ini, jika ya selamat berarti anda bisa membaca, tapi jika anda tidak dapat membaca tulisan ini maka silakan belajar membaca dulu",
      telepon: "082264888080",
      harga: "Rp. 300.000/malam",
      jmlBintang: 3,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/grand-karlita.jpeg",
    ),
    Hotel(
      namaHotel: "Aston Imperium Purwokerto",
      lokasi: "Jl. Overste Isdiman No.33, Glempang, Bancarkembar, Kec. Purwokerto Utara, Kabupaten Banyumas, Jawa Tengah 53114, Bancarkembar, Purwokerto Utara",
      deskripsi: "Aston Imperium Purwokerto adalah hotel bintang 4 yang terletak diantara Jalan overste Isdiman dan Jalan Dr. Suharso. Lokasi hotel sangat strategis karena berada di perempatan kampus Universitas Jenderal Soedirman (UNSOED) di utara, GOR Satria di timur, dan kawasan pasar Kebondalem selatan.",
      telepon: "0281628000",
      harga: "Rp. 500.000/malam",
      jmlBintang: 4,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/aston-imperium-purwokerto.jpeg",
    ),
    Hotel(
      namaHotel: "Aston Imperium Purwokerto",
      lokasi: "Jl. Overste Isdiman No.33, Glempang, Bancarkembar, Kec. Purwokerto Utara, Kabupaten Banyumas, Jawa Tengah 53114, Bancarkembar, Purwokerto Utara",
      deskripsi: "Aston Imperium Purwokerto adalah hotel bintang 4 yang terletak diantara Jalan overste Isdiman dan Jalan Dr. Suharso. Lokasi hotel sangat strategis karena berada di perempatan kampus Universitas Jenderal Soedirman (UNSOED) di utara, GOR Satria di timur, dan kawasan pasar Kebondalem selatan.",
      telepon: "0281628000",
      harga: "Rp. 500.000/malam",
      jmlBintang: 4,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/aston-imperium-purwokerto.jpeg",
    ),
  ];
}
