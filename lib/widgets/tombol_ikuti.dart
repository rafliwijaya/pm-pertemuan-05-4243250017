import 'package:flutter/material.dart';

class TombolIkuti extends StatefulWidget {
  const TombolIkuti({super.key});

  @override
  State<TombolIkuti> createState() => _TombolIkutiState();
}

class _TombolIkutiState extends State<TombolIkuti> {
  bool _diikuti = false;
  int _pengikut = 128;

  void _ubah() {
    setState(() {
      _diikuti = !_diikuti;
      _pengikut += _diikuti ? 1 : -1;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_diikuti ? 'Anda mengikuti Rafli' : 'Batal mengikuti'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$_pengikut pengikut'),
        const SizedBox(height: 8),
        _diikuti
            ? OutlinedButton.icon(
                onPressed: _ubah,
                icon: const Icon(Icons.check),
                label: const Text('Diikuti'),
              )
            : FilledButton.icon(
                onPressed: _ubah,
                icon: const Icon(Icons.person_add),
                label: const Text('Ikuti'),
              ),
      ],
    );
  }
}