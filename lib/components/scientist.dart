import 'package:audioplayers/audioplayers.dart';
import 'package:eya_assignment5/utils.dart';
import 'package:flutter/material.dart';

class AudioInfo extends StatelessWidget {
  const AudioInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return
   Column(  
          children: [
            Image.asset(
              'assets/images/cold.jpg',
              width: 250,
            ),
            const SizedBox(height: 30),
            const Text(
              'Scientist',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              'Coldplay',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ], 
        );
  }
}

class Coldplay extends StatefulWidget {
  const Coldplay({super.key});

  @override
  State<Coldplay> createState() => _ColdplayState();
}

class _ColdplayState extends State<Coldplay> {
  
  bool isPlaying = false;
  
  late final AudioPlayer player;
  late final AssetSource path;

  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    
    player = AudioPlayer();
    path = AssetSource('audio/scientist.mp3');

    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });
    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });
    player.onPlayerComplete.listen((_) {
      setState(() => _position = _duration);
    });
  }

  void playPause() async {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.play(path);
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 179, 146, 237),
      ), 
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/bg.png'),
        opacity: 0.5,
         fit: BoxFit.fill,
      ),
              ), 
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              const AudioInfo(),
              const SizedBox(height: 50),
              Slider(
                value: _position.inSeconds.toDouble(),
                onChanged: (value) async {
                  await player.seek(Duration(seconds: value.toInt()));
                  setState(() {});
                },
                min: 0,
                max: _duration.inSeconds.toDouble(),
                inactiveColor: Colors.grey,
                activeColor: Colors.red,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(_duration.format()),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      player.seek(Duration(seconds: _position.inSeconds - 10));
                      setState(() {});
                    },
                    child: Icon(Icons.fast_rewind),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: playPause,
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_circle,
                      color: Colors.red,
                      size: 50,
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      player.seek(Duration(seconds: _position.inSeconds + 10));
                      setState(() {});
                    },
                    child:  Icon(Icons.fast_forward),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
