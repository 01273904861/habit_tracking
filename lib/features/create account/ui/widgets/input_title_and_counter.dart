import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_langdetect/flutter_langdetect.dart' as langdetect;
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/widgets/custom_text_form_field.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';

class InputTitleAndCounter extends StatelessWidget {
  const InputTitleAndCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final dayCubit = context.read<DayCubit>();
    // TextDirection textDirection = TextDirection.ltr;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormField(
            // onChanged: (text) async {
            //   await langdetect
            //       .initLangDetect(); // This is needed once in your application after ensureInitialized()

            //   final language = langdetect.detect(text);
            //   if (language == 'ar') {
            //     textDirection = TextDirection.rtl;
            //   } else {
            //     textDirection = TextDirection.ltr;
            //   }
            // },
            // textDirection: textDirection,
            controller: dayCubit.title,
            hintText: 'enter title',
          ),
          verticalSpace(40),
          CustomTextFormField(
              keyboardType: TextInputType.number,
              controller: dayCubit.counterControler,
              hintText: 'enter counter'),
        ],
      ),
    );
  }
}
