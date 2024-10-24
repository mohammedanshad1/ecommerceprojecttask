import 'package:ecommerceproject/constants/app_typography.dart';
import 'package:ecommerceproject/model/product_model.dart';
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
  bool _isSnackbarShown = false;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = context.responsive;

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

        if (!_isSnackbarShown &&
            !productViewModel.isLoading.value &&
            productViewModel.productList.isNotEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomSnackBar.show(
              context,
              snackBarType: SnackBarType.success,
              label: 'Data fetched successfully',
              bgColor: Colors.green,
            );
            _isSnackbarShown = true;
          });
        }

        if (productViewModel.productList.isEmpty) {
          return const Center(
            child: Text('No products available',
                style: AppTypography.outfitRegular),
          );
        }

        return ListView(
          padding: EdgeInsets.symmetric(vertical: responsive.hp(2.0)),
          children: [
            _buildProductSection(
                'New Arrivals', productViewModel.newArrivals, responsive),
            SizedBox(height: responsive.hp(2.0)),
            _buildProductSection('Trending Products',
                productViewModel.trendingProducts, responsive),
          ],
        );
      }),
    );
  }

  Widget _buildProductSection(
      String title, RxList<Product> products, Responsive responsive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: responsive.wp(4.0), vertical: responsive.hp(1.0)),
          child: Text(title, style: AppTypography.outfitMainTitle),
        ),
        SizedBox(
          height: responsive.hp(25.0), 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.wp(2.0)),
                child: Card(
                  elevation: 4, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        responsive.wp(2.0)),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ProductDetailsScreen(product: product),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin =
                                Offset(1.0, 0.0);
                            const end =
                                Offset.zero; 
                            const curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: responsive.wp(40.0), 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(responsive.wp(2.0)),
                        color: Colors.white, 
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(responsive.wp(2.0)),
                              topRight: Radius.circular(responsive.wp(2.0)),
                            ),
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                              height: responsive
                                  .hp(15.0), 
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/icons/pngtree-no-image-available-icon-flatvector-illustration-pic-design-profile-vector-png-image_40966566.jpg',
                                  fit: BoxFit.cover,
                                  height: responsive.hp(
                                      15.0), 
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(responsive.wp(2.0)),
                            child: Text(
                              product.name,
                              style: AppTypography.outfitMainTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: responsive.wp(2.0)),
                            child: Text('\$${product.price.toString()}',
                                style: AppTypography.outfitMedium),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
