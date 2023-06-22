import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/category_data.dart';
import '../../../main.dart';
import '../../../utils/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return SizedBox(
      height: 42,
      child: ListView.builder(
        itemCount: categoryData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () {
              if (categoryData[index].title == 'Categories') {
                Navigator.pushNamed(context, '/category');
                Provider.of<AppState>(context, listen: false).updateCurrentPage('/Categories');
                // Navigate to the "Trening" category page
              }
              if (categoryData[index].title == 'Flowers') {
                Navigator.pushNamed(context, '/flowers'); // Navigate to the "Trening" category page
                Provider.of<AppState>(context, listen: false).updateCurrentPage('/Flowers');
              }
              if (categoryData[index].title == 'Favorites') {
                Navigator.pushNamed(context, '/favorites'); // Navigate to the "Trening" category page
                Provider.of<AppState>(context, listen: false).updateCurrentPage('/Favorites');
              }
              if (categoryData[index].title == 'Basket') {
                Navigator.pushNamed(context, '/basket'); // Navigate to the "Trening" category page
                Provider.of<AppState>(context, listen: false).updateCurrentPage('/Basket');
              }
              if(categoryData[index].title == "SignOut"){
                Navigator.pushNamed(context, '/SignOut');
                Provider.of<AppState>(context, listen: false).updateCurrentPage('/SignIn');
              }
            },
            child: Container(
              width: 125,
              decoration: BoxDecoration(
                color: categoryData[index].active
                    ? kprimaryClr
                    : klightGrayClr,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    categoryData[index].icon,
                    color: categoryData[index].active ? kwhiteClr : kblackClr,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    categoryData[index].title,
                    style: TextStyle(
                      color: categoryData[index].active ? kwhiteClr : kblackClr,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
