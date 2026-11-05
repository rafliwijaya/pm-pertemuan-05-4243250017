import 'package:flutter/material.dart';
import '../widgets/kartu_menu.dart';

class HalamanUmkm extends StatelessWidget {
  const HalamanUmkm({super.key});

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'RM Sinar Pagi',
                style: TextStyle(
                  color: skema.onPrimary,
                  fontWeight: FontWeight.bold,
                  shadows: const [Shadow(blurRadius: 8, color: Colors.black54)],
                ),
              ),
              background: Image.asset(
                'assets/images/soto.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: skema.primaryContainer,
                    child: Center(
                      child: Icon(
                        Icons.soup_kitchen,
                        size: 72,
                        color: skema.onPrimaryContainer,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Soto Medan Legendaris sejak 1962',
                    style: teks.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Menyajikan soto khas Medan dengan kuah santan gurih kental beraroma rempah jintan, kapulaga, dan serai yang autentik.',
                    style: teks.bodyMedium?.copyWith(color: skema.onSurfaceVariant),
                  ),
                  const SizedBox(height: 16),

                  Card(
                    elevation: 0,
                    color: skema.surfaceContainerHighest,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.location_on_outlined, color: skema.primary),
                          title: const Text('Jl. Sei Deli No. 2D, Silalas, Medan'),
                          subtitle: const Text('Medan Barat, Kota Medan'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: Icon(Icons.access_time, color: skema.primary),
                          title: const Text('Buka Setiap Hari: 07.00 – 16.00 WIB'),
                          subtitle: const Text('Cocok untuk sarapan & makan siang'),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: Icon(Icons.phone_outlined, color: skema.primary),
                          title: const Text('+62 61 6614442'),
                          subtitle: const Text('Layanan Pesanan & Meja'),
                          trailing: FilledButton.tonal(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Menghubungi RM Sinar Pagi...')),
                              );
                            },
                            child: const Text('Telepon'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // dftar menu
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Daftar Menu Favorit',
                        style: teks.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '4 Pilihan',
                        style: teks.bodySmall?.copyWith(color: skema.primary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const KartuMenu(
                    nama: 'Soto Daging Sapi',
                    harga: 38000,
                    kategori: 'Makanan Utama',
                  ),
                  const KartuMenu(
                    nama: 'Soto Ayam Kampung',
                    harga: 35000,
                    kategori: 'Makanan Utama',
                  ),
                  const KartuMenu(
                    nama: 'Perkedel Kentang Rempah',
                    harga: 6000,
                    kategori: 'Pelengkap',
                  ),
                  const KartuMenu(
                    nama: 'Es Jeruk Murni Medan',
                    harga: 8000,
                    kategori: 'Minuman Segar',
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fitur keranjang pesanan akan segera hadir!')),
          );
        },
        icon: const Icon(Icons.shopping_bag_outlined),
        label: const Text('Pesan Menu'),
      ),
    );
  }
}