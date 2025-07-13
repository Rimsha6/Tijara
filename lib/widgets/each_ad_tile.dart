import 'package:flutter/material.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/consts/styles.dart';
import '../core/models/post_ad_model.dart';

class EachAdTile extends StatelessWidget {
  final PostAdModel ad;
  const EachAdTile({
    required this.ad,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: screenWidth,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 6,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                SizedBox(
                  width: 140,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: (ad.imageUrl != null && ad.imageUrl!.isNotEmpty)
                        ? Image.network(
                            ad.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.broken_image),
                          )
                        : const Icon(Icons.image_not_supported),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.heightBox,
                      Text(ad.productName ?? "No Title",
                          style:
                              const TextStyle(fontSize: 16, fontFamily: bold)),
                      Text(ad.productPrice ?? "No Price",
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                              fontFamily: medium)),
                      Text(ad.description ?? "No description available",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade800,
                              fontFamily: medium)),
                      const SizedBox(height: 4),
                      Text(ad.location ?? "Unknown",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                      10.heightBox,
                      Row(
                        children: [
                          const Icon(Icons.remove_red_eye,
                              size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text('${ad.views ?? 0}',
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Favorite Icon
        const Positioned(
          top: 18,
          right: 10,
          child: Icon(Icons.favorite_border, color: Colors.grey),
        ),
      ],
    );
  }
}
