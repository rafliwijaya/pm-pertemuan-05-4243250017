import 'package:flutter/material.dart';
import 'screens/halaman_umkm.dart';
import 'screens/halaman_profil.dart';

void main() => runApp(const AplikasiUtama());

class AplikasiUtama extends StatefulWidget {
  const AplikasiUtama({super.key});

  @override
  State<AplikasiUtama> createState() => _AplikasiUtamaState();
}

class _AplikasiUtamaState extends State<AplikasiUtama> {
  ThemeMode _themeMode = ThemeMode.light;
  int _currentIndex = 0;

  void _gantiTema() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Daftar halaman navigasi
    final List<Widget> halaman = [
      const HalamanUmkm(),
      HalamanProfil(
        onGantiTema: _gantiTema,
        isDarkMode: _themeMode == ThemeMode.dark,
      ),
    ];

    return MaterialApp(
      title: 'Kuliner Medan - RM Sinar Pagi',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD35400), // Warna rempah khas soto
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD35400),
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: halaman[_currentIndex],
        // Material 3 NavigationBar
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.storefront_outlined),
              selectedIcon: Icon(Icons.storefront),
              label: 'Menu UMKM',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profil Pengembang',
            ),
          ],
        ),
      ),
    );
  }
}