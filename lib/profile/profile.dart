import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todotick/Assets/buttonNavigation.dart';
import 'package:todotick/loginRegister/login_screen.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.blue.withOpacity(0.5), BlendMode.color),
                ),
              ),
              height: 250,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 30,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Mas Gegen',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 4),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Edit Profile'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildListTile(Icons.email, 'Email', 'gegen@gmail.com'),
                    _buildListTile(Icons.info, 'FAQ', 'What can we help you with?'),
                    _buildListTile(Icons.language, 'Language', 'English'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), // Menambahkan jarak antara container dan tombol
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  navigator?.pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('Log Out'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Membuat tombol memenuhi lebar layar
                ),
              ),
            ),
            SizedBox(height: 16), // Menambahkan jarak di bawah tombol
          ],
        ),
      ),
      bottomNavigationBar: Buttonnavigation(),
    );
  }

  Widget _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
