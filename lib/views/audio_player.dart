import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerWidget extends StatefulWidget {
  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  String audioFilePath = 'assets/audio.mp3';

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    initAudioPlayer();
  }

  Future<void> initAudioPlayer() async {
    await audioPlayer.setAsset(audioFilePath);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio() async {
    await audioPlayer.play();
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Music"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: playAudio,
            child: const Text('Play'),
          ),
          TextButton(
            onPressed: pauseAudio,
            child: const Text('Pause'),
          ),
          TextButton(
            onPressed: stopAudio,
            child: const Text('back'),
          ),
        ],
      ),
    );
  }
}
