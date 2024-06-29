class Hotel {
  final String namaHotel;
  final String lokasi;
  final String deskripsi;
  final String telepon;
  final double harga;
  final int jmlBintang;
  final String gambar;
  final List<String> fasilitas;

  Hotel({
    required this.namaHotel,
    required this.lokasi,
    required this.deskripsi,
    required this.telepon,
    required this.harga,
    required this.jmlBintang,
    required this.gambar,
    required this.fasilitas,
  });

  static List<Hotel> hotels = [
    Hotel(
      namaHotel: "Grand Karlita",
      lokasi: "Jl. S. Parman No.102, Karangbawang, Purwokerto Kulon, Purwokerto Selatan",
      deskripsi: "Grand Karlita Hotel Purwokerto berbintang 4 ini menawarkan lokasi nyaman di dekat Balai Kemambang Park, yang berjarak hanya 3.1 km. Hotel ini terkenal dengan layanan luar biasa dan staf profesional.",
      telepon: "082264888080",
      harga: 300000,
      jmlBintang: 4,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/grand-karlita.jpeg",
      fasilitas: ['wifi', 'pool', 'restaurant'],
    ),
    Hotel(
      namaHotel: "Aston Imperium Purwokerto",
      lokasi: "Jl. Overste Isdiman No.33, Glempang, Bancarkembar, Kec. Purwokerto Utara, Kabupaten Banyumas, Jawa Tengah 53114, Bancarkembar, Purwokerto Utara",
      deskripsi: "Aston Imperium Purwokerto adalah hotel bintang 4 yang terletak diantara Jalan overste Isdiman dan Jalan Dr. Suharso. Lokasi hotel sangat strategis karena berada di perempatan kampus Universitas Jenderal Soedirman (UNSOED) di utara, GOR Satria di timur, dan kawasan pasar Kebondalem selatan.",
      telepon: "0281628000",
      harga: 500000,
      jmlBintang: 4,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/aston-imperium-purwokerto.jpeg",
      fasilitas: ['wifi', 'parking', 'pool', 'restaurant', 'bathub'],
    ),
    Hotel(
      namaHotel: "Hotel Anggrek",
      lokasi: "Jl. DR. Soeparno No.100, Limas Permai, Karangwangkal, Purwokerto Utara",
      deskripsi: "Hotel ini terletak dekat dengan banyak tempat wisata di Arcawinangun termasuk Batu Raden, Masjid Jenderal Besar Soedirman dan The Village.",
      telepon: "0281638550",
      harga: 250000,
      jmlBintang: 3,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/hotel-angrrek.jpeg",
      fasilitas: ['wifi', 'parking', 'pool', 'restaurant'],
    ),
    Hotel(
      namaHotel: "Meotel",
      lokasi: "Jl. DR. Soeparno No.1, Arcawinangun, Purwokerto Timur",
      deskripsi: "Meotel Purwokerto adalah salah satu akomodasi yang berada di pusat kota Purwokerto, Jawa Tengah, tepatnya di Jalan Dr. Suparno Selatan No 1, Arcawinangun",
      telepon: "02817771157",
      harga: 250000,
      jmlBintang: 4,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/meotel.jpg",
      fasilitas: ['wifi', 'parking', 'pool', 'restaurant'],
    ),
    Hotel(
      namaHotel: "COR Hotel",
      lokasi: "Jl. Jend. Soedirman No.508 - 511, Kauman Lama, Purwokerto Lor, Purwokerto Timur",
      deskripsi: "COR Hotel Purwokerto merupakan hotel yang memiliki kamar bergaya modern, kolam renang indoor dan dua restoran di pusat kota Purwokerto.",
      telepon: "02817772777",
      harga: 400000,
      jmlBintang: 4,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/cor-hotel.jpg",
      fasilitas: ['wifi', 'parking', 'pool', 'restaurant', 'shower'],
    ),
    Hotel(
      namaHotel: "JAVA HERITAGE Hotel Purwokerto",
      lokasi: "Jl. Dr. Angka No.71, Karangkobar, Sokanegara, Kec. Purwokerto Tim., Kabupaten Banyumas, Jawa Tengah 53115, Sokanegara, Purwokerto Timur",
      deskripsi: "Java Heritage Hotel Purwokerto adalah hotel mewah berbintang 4 yang terletak di jantung kawasan bisnis, Mencakup lebih dari 3.5 hektar dengan 169 kamar terdiri dari berbagai tipe",
      telepon: "0281634321",
      harga: 450000,
      jmlBintang: 4,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/java-heritage-hotel-purwokerto.jpg",
      fasilitas: ['wifi', 'parking', 'pool', 'restaurant', 'bathub'],
    ),
    Hotel(
      namaHotel: "Hotel Wisata Niaga",
      lokasi: "Jalan Merdeka No 5, Purwanegara, Kranji, Purwokerto Timur",
      deskripsi: "Hotel Wisata Niaga Purwokerto merupakan tempat penginapan yang cocok dijadikan pilihan saat sedang menyambangi kota Purwokerto.",
      telepon: "02817772888",
      harga: 450000,
      jmlBintang: 4,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/wisata-niaga.jpg",
      fasilitas: ['wifi', 'parking', 'pool', 'restaurant', 'shower'],
    ),
    Hotel(
      namaHotel: "Luminor Hotel",
      lokasi: "Jl. Jend. Soedirman No.324, Pereng, Sokanegara, Kec. Purwokerto Tim., Kabupaten Banyumas, Jawa Tengah 53116, Indonesia, Kranji, Purwokerto Timur",
      deskripsi: "Luminor Hotel Purwokerto berada di bawah Managemen Waringin Hospitality Hotel Group yang telah beroperasi sejak tahun 2010 dan merupakan anak perusahaan dari Waringin Group.",
      telepon: "02817771988",
      harga: 500000,
      jmlBintang: 4,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/luminorhotel-purwokerto-alun-alun.JPG",
      fasilitas: ['wifi', 'parking', 'pool', 'restaurant', 'bathub'],
    ),
    Hotel(
      namaHotel: "Dominic Hotel",
      lokasi: "Jl. Komisaris Bambang Suprapto No.35, Cigrobak, Purwokerto Lor, Purwokerto Timur",
      deskripsi: "Dominic Hotel Purwokerto adalah akomodasi bintang 2 yang menawarkan suasana mewah bagi Anda.",
      telepon: "02816574888",
      harga: 350000,
      jmlBintang: 4,
      gambar: "https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/dominic-hotel.jpg",
      fasilitas: ['wifi', 'parking', 'pool', 'restaurant'],
    ),
  ];
}
