import 'package:flutter/material.dart';
import 'package:flutter1/W5-S2/ex2/data/profile_data.dart';
import 'package:flutter1/W5-S2/ex2/data/profile_tile.dart';
import 'package:flutter1/W5-S2/ex2/model/profile_tile_model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(
      profile: ronanProfile,
    ),
  ));
}

const Color mainColor = Color(0xff5E9FCD);

class ProfileApp extends StatelessWidget {
  final ProfileData profile;

  const ProfileApp({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor.withAlpha(100),
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(profile.avatarUrl),
            ),
            SizedBox(height: 20),
            Text(
              profile.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: mainColor,
              ),
            ),
            Text(
              profile.position,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: profile.tiles.length,
              itemBuilder: (context, index) {
                final tile = profile.tiles[index];
                return ProfileTile(
                  icon: tile.icon,
                  title: tile.title,
                  data: tile.value,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
