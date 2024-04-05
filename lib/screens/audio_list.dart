import 'package:eya_assignment5/components/happyending.dart';
import 'package:eya_assignment5/components/heaven.dart';
import 'package:eya_assignment5/components/night_changes.dart';
import 'package:eya_assignment5/components/paramore.dart';
import 'package:eya_assignment5/components/scientist.dart';
import 'package:flutter/material.dart';

class AudioListScreen extends StatelessWidget {
  const AudioListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Playlist"),
        centerTitle: true,
      ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Card(
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OneDirection())),
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset('assets/images/1d.jpg'),
                ),
                title: Text("Night Changes"),
                subtitle: Text("by: One Direction"),
              ),
            ),
          ),

           Card(
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AvrilLavigne())),
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset('assets/images/avril.jpg'),
                ),
                title: Text("My Happy Ending"),
                subtitle: Text("by: Avril Lavigne"),
              ),
            ),
          ),

           Card(
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OrangeLemon())),
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset('assets/images/lemon.jpg'),
                ),
                title: Text("Heaven Knows"),
                subtitle: Text("by: Orange and Lemon"),
              ),
            ),
          ),

          Card(
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Paramore())),
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset('assets/images/para.jpg'),
                ),
                title: Text("The Only Exception"),
                subtitle: Text("by: Paramore"),
              ),
            ),
          ),

         Card(
            child: InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => Coldplay())),
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.asset('assets/images/cold.jpg'),
                ),
                title: Text("Scientist"),
                subtitle: Text("by: Coldplay"),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}