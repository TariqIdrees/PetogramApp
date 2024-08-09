import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/button/customButton.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/components/textfield/customTextField.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckOutScreen extends StatelessWidget {
  final String price;
  const CheckOutScreen({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final TextEditingController addressController = TextEditingController();
    final TextEditingController postCodeController = TextEditingController();
    final TextEditingController mobileNumberController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryWhite,
          ),
        ),
        title: const CustomText(
          text: "Checkout",
          fontWeight: FontWeight.bold,
          textColor: AppColors.primaryWhite,
        ),
        elevation: 0,
        backgroundColor: const Color(0xff6ea7db),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xf9ffffff),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                CustomText(
                  text: "Total Bill: $price",
                ),
                SizedBox(
                  height: 1.h,
                ),
                const CustomText(
                  text: "Delivery Address",
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextFormField(
                    hintText: "Address",
                    labelText: "Address",
                    fillColor: const Color.fromARGB(255, 148, 207, 197),
                    controller: addressController),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextFormField(
                    hintText: "Postal Code",
                    labelText: "Postal Code",
                    fillColor: const Color.fromARGB(255, 148, 207, 197),
                    controller: postCodeController),
                SizedBox(
                  height: 1.h,
                ),
                CustomTextFormField(
                    hintText: "Mobile Number",
                    labelText: "Mobile Number",
                    fillColor: const Color.fromARGB(255, 148, 207, 197),
                    controller: mobileNumberController),
                SizedBox(
                  height: 3.h,
                ),
                CustomButton(text: "Place Order", voidCallback: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
