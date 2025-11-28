import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../theme.dart';
import '../data/azkar_data.dart';
import '../models/zekr.dart';

class AzkarScreen extends StatefulWidget {
  final AzkarType type;

  const AzkarScreen({super.key, required this.type});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  late List<Zekr> _azkar;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _azkar = AzkarData.getData(widget.type);
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _onZekrTap(int index) async {
    if (_azkar[index].count > 1) {
      setState(() {
        _azkar[index].count--;
      });
      _showSnackBar('${AppStrings.remaining} ${_azkar[index].count}');
    } else {
      // Play sound when zekr is completed
      await _audioPlayer.play(AssetSource('sounds/click.mp3'));
      
      setState(() {
        _azkar.removeAt(index);
      });
      _showSnackBar(AppStrings.finished);

      // Close screen if all azkar are completed
      if (_azkar.isEmpty) {
        if (mounted) {
          Navigator.pop(context);
        }
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        duration: const Duration(milliseconds: 1000),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 100,
          right: 100,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.greenLight,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: ListView.builder(
              itemCount: _azkar.length,
              itemBuilder: (context, index) {
                return _ZekrItem(
                  zekr: _azkar[index],
                  onTap: () => _onZekrTap(index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ZekrItem extends StatelessWidget {
  final Zekr zekr;
  final VoidCallback onTap;

  const _ZekrItem({
    required this.zekr,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          splashColor: const Color(0x95E6A700),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.beige,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              zekr.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
