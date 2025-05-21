import 'package:flutter/material.dart';

import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/widgets/custom_completed_indicator.dart';

class HabitsCompltedCard extends StatelessWidget {
  const HabitsCompltedCard(
      {super.key, required this.title, required this.subTitle, required this.image, required this.percent,});
final String title;
final String subTitle;
final String image;
final double percent;

  @override
  Widget build(BuildContext context) {
 

    return 
   Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCompletedIndicator(percent: percent, image: image),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: AppTextstyles.font18BlackSemiBold,
                  ),
                 
                ],
              ),
        
            ],
          ),
        ),

    );
  }
}


