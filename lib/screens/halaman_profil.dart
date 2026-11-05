import 'package:flutter/material.dart';
import '../widgets/tombol_ikuti.dart';

class HalamanProfil extends StatelessWidget {
  final VoidCallback onGantiTema;
  final bool isDarkMode;

  const HalamanProfil({
    super.key,
    required this.onGantiTema,
    required this.isDarkMode,
  });

  void _tampilkanSnackBar(BuildContext context, String teks) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Disalin: $teks'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengembang'),
        actions: [
          IconButton(
            tooltip: isDarkMode ? 'Mode Terang' : 'Mode Gelap',
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: onGantiTema,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 56,
              backgroundColor: skema.primaryContainer,
              backgroundImage: const AssetImage('assets/images/profil.png'),
              onBackgroundImageError: (exception, stackTrace) {},
            ),
            const SizedBox(height: 16),
            Text('Muhammad Rafli Wijaya', style: teks.headlineSmall),
            Text(
              'Mahasiswa Ilmu Komputer · UNIMED',
              style: teks.bodyMedium?.copyWith(color: skema.onSurfaceVariant),
            ),
            const SizedBox(height: 16),
            const Wrap(
              spacing: 8,
              children: [
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text('UI/UX')),
              ],
            ),
            const SizedBox(height: 16),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text('rafli@gmail.com'),
                    subtitle: const Text('Ketuk untuk menyalin'),
                    onTap: () => _tampilkanSnackBar(context, 'rafli@gmail.com'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.phone_outlined),
                    title: const Text('+62 812-0000-0000'),
                    subtitle: const Text('Ketuk untuk menyalin'),
                    onTap: () => _tampilkanSnackBar(context, '+62 812-0000-0000'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.location_on_outlined),
                    title: const Text('Medan, Sumatera Utara'),
                    subtitle: const Text('Ketuk untuk menyalin'),
                    onTap: () => _tampilkanSnackBar(context, 'Medan, Sumatera Utara'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const TombolIkuti(),
          ],
        ),
      ),
    );
  }
}