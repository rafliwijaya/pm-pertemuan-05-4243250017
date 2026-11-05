import 'package:flutter/material.dart';
import 'tombol_favorit.dart';

class KartuMenu extends StatelessWidget {
  final String nama;
  final int harga;
  final String kategori;

  const KartuMenu({
    super.key,
    required this.nama,
    required this.harga,
    required this.kategori,
  });

  String get _hargaFormatted {
    return 'Rp ${harga.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: skema.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.restaurant_menu,
                color: skema.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: teks.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _hargaFormatted,
                    style: teks.bodyMedium?.copyWith(
                      color: skema.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Chip(
                    label: Text(kategori),
                    padding: EdgeInsets.zero,
                    labelStyle: teks.labelSmall,
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
            TombolFavorit(namaMenu: nama),
          ],
        ),
      ),
    );
  }
}