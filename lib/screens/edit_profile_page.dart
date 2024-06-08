import 'package:flutter/material.dart';
import 'package:mobile_apps/models/logincustomers.dart';

class EditProfilePage extends StatefulWidget {
  final LoginCustomerModel customer;

  const EditProfilePage({Key? key, required this.customer}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.customer.name);
    _emailController = TextEditingController(text: widget.customer.email);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Simpan perubahan data profil
      final updatedCustomer = LoginCustomerModel(
        id: widget.customer.id,
        name: _nameController.text,
        email: _emailController.text,
        password: widget.customer.password, // Password tetap sama
      );

      // Kirim updatedCustomer ke backend atau simpan secara lokal

      Navigator.pop(context, updatedCustomer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan Nama';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Harap masukkan Email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Simpan Perubahan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
