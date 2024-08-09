import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/drawer/drawer.dart';
import 'package:pet_store_app/src/controllers/bottomNavBar_controller.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/cart_screen.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/pet_shelter.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/pet_store.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/tabbar/pet_community.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final TextStyle unselectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: landingPageController.changeTabIndex,
          currentIndex: landingPageController.tabIndex.value,
          backgroundColor: AppColors.lightGreenColor,
          unselectedItemColor: AppColors.primaryWhite,
          selectedItemColor: AppColors.greenColor,
          unselectedLabelStyle: unselectedLabelStyle,
          selectedLabelStyle: selectedLabelStyle,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.home,
                  size: 20.0,
                ),
              ),
              label: 'Home',
              backgroundColor: AppColors.lightGreenColor,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.group,
                  size: 20.0,
                ),
              ),
              label: 'Community',
              backgroundColor: AppColors.lightGreenColor,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.pets,
                  size: 20.0,
                ),
              ),
              label: 'Pet Shelter',
              backgroundColor: AppColors.lightGreenColor,
            ),
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavBarController landingPageController =
        Get.put(BottomNavBarController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>const CartScreen()));
            },
            icon:const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0.0,
      ),
      drawer: const UserDrawer(),
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: const [
              PetStoreScreen(),
              PetCommunity(),
              PetShelterScreen(),
            ],
          )),
    ));
  }
}
