import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flower_shop/model/product_model.dart';
class ProductModel {
  final String image, title, price, category, desc;

  ProductModel(
      {required this.image,
        required this.title,
        required this.price,
        required this.category,
        required this.desc});

  static Future<List<ProductModel>> fetchProductData() async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/DemetMemish/jsondata/main/data.json'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => ProductModel(
        image: item['image'],
        title: item['title'],
        price: item['price'],
        category: item['category'],
        desc: item['desc'],
      )).toList();
    } else {
      throw Exception('Failed to load product data');
    }
  }
}

