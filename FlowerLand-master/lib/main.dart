import 'dart:convert';
import 'package:flower_shop/data/category_data.dart';
import 'package:flower_shop/utils/colors.dart';
import 'package:flower_shop/view/home/home_screen.dart';
import 'package:flower_shop/view/home/widgets/CategoryPage.dart';
import 'package:flutter/material.dart';
import 'package:flower_shop/view/home/widgets/FavoritesCategoryPage.dart';
import 'package:flower_shop/view/home/widgets/FlowersCategoryPage.dart';
import 'package:flower_shop/view/home/widgets/BasketCategoryPage.dart';
import 'package:flower_shop/view/home/widgets/Signin.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'dart:io';

class AppState extends ChangeNotifier {
  // Define your app state variables here
  String currentPage = '/';


  // Method to update the state
  void updateCurrentPage(String page) {
    currentPage = page;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  Future<void> getLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData? locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // Handle if location service is not enabled by the user
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // Handle if location permission is not granted by the user
        return;
      }
    }

    locationData = await location.getLocation();
    // Use the location data as needed
    print('Latitude: ${locationData.latitude}');
    print('Longitude: ${locationData.longitude}');
  }


  @override
  Widget build(BuildContext context) {
    // Access the app state using Provider.of<AppState>(context)
    final appState = Provider.of<AppState>(context);

    return MaterialApp(



      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kbgClr,
        primarySwatch: Colors.blue,
      ),
      initialRoute: appState.currentPage, // Set the initial route to the current page
      routes: {
        '/': (context) => HomeScreen(), // Default route
        '/category': (context) => CategoryPage(),
        '/flowers': (context) => FlowersCategoryPage(),
        '/favorites': (context) => FavoritesCategoryPage(),
        '/basket': (context) => BasketCategoryPage(),
        '/SignOut': (context) => Signin(),
      },
      navigatorObservers: [
        // Observe navigation changes
        RouteObserver<PageRoute>(),
      ],
    );
  }
}
