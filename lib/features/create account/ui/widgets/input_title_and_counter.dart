import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habbit_tracking_app/core/constants/assets.dart';
// import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/widgets/custom_text_form_field.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';

class InputTitleAndCounter extends StatelessWidget {
  const InputTitleAndCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final dayCubit = context.read<DayCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CircleAvatar(

          //   radius: 70.r,
          //   backgroundImage: const AssetImage(
          //     Assets.imagesSplash12,

          //   ),
          // ),
          verticalSpace(50),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 101, 144, 207),
                borderRadius: BorderRadius.circular(64.r)),
            child: Image.asset(
              // fit: BoxFit.fill,
              Assets.imagesListen,
              height: 200.h,
              width: 200.w,
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            'Step by Step you can achieve your goals',
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 34, 95, 37),
              fontSize: 18,
            ),
          ),
          verticalSpace(80),
          CustomTextFormField(
            controller: dayCubit.title,
            hintText: 'the name of habit',
          ),
          verticalSpace(20),
          CustomTextFormField(
              keyboardType: TextInputType.number,
              controller: dayCubit.counterControler,
              hintText: 'counter of repeat'),
        ],
      ),
    );
  }
}
