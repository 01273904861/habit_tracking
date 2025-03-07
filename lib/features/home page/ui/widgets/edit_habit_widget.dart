import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/widgets/app_button.dart';
import 'package:habbit_tracking_app/core/widgets/custom_text_form_field.dart';
import 'package:habbit_tracking_app/features/create%20account/data/models/image_model.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';

class EditHabitWidget extends StatefulWidget {
  const EditHabitWidget(
      {super.key, required this.dayModel, required this.habitIndex});
  final DayModel dayModel;
  final int habitIndex;

  @override
  State<EditHabitWidget> createState() => _EditHabitWidgetState();
}

class _EditHabitWidgetState extends State<EditHabitWidget> {
  int imageIndex = -1;
  @override
  Widget build(BuildContext context) {
    final dayCubit = context.read<DayCubit>();
    return SizedBox(
      height: 500.h,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: dayCubit.title,
              hintText: 'enter title',
            ),
            verticalSpace(40),
            CustomTextFormField(
                keyboardType: TextInputType.number,
                controller: dayCubit.counterControler,
                hintText: 'enter counter'),
            verticalSpace(40),
            SizedBox(
              height: 75.h,
              child: ListView.builder(
                  itemCount: imagesList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            imageIndex = i;
                          });
                        },
                        child: imageIndex == i
                            ? Card(
                                borderOnForeground: true,
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: AppColors.mainBlue, width: 1.5),
                                ),
                                child: Image.asset(
                                  imagesList[i].image,
                                  height: 70.h,
                                  width: 65.w,
                                ),
                              )
                            : Card(
                                child: Image.asset(
                                  imagesList[i].image,
                                  height: 70.h,
                                  width: 65.w,
                                ),
                              ));
                  }),
            ),
            const Spacer(),
            AppButton(
              title: 'edit habit',
              onPressed: () {
                if (imageIndex != -1) {
                  dayCubit.image = imagesList[imageIndex].image;
                }
                dayCubit.editHabit(
                    dayModel: widget.dayModel, habitIndex: widget.habitIndex);
                context.pop();
              },
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
