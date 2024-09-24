import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.03,
    required this.onPress,
    required this.title,
    required this.productImageUrl,
    required this.price,
  });

  final double width, aspectRetio;
  final String title;
  final String productImageUrl;
  final VoidCallback onPress;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 229, 228, 228),
          ),
          borderRadius: BorderRadius.circular(10)),
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.03,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF979797).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: productImageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ $price',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF7643),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
