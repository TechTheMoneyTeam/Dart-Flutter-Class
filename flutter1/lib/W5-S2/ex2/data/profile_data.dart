import 'package:flutter/material.dart';

import 'package:flutter1/W5-S2/ex2/model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
    name: "Ronan Ogor",
    position: "Flutter Developer",
    avatarUrl: 'assets/haha.png',
    tiles: [
      TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 789"),
      TileData(icon: Icons.location_on, title: "Address", value: "Cambodia"),
      TileData(
          icon: Icons.email, title: "Mail", value: "ronan.ogor@cadt.edu.kh"),
    ]);
