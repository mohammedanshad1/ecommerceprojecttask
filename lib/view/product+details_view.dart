import 'package:ecommerceproject/constants/app_typography.dart';
import 'package:ecommerceproject/model/product_model.dart';
import 'package:ecommerceproject/utils/responsive.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details',
            style: AppTypography.outfitboldmainHead),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.responsive.wp(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image with Rounded Container and Shadow
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
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
                    child: product
                            .image.isNotEmpty // Check if image URL is not empty
                        ? Image.network(
                            product.image,
                            width: context.responsive.wp(50),
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/icons/pngtree-no-image-available-icon-flatvector-illustration-pic-design-profile-vector-png-image_40966566.jpg',
                                width: context.responsive.wp(50),
                              );
                            },
                          )
                        : Image.asset(
                            'assets/icons/pngtree-no-image-available-icon-flatvector-illustration-pic-design-profile-vector-png-image_40966566.jpg',
                            width: context.responsive.wp(50),
                          ),
                  ),
                ),
              ),
              SizedBox(height: context.responsive.hp(3)),

              // Product Name
              Text(
                product.name,
                style: AppTypography.outfitMainTitle.copyWith(
                  fontSize: context.responsive.hp(3),
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: context.responsive.hp(1)),

              // Product Description
              Text(
                product.description,
                style: AppTypography.outfitRegular.copyWith(
                  color: Colors.black54,
                  fontSize: context.responsive.hp(2),
                ),
              ),
              SizedBox(height: context.responsive.hp(2)),

              // Price and Discount in a Row
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

              // Category and Brand Information
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
      ),
    );
  }
}
