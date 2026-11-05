import 'package:flutter/material.dart';

class TombolFavorit extends StatefulWidget {
  final String namaMenu;

  const TombolFavorit({super.key, required this.namaMenu});

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool _isFavorit = false;

  void _toggleFavorit() {
    setState(() {
      _isFavorit = !_isFavorit;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorit
              ? '${widget.namaMenu} ditambahkan ke favorit'
              : '${widget.namaMenu} dihapus dari favorit',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;

    return IconButton(
      tooltip: _isFavorit ? 'Hapus dari favorit' : 'Tambah ke favorit',
      icon: Icon(
        _isFavorit ? Icons.favorite : Icons.favorite_border,
        color: _isFavorit ? skema.error : skema.onSurfaceVariant,
      ),
      onPressed: _toggleFavorit,
    );
  }
}