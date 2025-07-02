import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tijara/views/auth_screens/signin_screen/signin_screen.dart';
import 'package:tijara/views/auth_screens/signup_screen/signup_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../core/consts/colors.dart';
import '../../../core/consts/styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/customt_textfield.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) {
        return SignUpProvider();
      },
      child: Consumer<SignUpProvider>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: white,
            body: SingleChildScrollView(
              child: SizedBox(
                height: screenHeight,
                child: Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "Assets/images/bg_image.png",
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 40,
                            left: 16,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {
                                Get.to(SigninScreen());
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.06,
                          screenHeight * 0.00,
                          screenWidth * 0.06,
                          screenHeight * 0.01,
                        ),
                        child: Text(
                          "Create Your Account ",
                          style: TextStyle(
                            fontSize: screenHeight * 0.020,
                            fontFamily: bold,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      (screenHeight * 0.02).heightBox,

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: 'Full Name',
                              preFixIcon: Icon(Icons.person_outlined),
                              onChanged: (value) {
                                model.appUser.userName = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your full name";
                                }
                                return null;
                              },
                            ),
                            (screenHeight * 0.02).heightBox,

                            CustomTextField(
                              hintText: 'Email',
                              preFixIcon: Icon(Icons.email_outlined),
                              onChanged: (value) {
                                model.appUser.userEmail = value;
                              },
                              validator: (value) {
                                final RegExp emailRegex = RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                                );
                                if (value == null || value.isEmpty) {
                                  return "Please enter your Email";
                                } else if (!emailRegex.hasMatch(value)) {
                                  return "Please enter a valid Email";
                                }
                                return null;
                              },
                            ),
                            (screenHeight * 0.02).heightBox,

                            CustomTextField(
                              hintText: 'Password',
                              obscureText: model.isVisiblePassword,
                              preFixIcon: const Icon(Icons.lock_open),
                              onChanged: (value) {
                                model.appUser.password = value;
                              },
                              suffixIcon: IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.white,
                                onPressed: model.togglePasswordVisibility,
                                icon:
                                    model.isVisiblePassword
                                        ? const Icon(
                                          Icons.visibility_off,
                                          size: 20,
                                          color: Colors.grey,
                                        )
                                        : const Icon(
                                          Icons.visibility,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '  Please enter password';
                                }
                                return null;
                              },
                            ),
                            (screenHeight * 0.02).heightBox,

                            CustomTextField(
                              hintText: 'Confirm Password',
                              obscureText: model.isVisiblePassword,
                              preFixIcon: const Icon(Icons.lock_open),
                              onChanged: (value) {
                                model.confirmPassword = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '  Confirm your password';
                                }
                                if (value != model.appUser.password) {
                                  return '  Passwords do not match';
                                }
                                return null;
                              },
                            ),

                            (screenHeight * 0.03).heightBox,
                            customButton(
                              title: model.isLoading ? null : "Sign Up",
                              color: green,
                              textColor: white,
                              width: screenWidth,
                              height: screenHeight * 0.049,
                              onPressed:
                                  model.isLoading
                                      ? null
                                      : () async {
                                        try {
                                          TextInput.finishAutofillContext();
                                          if (model.formKey.currentState!
                                              .validate()) {
                                            await model.signUpUser(context);
                                          }
                                        } catch (e) {
                                          print('Login Error: $e');
                                        }
                                      },
                              child:
                                  model.isLoading
                                      ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: green,
                                          strokeWidth: 2.5,
                                        ),
                                      )
                                      : null,
                            ),
                          ],
                        ),
                      ),

                      (screenHeight * 0.05).heightBox,
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          screenWidth * 0.04,
                          0,
                          screenWidth * 0.04,
                          0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(color: green, thickness: 1),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                              child:
                                  "Or Sign Up using".text
                                      .fontFamily(medium)
                                      .size(14)
                                      .make(),
                            ),
                            Expanded(
                              child: Divider(color: green, thickness: 1),
                            ),
                          ],
                        ),
                      ),
                      (screenHeight * 0.03).heightBox,
                      HStack([
                        Image.asset(
                          "Assets/logos/google_logo.png",
                          width: 60,
                          height: 60,
                        ).flexible(),
                        (screenWidth * 0.07).widthBox,
                        Image.asset(
                          "Assets/logos/gmail_logo.png",
                          width: 60,
                          height: 60,
                        ).flexible(),
                        (screenWidth * 0.07).widthBox,
                        Image.asset(
                          "Assets/logos/fb_logo.png",
                          width: 60,
                          height: 60,
                        ).flexible(),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
