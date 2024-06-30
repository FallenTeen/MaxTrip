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
      title: 'Pringsewu Baturraden',
      description: 'Menyediakan berbagai makanan dengan pemandangan indah.',
      imageUrl:
          'https://www.kemutuglor-baturraden.desa.id/wp-content/uploads/Lokasi-Kawasan-Hutan-Lindung-Kebun-Raya-Baturraden-kabupaten-Banyumas.webp',
      date: '2024-07-01',
      location: 'Baturraden, Banyumas',
    ),
    Rencana(
      id: 2,
      jenisTempat: 'Restoran',
      title: 'Warung Soto Sokaraja',
      description: 'Menyajikan soto khas Sokaraja dengan cita rasa yang lezat.',
      imageUrl:
          'https://dolanbanyumas.banyumaskab.go.id/assets/gambar_objek/hutan-pinus-limpakuwus.jpg',
      date: '2024-08-15',
      location: 'Sokaraja, Banyumas',
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
}
