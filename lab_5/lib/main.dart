import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  late final AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> playSound(int soundNumber) async {
    try {
      await player.play(AssetSource('note$soundNumber.wav'));
    } catch (e) {
      debugPrint("❌ Lỗi khi phát âm thanh: $e");
    }
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: color,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: () => playSound(soundNumber),
        child: const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(7, (index) {
              return buildKey(
                color: Colors.primaries[index],
                soundNumber: index + 1,
              );
            }),
          ),
        ),
      ),
    );
  }
}
