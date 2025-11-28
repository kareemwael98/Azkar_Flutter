import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../theme.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int _counter = 0;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _incrementCounter() async {
    setState(() {
      _counter++;
      if (_counter >= 10000) {
        _counter = 0;
      }
    });

    // Play sound every 33 counts
    if (_counter % 33 == 0 && _counter != 0) {
      await _audioPlayer.play(AssetSource('sounds/click.mp3'));
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  /// Format the counter display using DSEG font convention
  /// "!" equals to empty digit space in DSEG font
  String _formatCounter() {
    if (_counter < 10) {
      return '!!!$_counter';
    } else if (_counter < 100) {
      return '!!$_counter';
    } else if (_counter < 1000) {
      return '!$_counter';
    } else {
      return '$_counter';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: AspectRatio(
              aspectRatio: 0.8, // Adjust based on sebha image aspect ratio
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Sebha (Tasbeeh) background image
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/sebha1.webp',
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Counter display
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: FractionallySizedBox(
                      heightFactor: 0.14,
                      widthFactor: 0.52,
                      alignment: const Alignment(0, -0.48),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          _formatCounter(),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                            fontFamily: 'DSEGClassic',
                            fontSize: 40,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Increase button (bottom center, large circular area)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: FractionallySizedBox(
                      widthFactor: 0.32,
                      alignment: const Alignment(0, 0.66),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: GestureDetector(
                          onTap: _incrementCounter,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withOpacity(0.14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Reset button (right side, smaller circular area)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: FractionallySizedBox(
                      widthFactor: 0.11,
                      alignment: const Alignment(0.56, 0.16),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: GestureDetector(
                          onTap: _resetCounter,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.white.withOpacity(0.2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
