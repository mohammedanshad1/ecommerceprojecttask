import 'package:ecommerceproject/constants/app_typography.dart';
import 'package:ecommerceproject/utils/responsive.dart';
import 'package:ecommerceproject/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

main() {
  runApp(MaterialApp(
    home: ProductViewScreen(),debugShowCheckedModeBanner: false,
  ));
}

class ProductViewScreen extends StatelessWidget {
  final ProductViewModel productViewModel = Get.put(ProductViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Product List', style: AppTypography.outfitboldmainHead),
      ),
      body: Obx(() {
        if (productViewModel.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productViewModel.productList.isEmpty) {
          return const Center(
              child: Text('No products available',
                  style: AppTypography.outfitRegular));
        }

        return ListView.builder(
          itemCount: productViewModel.productList.length,
          itemBuilder: (context, index) {
            final product = productViewModel.productList[index];
            return Card(
              margin: EdgeInsets.all(context.responsive.wp(5)),
              child: ListTile(
                leading: Image.network(
  product.image, // Replace with your dynamic URL
  width: context.responsive.wp(20),
  errorBuilder: (context, error, stackTrace) {
    return Image.asset(
      'assets/icons/pngtree-no-image-available-icon-flatvector-illustration-pic-design-profile-vector-png-image_40966566.jpg', // Your local fallback image
      width: context.responsive.wp(20),
    );
  },
),

                title: Text(product.name, style: AppTypography.outfitMainTitle),
                subtitle: Text(product.description,
                    style: AppTypography.outfitRegular),
                trailing: Text('\$${product.price.toString()}',
                    style: AppTypography.outfitMedium),
              ),
            );
          },
        );
      }),
    );
  }
}
