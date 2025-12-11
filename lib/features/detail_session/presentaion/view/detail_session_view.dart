import 'package:flutter/material.dart';
import 'package:mantiq_app/core/components/widgets/custom_button.dart';
import 'package:mantiq_app/core/components/widgets/custom_text.dart';
import 'package:mantiq_app/core/theme/app_colors.dart';

import '../../../../core/components/widgets/select_widget.dart';
import '../../../../core/components/widgets/text_gradiate_widget.dart';

class DetailSessionView extends StatelessWidget {
  const DetailSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      '1- Building a digital product or app step-by-step.',
      '2- Choosing the right tools or technologies.',
      '3- Reviewing your designs or technical ideas before development.',
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText.w600S18("Book a Session"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 132 - 16),
              child: TextGradiateWidget(
                text: 'Book a 1-on-1 \nSession Book ',
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 40 - 16),
              child: CustomText.w500S14Grey(
                'Book a quick 1-on-1 call with Adham to talk tech or business.',
              ),
            ),
            SizedBox(height: 24),
            CustomText.w700S14('Tech Consultation'),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                data.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CustomText.w500S14Grey(data[index]),
                ),
              ),
            ),
            SizedBox(height: 26),
            Container(
              decoration: BoxDecoration(
                color: AppColors.greyScaleColor10,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(onPressed: () {}, title: 'Tech'),
                  ),
                  Expanded(
                    child: Center(child: CustomText.w500S14Grey('Business')),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            CustomText.w700S14('Select form available time'),
            SizedBox(height: 16),
            ...List.generate(
              4,
              (index) => SelectWidget(
                title: '1 , Jan 2025  9:00 am - 10 am ',
                isSelect: index == 1,
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: 'Complete Booking',
                    edgeInsets: EdgeInsets.symmetric(vertical: 12),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 8),
                CustomText.w700S16('14.99\$', color: AppColors.greyScaleColor2),
              ],
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
