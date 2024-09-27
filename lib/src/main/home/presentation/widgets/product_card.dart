import 'package:flutter/material.dart';

import '../../../../core/commons/widgets/space_widget.dart';
import '../../../../core/constants/colors.dart';

import '../../data/models/product.model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel data;
  final VoidCallback onCartButton;

  const ProductCard({
    super.key,
    required this.data,
    required this.onCartButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        color: Colors.white, // Menambahkan warna dasar untuk card
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.card),
          borderRadius: BorderRadius.circular(19),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Warna shadow
            spreadRadius: 0.1, // Jarak penyebaran shadow
            blurRadius: 1.5, // Jarak blur shadow
            offset: const Offset(0, 1), // Posisi shadow (x, y)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.disabled.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blueLight
                      .withOpacity(0.3), // Warna shadow gambar
                  spreadRadius: 1, // Jarak penyebaran shadow
                  blurRadius: 1, // Jarak blur shadow
                  offset: const Offset(0, 1), // Posisi shadow (x, y)
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: Image.asset(
                data.image,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Spacer(),
          Text(
            data.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SpaceHeight(8.0),
          Text(
            data.category.value,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
            ),
          ),
          const SpaceHeight(8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  data.priceFormat,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onCartButton,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    color: AppColors.primary,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
