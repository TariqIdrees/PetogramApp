import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_app/src/components/button/customButton.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/components/textfield/customTextField.dart';
import 'package:pet_store_app/src/controllers/auth_controller.dart';
import 'package:pet_store_app/src/screens/authentication/signup_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: AppColors.lightGreenColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Login",
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.primaryWhite,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(
                  height: 2.sp,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: "Please sign in to continue",
                    textColor: AppColors.primaryWhite,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),
                CustomTextFormField(
                  controller: emailController,
                  labelText: "Enter your Email",
                  hintText: "",
                ),
                SizedBox(
                  height: 20.sp,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  labelText: "Enter your password",
                  hintText: "",
                ),
                SizedBox(
                  height: 20.sp,
                ),
                CustomButton(
                    text: "Login",
                    voidCallback: () async {
                      String res = await authController.loginUser(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      if (res == "successfully loggedin") {
                        authController.navigateToHomeScreen(context);
                        Get.snackbar("Loggedin successfully", res,
                            colorText: AppColors.primaryWhite,
                            backgroundColor: AppColors.lightGreenColor);
                      } else {
                        Get.snackbar(
                          res,
                          "Please check your email and password",
                        );
                      }
                    }),
                SizedBox(
                  height: 20.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don't have an account?",
                      textColor: AppColors.primaryWhite,
                      fontSize: 15.sp,
                    ),
                    SizedBox(
                      width: 8.sp,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: CustomText(
                        text: "Sign Up",
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.greenColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
