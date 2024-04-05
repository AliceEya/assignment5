import 'package:eya_assignment5/screens/audio_list.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyFavSong());
}

class MyFavSong extends StatelessWidget {
  const MyFavSong({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AudioListScreen(),
    );
  }
}
