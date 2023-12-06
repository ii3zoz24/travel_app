import 'package:flutter/material.dart';
//import 'package:travel_app/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRoute = '/category-page';

  final List<Trip> avalibleTrips;

  CategoryTripsScreen(this.avalibleTrips);

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['title'];
    final filtredTrips = avalibleTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            title: filtredTrips[index].title,
            imageUrl: filtredTrips[index].imageUrl,
            duration: filtredTrips[index].duration,
            tripType: filtredTrips[index].tripType,
            season: filtredTrips[index].season,
            id: filtredTrips[index].id,
          );
        },
        itemCount: filtredTrips.length,
      ),
    );
  }
}
