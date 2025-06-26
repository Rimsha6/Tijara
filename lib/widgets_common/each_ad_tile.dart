import 'package:flutter/cupertino.dart';
import 'package:tijara/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:tijara/models/ad.dart';
import 'package:velocity_x/velocity_x.dart';

import '../consts/styles.dart';
//widget to display ads in a list when we search from or click on a category
class EachAdTile extends StatelessWidget {
  final AdModel ad;

  const EachAdTile({
    required this.ad,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFav = ad.isFavorite == true;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: screenHeight * 0.17,
          width: screenWidth,
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade200, blurRadius: 6, spreadRadius: 2)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                // Image Section
                SizedBox(
                  width: 140,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      ad.image[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Text Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.heightBox,
                      Text(ad.title,
                          style: const TextStyle(fontSize: 16, fontFamily: bold)),
                      Text(ad.price,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.green, fontFamily: medium)),
                      Text(ad.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade800,
                              fontFamily: medium)),
                      const SizedBox(height: 4),
                      Text(ad.location,
                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
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

        // Favorite Icon at Top-Right
        Positioned(
          top: 18,
          right: 10,
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : Colors.grey,
          ),
        ),
      ],
    );
  }
}
