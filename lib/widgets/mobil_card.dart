import 'package:flutter/material.dart';
import 'package:mobile_apps/Theme.dart';
import 'package:mobile_apps/models/mobil_models.dart'; // Import model MobilSayaModel
import 'package:mobile_apps/screens/detail_mobil_page.dart';
 // Import halaman DetailMobilPage

class CardMobil extends StatelessWidget {
  final MobilSayaModel mobil;

  const CardMobil({Key? key, required this.mobil}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMobilPage(mobil: mobil),
          ),
        );
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                mobil.gambar,
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                mobil.merkmobil,
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
