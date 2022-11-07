import 'package:flutter/material.dart';
import 'package:native_features/providers/great_place.dart';
import 'package:provider/provider.dart';
import '../screens/add_places.dart';
import '../providers/great_place.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaces.routeName);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Consumer<GreatPlaces>(
          child: const Center(
            child: Text('No Data, Add some data ..!'),
          ),
          builder: (ctx, greatPlaces, ch) => greatPlaces.places.isEmpty
              ? ch!
              : ListView.builder(
                  itemCount: greatPlaces.places.length,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                        backgroundImage: FileImage(
                      greatPlaces.places[i].image!,
                    )),
                    title: Text(greatPlaces.places[i].title!),
                  ),
                ),
        ));
  }
}
