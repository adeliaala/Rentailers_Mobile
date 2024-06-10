import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_apps/Theme.dart';
import 'package:mobile_apps/models/mobil_models.dart';
import 'package:mobile_apps/widgets/mobil_card.dart';

class DashboardPage extends StatelessWidget {
  final List<String> imgList = [
    'assets/mobil 1.jpg',
    'assets/mobil 2.jpg',
    'assets/mobil 3.jpg',
    'assets/mobil 4.jpg',
    'assets/mobil 5.jpg',
  ];

  final List<MobilSayaModel> mobilList = [
    MobilSayaModel(
      nopol: "P1234XY",
      merkmobil: "Toyota Avanza",
      harga: 250000,
      type: "1.3 E M/T",
      status: "Tersedia",
      gambar: "assets/avanza.webp",
      deskripsi: "Lorem ipsum dolor sit amet",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    MobilSayaModel(
      nopol: "DK1281NA",
      merkmobil: "Honda Jazz",
      harga: 300000,
      type: "1.5 RS CVT",
      status: "Tersedia",
      gambar: "assets/honda jazz.webp",
      deskripsi: "Lorem ipsum dolor sit amet",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    MobilSayaModel(
      nopol: "GHI789",
      merkmobil: "Toyota Innova",
      harga: 350000,
      type: "Venturer A/T",
      status: "Tersedia",
      gambar: "assets/innova.webp",
      deskripsi: "Lorem ipsum dolor sit amet",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    MobilSayaModel(
      nopol: "N4385YA",
      merkmobil: "Suzuki Ertiga",
      harga: 320000,
      type: "GL M/T",
      status: "Tersedia",
      gambar: "assets/ertiga.jpg",
      deskripsi: "Lorem ipsum dolor sit amet",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          "Dashboard",
          style: greyTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 14,
            letterSpacing: 0.1,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome to Rental Mobile",
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: whiteColor,
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
                  Text(
                    "Search for Cars",
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Mobil Tersedia",
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: mobilList.map((mobil) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardMobil(mobil: mobil),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
