import 'package:flutter/material.dart';
import 'package:mobile_apps/models/customers_models.dart';
import 'transaksi_page.dart';

class DataDiriPage extends StatefulWidget {
  @override
  _DataDiriPageState createState() => _DataDiriPageState();
}

class _DataDiriPageState extends State<DataDiriPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _noTelephonController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _nopolController = TextEditingController(); // New controller for nopol

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final customer = CustomersModel(
        NIK: _nikController.text,
        nama: _namaController.text,
        noTelephon: _noTelephonController.text,
        alamat: _alamatController.text,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TransaksiPage(
            customer: customer,
            nopol: _nopolController.text, // Pass nopol to TransaksiPage
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isi Data Diri'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nikController,
                decoration: InputDecoration(labelText: 'NIK'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan NIK';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan Nama';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _noTelephonController,
                decoration: InputDecoration(labelText: 'No. Telepon'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan No. Telepon';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan Alamat';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nopolController,
                decoration: InputDecoration(labelText: 'No. Polisi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan No. Polisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Lanjutkan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
