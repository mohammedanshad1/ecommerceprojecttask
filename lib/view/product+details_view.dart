import 'package:ecommerceproject/constants/app_typography.dart';
import 'package:ecommerceproject/model/product_model.dart';
import 'package:ecommerceproject/utils/responsive.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  Future<Product> _fetchProductDetails() async {
    await Future.delayed(const Duration(seconds: 2));
    return product; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details',
            style: AppTypography.outfitboldmainHead),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: FutureBuilder<Product>(
        future: _fetchProductDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No product data available'));
          }

          final product = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(context.responsive.wp(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(context.responsive.wp(5)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: product.image.isNotEmpty
                            ? Image.network(
                                product.image,
                                width: context.responsive.wp(50),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/icons/pngtree-no-image-available-icon-flatvector-illustration-pic-design-profile-vector-png-image_40966566.jpg',
                                    width: context.responsive.wp(50),
                                    fit: BoxFit.cover,
                                  );
                                },
                              )
                            : Image.asset(
                                'assets/icons/pngtree-no-image-available-icon-flatvector-illustration-pic-design-profile-vector-png-image_40966566.jpg',
                                width: context.responsive.wp(50),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),

                  SizedBox(height: context.responsive.hp(3)),

                  Text(
                    product.name,
                    style: AppTypography.outfitMainTitle.copyWith(
                      fontSize: context.responsive.hp(3),
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: context.responsive.hp(1)),

                  Text(
                    product.description,
                    style: AppTypography.outfitRegular.copyWith(
                      color: Colors.black54,
                      fontSize: context.responsive.hp(2),
                    ),
                  ),
                  SizedBox(height: context.responsive.hp(2)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price: \$${product.price.toString()}',
                        style: AppTypography.outfitMedium.copyWith(
                          fontSize: context.responsive.hp(2.5),
                          fontWeight: FontWeight.w600,
                          color: Colors.teal,
                        ),
                      ),
                      if (product.discount > 0)
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: context.responsive.hp(0.5),
                            horizontal: context.responsive.wp(2),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${product.discount}% OFF',
                            style: AppTypography.outfitMedium.copyWith(
                              color: Colors.white,
                              fontSize: context.responsive.hp(2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: context.responsive.hp(2)),

                  Text(
                    'Category: ${product.category}',
                    style: AppTypography.outfitRegular.copyWith(
                      fontSize: context.responsive.hp(2),
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: context.responsive.hp(1)),
                  Text(
                    'Brand: ${product.brand}',
                    style: AppTypography.outfitRegular.copyWith(
                      fontSize: context.responsive.hp(2),
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: context.responsive.hp(4)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
