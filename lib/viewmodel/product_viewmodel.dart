import 'package:ecommerceproject/model/product_model.dart';
import 'package:ecommerceproject/widgets/custom_snackbar.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductViewModel extends GetxController {
  var isLoading = false.obs;
  var productList = <Product>[].obs;
  var newArrivals = <Product>[].obs; 
  var trendingProducts = <Product>[].obs; 

  final Dio _dio = Dio();
  final String baseUrl = 'https://fake-store-api.mock.beeceptor.com/api/products';

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await _dio.get(baseUrl);

      if (response.statusCode == 200) {
        var data = response.data;
        productList.value = List<Product>.from(data.map((x) => Product.fromJson(x)));
        categorizeProducts(); 
      } else {
        _showErrorSnackBar('Failed to load products');
      }
    } catch (e) {
      _showErrorSnackBar('Error: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  void categorizeProducts() {
    newArrivals.value = productList.where((product) => product.availability).toList(); 
    trendingProducts.value = productList.where((product) => product.discount > 0).toList(); 
  }

  void _showErrorSnackBar(String message) {
    CustomSnackBar.show(
      Get.context!,
      snackBarType: SnackBarType.success,
      label: message,
      bgColor: Colors.redAccent,
    );
  }
}

