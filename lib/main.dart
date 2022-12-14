import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/great_place.dart';
import './screens/places_list_screen.dart';
import './screens/add_places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        
        ),
        home:const PlacesListScreen(),
        routes: {AddPlaces.routeName:(context)=> const AddPlaces()},
      ),
    );
  }
}
