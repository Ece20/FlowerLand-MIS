import 'package:flutter/material.dart';
import 'package:flower_shop/data/product_data.dart';
import 'package:flower_shop/model/product_model.dart';
import 'package:flower_shop/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../data/categorypage_data.dart';
import '../../../main.dart';
import '../../../model/categorypage_model.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Page: ${appState.currentPage}'),
        backgroundColor: Colors.green,
      ),
      body: AlignedGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: categoryData.length,
        itemBuilder: (context, index) {
          CategoryPageModel category = categoryData[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the selected category page
              Navigator.pushNamed(context, '/${category.title}');
            },
            child: Container(
              decoration: BoxDecoration(
                color: klightGrayClr,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      category.image,
                      height: 200,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      category.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Go back to the previous screen
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}