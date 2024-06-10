import 'package:flutter/material.dart';
import 'package:mobile_apps/models/logincustomers.dart';
import 'dashboard.dart';
//import 'favorit.dart';
import 'pesanan.dart';
import 'profil_page.dart'; // Mengimpor profile_page.dart
//import 'package:mobile_apps/models/registermodel.dart'; // Mengimpor register_model.dart

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

final LoginCustomerModel user = LoginCustomerModel(
  id: 1,
  name: 'John Doe',
  email: 'johndoe@example.com',
  password: 'password',
);


  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      DashboardPage(),
      //FavoritPage(),
      PesananPage(),
      ProfilePage(customer: user),

    // Menggunakan user sebagai customer
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 23, 173, 248),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, color: Colors.white),
            label: '', // Menambahkan label untuk item Home
          ),
          /*BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.blueAccent),
            label: 'Favorite', // Menambahkan label untuk item Favorite
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded, color: Colors.white),
            label: '', // Menambahkan label untuk item History
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: '', // Menambahkan label untuk item Profile
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}





/*import 'package:mobile_apps/Theme.dart';
import 'dashboard.dart';
import 'favorit.dart';
import 'pesanan.dart';
import 'profil_page.dart';
import 'package:mobile_apps/Theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    DashboardPage(),
    FavoritPage(),
    PesananPage(),
    ProfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, color: Colors.blueAccent,),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.blueAccent),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded, color: Colors.blueAccent),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blueAccent),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    );
  }
}
*/