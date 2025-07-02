import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/consts/colors.dart';
import '../core/consts/styles.dart';

class FavouriteItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final double screenHeight;

  const FavouriteItemCard({
    super.key,
    required this.item,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenHeight * 0.01),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item['image'],
                  height: 110,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title'],
                        style: const TextStyle(fontFamily: bold, fontSize: 16)),
                    if (item.containsKey('price')) ...[
                      SizedBox(height: 4),
                      Text(item['price'],
                          style: const TextStyle(fontFamily: bold, fontSize: 15)),
                    ],
                    SizedBox(height: screenHeight * 0.006),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: green, size: 14),
                        SizedBox(width: 4),
                        Text(item['contact'], style:  TextStyle(fontFamily: medium,fontSize: 12,color: fontGrey),),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.006),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: green, size: 14),
                        SizedBox(width: 4),
                        Text(item['location'], style:  TextStyle(fontFamily: medium,fontSize: 12,color: fontGrey)),
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
            child: Icon(
              item['isFavourite'] ? Icons.favorite : Icons.favorite_border,
              color: item['isFavourite'] ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
