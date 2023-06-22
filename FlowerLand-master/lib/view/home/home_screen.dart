import 'package:flower_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import 'widgets/category_card.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/product_section.dart';
import 'package:location/location.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flower_shop/view/home/widgets/Camera_screen.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(12.0),



          child: Column(children: [
            //appbar code
            const CustomAppBar(),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => _openCamera(context),
              child: Text('Open Camera'),

            ),
            //product Search Section
            TextFormField(
              cursorColor: kprimaryClr,
              decoration: InputDecoration(
                  fillColor: klightGrayClr,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Search Here...',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: kprimaryClr,
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            //category Section
            const CategoryCard(),

            const SizedBox(
              height: 15,
            ),
            //product Section
            ProductSection(),
          ]),

        ),
      ),
    );
  }
  Future<void> _openCamera(BuildContext context) async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraScreen(camera: camera),
      ),
    );
  }
}
