import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mantiq_app/core/components/widgets/custom_text.dart';
import 'package:mantiq_app/core/extensions/app_extentions.dart';

import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/routes/routes.dart';
import '../../../../generated/app_assets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 46),
          Row(
            children: [
              CustomText.w600S20('Welcome Saad !'),
              Image.asset(AppAssets.hi, width: 24, height: 29),
            ],
          ),
          SizedBox(height: 16),

          CustomButton(
            onPressed: () {},
            title: 'Grab a Coffee',
            edgeInsets: EdgeInsets.symmetric(horizontal: 43, vertical: 12.5),
          ),
          SizedBox(height: 16),
          CustomText.w500S14Grey(
            'Lorem ipsum venenatis arcu amet tempuseu sit ornare euismod condimentumtae.',
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 15,
              runSpacing: 24,
              children: List.generate(8, (index) {
                return GestureDetector(
                  onTap: () => context.pushNamed(Routes.detailSession),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFA00FA).withOpacity(0.05),
                              offset: const Offset(0, 4),
                              blurRadius: 20,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 32,
                            horizontal: 49,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppAssets.home),
                              ),
                              CustomText.w700S12('B2B Route'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 26),
                        child: CustomText.w600S12('Business Content Hub'),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
