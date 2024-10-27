import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BeritaPage(),
    const KategoriPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? 'Berita Terkini' : _selectedIndex == 1 ? 'Kategori' : 'Profil Pengguna',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.withOpacity(0.8),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _searchNews(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              _showNotifications(context);
            },
          ),
        ],
        elevation: 5.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/profile.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'News Reader',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Berita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _searchNews(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Search News"),
          content: const Text("Masukkan kata kunci berita yang ingin dicari."),
          actions: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: 'Keyword',
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Search"),
            ),
          ],
        );
      },
    );
  }

  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Notifications"),
          content: const Text("Tidak ada notifikasi berita baru."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildNewsCard(
          context,
          imageUrl: 'assets/images/teknologi.jpg',
          title: 'Kabar Terbaru Seputar Teknologi',
          description: 'Perkembangan teknologi AI semakin pesat.',
        ),
        const SizedBox(height: 10),
        _buildNewsCard(
          context,
          imageUrl: 'assets/images/ekonomi.jpeg',
          title: 'Update Situasi Ekonomi Global',
          description: 'Pasar saham mengalami fluktuasi signifikan.',
        ),
        const SizedBox(height: 10),
        _buildNewsCard(
          context,
          imageUrl: 'assets/images/olimpiade.jpeg',
          title: 'Olahraga: Persiapan Olimpiade',
          description: 'Atlet dari berbagai negara bersiap untuk Olimpiade.',
        ),
        const SizedBox(height: 10),
        _buildNewsCard(
          context,
          imageUrl: 'assets/images/global.jpeg',
          title: 'Lingkungan: Menjaga Bumi dari Pemanasan Global',
          description: 'Langkah penting untuk melindungi lingkungan.',
        ),
      ],
    );
  }

  Widget _buildNewsCard(BuildContext context, {required String imageUrl, required String title, required String description}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailBeritaPage(
              imageUrl: imageUrl,
              title: title,
              description: description,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class DetailBeritaPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const DetailBeritaPage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue.withOpacity(0.8),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Konten Lengkap:',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          _buildCategoryCard(
            icon: Icons.public,
            title: 'Global News',
            color: Colors.blueAccent,
          ),
          _buildCategoryCard(
            icon: Icons.sports_soccer,
            title: 'Sports',
            color: Colors.green,
          ),
          _buildCategoryCard(
            icon: Icons.business,
            title: 'Business',
            color: Colors.orange,
          ),
          _buildCategoryCard(
            icon: Icons.science,
            title: 'Science',
            color: Colors.purple,
          ),
          _buildCategoryCard(
            icon: Icons.health_and_safety,
            title: 'Health',
            color: Colors.redAccent,
          ),
          _buildCategoryCard(
            icon: Icons.movie,
            title: 'Entertainment',
            color: Colors.indigo,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({IconData? icon, String? title, Color? color}) => Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            // Navigasi kategori tertentu
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 50, color: color),
              const SizedBox(height: 10),
              Text(
                title!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Adam Fathurrohman Arya Bakti',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Adamfathurrohman@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implementasi navigasi ke halaman edit profil
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Warna tombol
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Sudut tombol
                  ),
                ),
                child: const Text(
                  'Edit Profil',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informasi Tambahan',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text('Bio: Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                      const SizedBox(height: 5),
                      const Text('Bergabung: Januari 2024'),
                      const SizedBox(height: 5),
                      const Text('Jumlah Artikel: 15'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
