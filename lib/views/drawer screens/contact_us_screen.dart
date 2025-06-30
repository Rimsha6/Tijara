
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/consts/colors.dart' show green, lightGrey, white;
import '../../core/consts/styles.dart';

class ContactUsScreen extends StatefulWidget{
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        backgroundColor: green,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon:Icon(Icons.arrow_back_rounded),color: white,),
        centerTitle: true,title: "Contact Us".text.color(white).fontFamily(medium).size(18).make(),),
      body: Column(
        children: [
          (screenHeight * 0.04).heightBox,
          Flexible(
            child: Container(
              color: white,
              child: ListTile(
                leading: Image.asset("Assets/logos/phone_icon.png"),
                title:
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: "Contact us through phone.\nDiscuss any problem regarding Tijara with us.".text.fontFamily(medium).size(14).make(),
                    ),
                onTap: () {
                },
              ),
            ),
          ),
          (screenHeight * 0.04).heightBox,
          Flexible(
            child: Container(
              color: white,
              child: ListTile(
                leading: Image.asset("Assets/logos/gmail_logo.png"),
                title:
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: "Contact us through Email.\nAsk our customer service experts anything.".text.fontFamily(medium).size(14).make(),
                    ),
                onTap: () {
                },
              ),
            ),
          ),
          (screenHeight * 0.04).heightBox,
          Flexible(
            child: Container(
              color: white,
              child: ListTile(
                leading: Image.asset("Assets/logos/chat_icon.png"),
                title:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: "Contact us through SMS.\nAsk our customer service experts anything.".text.fontFamily(medium).size(14).make(),
                ),
                onTap: () {
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}