import 'package:flutter/material.dart';
import 'Login.dart';
import 'Register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        elevation: 4, 
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.lightBlueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
  "Selamat Datang di News App!",
  style: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  textAlign: TextAlign.center,
),
const SizedBox(height: 10),
const Text(
  "Nikmati akses tanpa batas ke berita terbaru, informasi terkini, dan perkembangan global secara cepat dan mudah. Mulailah dengan login atau daftar untuk mendapatkan pengalaman berita terbaik.",
  style: TextStyle(
    fontSize: 16,
    color: Colors.black87,
    height: 1.5, 
  ),
  textAlign: TextAlign.center,
),
const SizedBox(height: 40),

              Center(
                child: Image.asset(
                  'images/news.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Berita Utama Hari Ini",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              newsPreview("Pembaruan Terbaru: Tren Ekonomi Global",
                  "Lihat perkembangan ekonomi terbaru yang berdampak pada berbagai sektor."),
              newsPreview("Perubahan Iklim: Tantangan dan Solusi",
                  "Bagaimana perubahan iklim mempengaruhi lingkungan dan kehidupan kita sehari-hari."),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget newsPreview(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.article, color: Colors.blueAccent, size: 40),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
