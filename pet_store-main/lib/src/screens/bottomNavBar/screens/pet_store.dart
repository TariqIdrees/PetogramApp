import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/core/app_assets.dart';
import 'package:pet_store_app/src/components/core/app_colors.dart';
import 'package:pet_store_app/src/components/text/customText.dart';
import 'package:pet_store_app/src/components/textfield/customTextField.dart';
import 'package:pet_store_app/src/components/widgets/petBuyAndSellContainer.dart';
import 'package:pet_store_app/src/components/widgets/shopPetFoodcontainer.dart';
import 'package:pet_store_app/src/components/widgets/topHeadingContainer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetStoreScreen extends StatelessWidget {
  const PetStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          const TopHeadingContainer(text: "PET STORE"),
          SizedBox(
            height: 2.h,
          ),
          CustomTextFormField(
              hintText: "Search Item",
              labelText: "Search Item",
              suffixIcon: Icons.search,
              fillColor: AppColors.lightGrey,
              controller: searchController),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                CustomText(
                  text: "Pets Near You",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      PetBuyAndSellContainer(
                        petName: "Siamese Cat",
                        petImage: AppAssets.cat1,
                        petAge: "2 months",
                        petDescription:
                            "Meet our adorable cat, Luna! She has a beautiful, silky coat with a mix of grey and white fur that’s soft to the touch. Luna is known for her striking blue eyes that sparkle with curiosity. She's playful and loves to chase after toys, making her a perfect companion for active families. Despite her playful nature, Luna is also incredibly affectionate and enjoys curling up on laps for a cozy nap. She’s well-behaved, litter-trained, and gets along well with other pets. Luna is the perfect addition to any loving home, bringing joy and warmth wherever she goes",
                        petPrice: "20000",
                      ),
                      PetBuyAndSellContainer(
                        petName: "Canine Dog",
                        petImage: AppAssets.dog1,
                        petAge: "11 months",
                        petDescription:
                            "Meet our charming dog, Max! He has a shiny, golden coat that's easy to groom and a pair of expressive brown eyes that show his loving nature. Max is energetic and loves outdoor activities, making him an excellent companion for walks, runs, and playtime. He is intelligent, quick to learn commands, and well-behaved around both children and other pets. Max is also incredibly loyal and enjoys spending quality time with his family, whether it’s playing fetch or relaxing together. Bring Max home, and you’ll have a faithful friend who fills your life with joy and companionship.",
                        petPrice: "25000",
                      ),
                      PetBuyAndSellContainer(
                        petName: "Domestic Cat",
                        petImage: AppAssets.cat1,
                        petAge: "3 months",
                        petDescription:
                            "Meet our adorable cat, Luna! She has a beautiful, silky coat with a mix of grey and white fur that’s soft to the touch. Luna is known for her striking blue eyes that sparkle with curiosity. She's playful and loves to chase after toys, making her a perfect companion for active families. Despite her playful nature, Luna is also incredibly affectionate and enjoys curling up on laps for a cozy nap. She’s well-behaved, litter-trained, and gets along well with other pets. Luna is the perfect addition to any loving home, bringing joy and warmth wherever she goes",
                        petPrice: "20000",
                      ),
                      PetBuyAndSellContainer(
                        petName: "Canine Dog",
                        petImage: AppAssets.dog1,
                        petAge: "10 months",
                        petDescription:
                            "Meet our charming dog, Max! He has a shiny, golden coat that's easy to groom and a pair of expressive brown eyes that show his loving nature. Max is energetic and loves outdoor activities, making him an excellent companion for walks, runs, and playtime. He is intelligent, quick to learn commands, and well-behaved around both children and other pets. Max is also incredibly loyal and enjoys spending quality time with his family, whether it’s playing fetch or relaxing together. Bring Max home, and you’ll have a faithful friend who fills your life with joy and companionship.",
                        petPrice: "25000",
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomText(
                  text: "Pets Food",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood1,
                          productName: "PEACHES",
                          price: "4000",
                          productDescription:
                              "Turkey and salmon are packed with amazing flavour that satisfies even the pickiest of cats. Boost the immune system and promote healthy digestion. Helps reduce stool odour. Supports kidney and urinary tract health. The low content of magnesium and L-methionine helps maintain an optimal urine pH of 6.0–6.5.",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood2,
                          productName: "PEDIGREE 400G",
                          price: "3000",
                          productDescription:
                              "For healthy teeth and bones. In cats an essential nutrient for excellent vision and a healthy heart. Help maintain gastrointestinal tract and immune system health. Promote longevity and good health.",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood3,
                          productName: "MOCHI",
                          price: "2000",
                          productDescription:
                              "Turkey and salmon are packed with amazing flavour that satisfies even the pickiest of cats. Boost the immune system and promote healthy digestion. Helps reduce stool odour. Supports kidney and urinary tract health. The low content of magnesium and L-methionine helps maintain an optimal urine pH of 6.0–6.5.",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood4,
                          productName: "BEAN",
                          price: "5000",
                          productDescription:
                              "For healthy teeth and bones. In cats an essential nutrient for excellent vision and a healthy heart. Help maintain gastrointestinal tract and immune system health. Promote longevity and good health.",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood5,
                          productName: "BISCUIT",
                          price: "4000",
                          productDescription:
                              "Turkey and salmon are packed with amazing flavour that satisfies even the pickiest of cats. Boost the immune system and promote healthy digestion. Helps reduce stool odour. Supports kidney and urinary tract health. The low content of magnesium and L-methionine helps maintain an optimal urine pH of 6.0–6.5.",
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        const ShopPetFoodContainer(
                          image: AppAssets.petFood6,
                          productName: "PEDIGREE 400G",
                          price: "2000",
                          productDescription:
                              "For healthy teeth and bones. In cats an essential nutrient for excellent vision and a healthy heart. Help maintain gastrointestinal tract and immune system health. Promote longevity and good health.",
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
