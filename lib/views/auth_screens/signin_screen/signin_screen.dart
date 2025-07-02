import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tijara/core/consts/colors.dart';
import 'package:tijara/core/consts/styles.dart';
import 'package:tijara/views/auth_screens/signin_screen/signin_provider.dart';
import 'package:tijara/views/auth_screens/signup_screen/signup_screen.dart';
import 'package:tijara/widgets/custom_button.dart';
import 'package:tijara/widgets/customt_textfield.dart';
import 'package:velocity_x/velocity_x.dart';
import '../forgot_password_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (context) {
        return SignInProvider();
      },
      child: Consumer<SignInProvider>(
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
                      Image.asset('Assets/images/bg_image.png'),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          screenHeight * 0.03,
                          screenHeight * 0.02,
                          screenHeight * 0.03,
                          screenHeight * 0.03,
                        ),
                        child: Text(
                          "Welcome to Tijara",
                          style: TextStyle(
                            fontSize: screenHeight * 0.022,
                            fontFamily: bold,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: 'Email',
                              controller: model.emailController,
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
                              controller: model.passwordController,
                              obscureText: model.isVisiblePassword,
                              suffixIcon: IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.white,
                                onPressed: () {
                                  model.togglePasswordVisibility();
                                },
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

                            (screenHeight * 0.03).heightBox,
                            customButton(
                              title: model.isLoading ? null : "Log In",
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
                                            await model.signInUser(context);
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
                            (screenHeight * 0.02).heightBox,

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                "Forgot Password?  ".text
                                    .color(green)
                                    .size(14)
                                    .fontFamily(medium)
                                    .make()
                                    .onTap(() {
                                      Get.to(ForgotPasswordScreen());
                                    }),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Spacer(),
                      HStack([
                        "Don't have an account? ".text
                            .fontFamily(medium)
                            .size(14)
                            .make(),
                        " Sign Up ".text
                            .color(green)
                            .size(17)
                            .fontFamily(bold)
                            .make()
                            .onTap(() {
                              Get.to(SignUpScreen());
                            }),
                      ]),
                      (screenHeight * 0.03).heightBox,
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
