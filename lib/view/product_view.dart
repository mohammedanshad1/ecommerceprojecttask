import 'package:ecommerceproject/constants/app_typography.dart';
import 'package:ecommerceproject/utils/responsive.dart';
import 'package:ecommerceproject/view/product+details_view.dart';
import 'package:ecommerceproject/viewmodel/product_viewmodel.dart';
import 'package:ecommerceproject/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:get/get.dart';


class ProductViewScreen extends StatefulWidget {
  @override
  _ProductViewScreenState createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  final ProductViewModel productViewModel = Get.put(ProductViewModel());
  bool _isSnackbarShown = false; // Flag to show snackbar only once

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: AppTypography.outfitboldmainHead),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Obx(() {
        if (productViewModel.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!_isSnackbarShown && !productViewModel.isLoading.value && productViewModel.productList.isNotEmpty) {
          // Show the snackbar after the frame is built
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomSnackBar.show(
              context,
              snackBarType: SnackBarType.success,
              label: 'Data fetched successfully',
              bgColor: Colors.green,
            );
            _isSnackbarShown = true; // Update the flag to avoid showing it again
          });
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
                      'assets/icons/pngtree-no-image-available-icon-flatvector-illustration-pic-design-profile-vector-png-image_40966566.jpg', // Local fallback image
                      width: context.responsive.wp(20),
                    );
                  },
                ),
                title: Text(product.name, style: AppTypography.outfitMainTitle),
                subtitle: Text(product.description,
                    style: AppTypography.outfitRegular),
                trailing: Text('\$${product.price.toString()}',
                    style: AppTypography.outfitMedium),
                onTap: () {
                  // Navigate to ProductDetailsScreen when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(product: product),
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
