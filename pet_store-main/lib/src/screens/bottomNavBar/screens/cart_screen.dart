import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_app/src/components/button/customButton.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/controllers/cartController.dart';
import 'package:pet_store_app/src/models/user_model.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/checkOutScreen.dart';

import '../../../services/paymentService.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    // Fetch cart items when the screen initializes
    cartController.fetchCartItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(
            child: Text('Your cart is empty'),
          );
        }
        return ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            final Cart item = cartController.cartItems[index];
            return ListTile(
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  cartController.deleteCartItem(item.cartId!);
                },
              ),
              leading: Image.asset(item.productImage ?? ''),
              title: Text(item.productTitle ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Quantity: ${item.quantity}'),
                  Row(
                    children: [
                      Text('Price: Rs '),
                      Text((int.parse(item.quantity!) *
                              int.parse(item.productPrice!))
                          .toString()),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
              text: 'Total Amount: Rs ${cartController.totalAmount}',
              btnColor: AppColors.primaryWhite,
              textColor: AppColors.greenColor,
              voidCallback: () {}),
          CustomButton(
              text: "Buy Now",
              voidCallback: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => CheckOutScreen(
                //               price: cartController.totalAmount.toString(),
                //             )));

                StripeServices.instance.makePayment();
              }),
        ],
      ),
    );
  }
}
