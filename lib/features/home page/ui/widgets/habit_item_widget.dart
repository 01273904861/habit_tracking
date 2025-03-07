import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/helper/app_functions.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/core/models/habit_model.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/widgets/custom_completed_indicator.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/widgets/edit_habit_widget.dart';

class HabitItemWidget extends StatelessWidget {
  const HabitItemWidget({
    super.key,
    required this.dayModel,
    required this.habitIndex,
    required this.isTheLastDay,
  });

  final DayModel dayModel;
  final int habitIndex;
  final bool isTheLastDay;

  // Helper method to build the dismissible background
  Widget _buildDismissibleBackground(bool isLeft) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment:
            isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isLeft) const Icon(Icons.delete, color: Colors.white),
          if (isLeft) const SizedBox(width: 8),
          const Text(
            "Delete",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          if (!isLeft) const SizedBox(width: 8),
          if (!isLeft) const Icon(Icons.delete, color: Colors.white),
        ],
      ),
    );
  }
//   Widget buildHabitItem(Animation<double>animation  ){
//  return SizeTransition(
//   sizeFactor: animation,
//   child: HabitItemWidget(dayModel: dayModel, index: index, isTheLastDay: isTheLastDay));
//   }

  Widget buildHabitItem() {
    return HabitItemWidget(
        dayModel: dayModel, habitIndex: habitIndex, isTheLastDay: isTheLastDay);
  }

  @override
  Widget build(BuildContext context) {
    // Ensure habitsList is not null
    if (dayModel.habitsList == null ||
        habitIndex >= dayModel.habitsList!.length) {
      return const SizedBox.shrink(); // Return an empty widget if invalid
    }

    final HabitModel habitModel = dayModel.habitsList![habitIndex];
    final double percent = habitModel.complements / habitModel.counter;

    return Dismissible(
      key: Key(dayModel.habitsList![habitIndex].title +
          habitIndex.toString()), //change the key to unique key
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        bool? shouldDelete = await AppFunctions.showAnimatedDialog(
          context,
          title: 'Delete Habit',
          content: 'Do you want to delete this habit?',
          onOkPressed: () => Navigator.of(context).pop(true),
          onCancelpressed: () => Navigator.of(context).pop(false),
        );
        return shouldDelete;
      },
      onDismissed: (direction) {
        context.read<DayCubit>().deleteHabit(
            habitIndex: habitIndex,
            dayModel: dayModel,
            buildHabit: buildHabitItem());
      },
      background: _buildDismissibleBackground(true),
      secondaryBackground: _buildDismissibleBackground(false),
      child: GestureDetector(
        onTap: !isTheLastDay
            ? null
            : () {
                context.read<DayCubit>().incrementCounter(
                      habitIndex: habitIndex,
                      dayModel: dayModel,
                    );
              },
        onLongPress: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: EditHabitWidget(
                    dayModel: dayModel,
                    habitIndex: habitIndex,
                  ),
                );
              });
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CustomCompletedIndicator(
                    percent: percent, image: habitModel.image),
                const Spacer(flex: 1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      habitModel.title,
                      style: AppTextstyles.font18BlackSemiBold,
                    ),
                    Text(
                      '${habitModel.complements.toInt()} / ${habitModel.counter}',
                      style: AppTextstyles.font16WhiteMeduim
                          .copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
                const Spacer(flex: 10),
                if (isTheLastDay)
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: AppColors.lighterGrey),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 50.sp,
                      color: AppColors.grey,
                    ),
                  )
                else
                  horizontalSpace(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
