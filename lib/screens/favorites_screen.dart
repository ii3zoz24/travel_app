import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrip;
  FavoritesScreen(this.favoriteTrip);

  @override
  Widget build(BuildContext context) {
    if (favoriteTrip.isEmpty) {
      return Center(
        child: Text('لا يوجد رحلات مفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            title: favoriteTrip[index].title,
            imageUrl: favoriteTrip[index].imageUrl,
            duration: favoriteTrip[index].duration,
            tripType: favoriteTrip[index].tripType,
            season: favoriteTrip[index].season,
            id: favoriteTrip[index].id,
          );
        },
        itemCount: favoriteTrip.length,
      );
    }
  }
}
