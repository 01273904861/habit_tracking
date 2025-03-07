import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/Router/routes.dart';
import 'package:habbit_tracking_app/core/helper/app_functions.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/core/models/notification_service.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/core/theming/app_textstyles.dart';
import 'package:habbit_tracking_app/core/widgets/app_button.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/widgets/habit_item_widget.dart';

class DayHabitsPage extends StatelessWidget {
  const DayHabitsPage({super.key, required this.dayIndex});

  final int dayIndex;

  // Helper method to build the list of habits
  Widget _buildHabitsList(List<DayModel> daysList) {
    final dayModel = daysList[dayIndex];
    final habitsList = dayModel.habitsList;

    if (habitsList == null || habitsList.isEmpty) {
      return const Center(
        child: Text('There are no habits yet.'),
      );
    }

    return ListView.builder(
      reverse: true,
      itemCount: habitsList.length,
      itemBuilder: (context, index) {
        return HabitItemWidget(
          isTheLastDay: daysList.last == dayModel,
          dayModel: dayModel,
          habitIndex: index,
        );
      },
    );
  }

  // Helper method to build the "add habit" button
  Widget _buildAddHabitButton(BuildContext context, List<DayModel> daysList) {
    final isLastDay = daysList.last ==
        daysList[dayIndex]; // if the day not today  you can't add new habit

    if (!isLastDay) {
      return AppButton(
        backgroungColor: AppColors.morelightGrey,
        height: 70.h,
        title: 'Add Habit',
        titleStyle: AppTextstyles.font16WhiteSemiBold
            .copyWith(color: const Color.fromARGB(255, 161, 158, 158)),
      );
    }

    return AppButton(
      onPressed: () {
        context.pushNamed(Routes.createAccountPage);
      },
      height: 70.h,
      title: 'Add Habit',
    );
  }

  @override
  Widget build(BuildContext context) {
    final DayCubit dayCubit = BlocProvider.of<DayCubit>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Day Habits Page'),
        leading: IconButton(
          onPressed: () {
            AppFunctions.showAnimatedDialog(
              context,
              content: 'Do you want to delete all habits?',
              title: 'Delete Habits',
              onOkPressed: () {
                dayCubit.deleteAllHabitsOfADay(dayCubit.daysList[dayIndex]);
                context.pop();
              },
            );
          },
          icon: const Icon(Icons.delete),
        ),
      ),
      body: BlocBuilder<DayCubit, DayState>(
        builder: (context, state) {
          if (state is! DayListLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final daysList = state.daysList;

          // Ensure dayIndex is within bounds
          if (dayIndex < 0 || dayIndex >= daysList.length) {
            return const Center(
              child: Text('Invalid day index.'),
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: _buildHabitsList(daysList),
              ),
              verticalSpace(10),
              _buildAddHabitButton(context, daysList),
              verticalSpace(30),
            ],
          );
        },
      ),
    );
  }
}
