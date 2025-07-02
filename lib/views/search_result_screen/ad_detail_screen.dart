import 'package:flutter/material.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/widgets/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/models/ad.dart';

class AdDetailScreen extends StatelessWidget{
  final AdModel ad;
   const AdDetailScreen(
  {required this.ad,
    Key? key,}): super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: green,
        title: "Ad Detail".text.fontFamily(medium).color(white).make(),
        centerTitle: true,
        leading: BackButton(
          color: white,
        ),
      ),
      body: Padding(padding: EdgeInsets.symmetric(
        horizontal: 6,vertical: 6
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
             children:  [
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => SizedBox(width: 10),
                    itemCount: ad.image.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          ad.image[index],
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
               Positioned(
                 top: 12,
                 right: 10,
                 child: Icon(
                   (ad.isFavorite ?? false) ? Icons.favorite : Icons.favorite_border,
                   color: (ad.isFavorite ?? false) ? Colors.red : Colors.grey,
                 ),
               ),
             ],
            ),
            const SizedBox(height: 16),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      "Category:".text.fontFamily(medium).color(Colors.grey.shade600).size(16).make(),
                      const SizedBox(width: 6),
                      ad.category.text.fontFamily(medium).color(darkFontGrey).size(16).make(),

                    ],
                  ),
                  Row(
                    children: [
                      Text('Views:', style: const TextStyle(fontSize: 14)),
                      const SizedBox(width: 6),
                      const Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('${ad.views ?? 0}', style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: screenWidth,
              height: screenHeight*0.10,
              color: white,
              child:
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  //  const SizedBox(height: 8),
                    Text(ad.title,
                      style: const TextStyle(fontSize: 20, fontFamily: bold),
                    ),
                    const SizedBox(height: 5),
                    Text(ad.price,
                      style: const TextStyle(fontSize: 18, color: Colors.green, fontFamily: medium),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on, size: 18, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          ad.location,
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Description
            Container(
              color: white,
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     "Deatils",
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade800, fontFamily: bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      ad.description,
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade800, fontFamily: medium),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              color: white,
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Contact",
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade800, fontFamily: bold),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${ad.contact}',
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade800, fontFamily: medium),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade800, fontFamily: bold),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${ad.location}',
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade800, fontFamily: medium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                color: white,
                width: screenWidth,
                height: screenHeight *0.20,
                child: ClipRRect(
                  child: Image.asset("Assets/images/maps.jpeg",
                  height: screenHeight * 0.20,
                    width:screenWidth,
                    fit: BoxFit.cover,),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Seller Profile ",
                  style: TextStyle(fontSize: 16, color: darkFontGrey, fontFamily: bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Description
            Container(
              color: white,
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("Assets/images/profile_img.jpeg"),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hattan Saud Aziz",
                            style: TextStyle(fontSize: 16, color: green, fontFamily: medium),
                          ),
                          Text(
                            "User Id: " + "90678945",
                            style: TextStyle(fontSize: 16, color: Colors.grey.shade500, fontFamily: medium),
                          ),
                          Text(
                            "Ad Id: " + "90678945",
                            style: TextStyle(fontSize: 16, color: Colors.grey.shade500, fontFamily: medium),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customButton(width: screenWidth * 0.44,
                      height: screenHeight * 0.05,title: "Message Seller",
                      color: green,textColor: white,onPressed: (){}),
                  const SizedBox(width: 15),
                  customButton(width: screenWidth * 0.44,
                      height: screenHeight * 0.05,title: "Call Seller",
                      color: green,textColor: white,onPressed: (){}),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      ),
    );
  }
}
