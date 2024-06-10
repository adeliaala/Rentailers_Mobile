import 'package:flutter/material.dart';
import 'package:mobile_apps/models/logincustomers.dart';
import '../Theme.dart';
import 'edit_profile_page.dart';
import 'login.dart'; // Import halaman LoginPage

class ProfilePage extends StatefulWidget {
  final LoginCustomerModel customer;

  const ProfilePage({Key? key, required this.customer}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late LoginCustomerModel customer;

  @override
  void initState() {
    super.initState();
    customer = widget.customer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${customer.name}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: ${customer.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Nomor Telepon: 082921930284', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Alamat: Situbondo, Jawa Timur', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final updatedCustomer = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(customer: customer),
                    ),
                  );

                  if (updatedCustomer != null) {
                    setState(() {
                      customer = updatedCustomer;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 23, 173, 248),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text('Edit Profil',style: whitekTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 17)),
              ),
            ),
            Spacer(), // Spacer untuk menempatkan tombol di bagian bawah
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(), // Menuju halaman LoginPage
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 23, 173, 248),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),

              child: Text('Log Out'
                ,style: whitekTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 17,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
