import 'package:flutter/material.dart';
import 'package:mobile_apps/models/mobil_models.dart'; // Import model MobilSayaModel
import 'data_diri_page.dart'; // Import halaman DataDiriPage

class DetailMobilPage extends StatelessWidget {
  final MobilSayaModel mobil;

  const DetailMobilPage({Key? key, required this.mobil}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Mobil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              mobil.gambar,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              mobil.merkmobil,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'No. Polisi: ${mobil.nopol}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Type: ${mobil.type}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Harga: Rp ${mobil.harga}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataDiriPage(),
                  ),
                );
              },
              child: Text('Pesan Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
