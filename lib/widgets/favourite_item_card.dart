import 'package:flutter/material.dart';
import 'fav_button.dart';

class FavouriteItemCard extends StatelessWidget {
  final Map<String, dynamic> userData;
  final double screenHeight;

  const FavouriteItemCard({
    super.key,
    required this.screenHeight,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final String imageUrl = userData['imageUrl'] ?? '';
    final String adId = userData['adId'] ?? '';
    final String productName = userData['productName'] ?? 'N/A';
    final String productPrice = userData['productPrice'] ?? 'N/A';
    final String contactNumber = userData['contactNumber'] ?? 'N/A';
    final String location = userData['location'] ?? 'N/A';

    return Container(
      padding: EdgeInsets.all(screenHeight * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: imageUrl.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.fill,
                        )
                      : null,
                  color: Colors.grey[300], // fallback background
                ),
                child: imageUrl.isEmpty
                    ? const Icon(Icons.image_not_supported, size: 40)
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName,
                        style:
                            const TextStyle(fontFamily: 'bold', fontSize: 16)),
                    Text(productPrice,
                        style:
                            const TextStyle(fontFamily: 'bold', fontSize: 15)),
                    SizedBox(height: screenHeight * 0.006),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.green, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          contactNumber,
                          style: const TextStyle(
                              fontFamily: 'medium',
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.006),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.green, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: const TextStyle(
                              fontFamily: 'medium',
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: adId.isNotEmpty
                ? FavoriteButton(adId: adId)
                : const SizedBox(), // prevent crash if adId is null
          ),
        ],
      ),
    );
  }
}
