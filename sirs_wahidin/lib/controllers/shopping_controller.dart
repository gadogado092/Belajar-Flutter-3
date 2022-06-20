import 'package:get/get.dart';
import 'package:sirs_wahidin/models/product.dart';

class ShoppingController extends GetxController {
  List<Product> products = List<Product>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    var dummyData = [
      Product(
          id: 1,
          productName: "Susu",
          productImage: 'ada',
          productDescription: "Description Susu lorem ipsum",
          price: 1000),
      Product(
          id: 2,
          productName: "Teh",
          productImage: 'ada',
          productDescription: "Description Teh lorem ipsum",
          price: 1000),
      Product(
          id: 3,
          productName: "Kopi",
          productImage: 'ada',
          productDescription: "Description Kopi lorem ipsum",
          price: 1000),
      Product(
          id: 4,
          productName: "Milo",
          productImage: 'ada',
          productDescription: "Description Milo lorem ipsum",
          price: 1000)
    ];

    products.assignAll(dummyData);
  }
}
