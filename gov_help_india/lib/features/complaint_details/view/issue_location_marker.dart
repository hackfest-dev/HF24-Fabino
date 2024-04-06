import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gov_help_india/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';

class IssueLocationMarker extends StatelessWidget {
  const IssueLocationMarker({super.key});


  @override
  Widget build(BuildContext context) {
    final _storage  = GetStorage();
    final location = _storage.read("location");
    return FlutterMap(
      options:  MapOptions(
        minZoom: 3,
        initialCenter: LatLng(location["latitude"], location["longitude"]),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(location["latitude"], location["longitude"]), // Same as initial center
              width: 80.0,
              height: 80.0,
              child: Icon(Iconsax.location5, color: TColors.primary,),
            ),
          ],
        ),
      ],
    );
  }
}
