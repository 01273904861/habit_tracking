import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/widgets/app_button.dart';
import 'package:habbit_tracking_app/features/create%20account/ui/widgets/input_title_and_counter.dart';
import 'package:habbit_tracking_app/features/create%20account/ui/widgets/choose_image_grid_view.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int currentIndex = 0;
  late PageController pageController; // ✅ استخدم `late` بدلاً من `final`

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dayCubit = context.read<DayCubit>();
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              controller: pageController,
              itemCount: createAccountPagesList.length,
              itemBuilder: (context, i) {
                return createAccountPagesList[i];
              },
            ),
          ),
          currentIndex != createAccountPagesList.length - 1
              ? AppButton(
                  height: 75.h,
                  onPressed: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 3),
                        curve: Curves.bounceIn);
                  },
                  title: 'next')
              : AppButton(
                  height: 70.h,
                  onPressed: () {
                    if (dayCubit.image.isNullOrEmpty() ||
                        dayCubit.title.text.isNullOrEmpty() ||
                        dayCubit.counterControler.text.isNullOrEmpty()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 3),
                          content: Text('please enter title and image'),
                        ),
                      );
                    } else {
                      context.read<DayCubit>().addNewHabit();

                      context.pop();
                    }
                  },
                  title: 'Done'),
          verticalSpace(30),
        ],
      )),
    );
  }
}

List<Widget> createAccountPagesList = [
  const InputTitleAndCounter(),
  const ChooseImageGridview(),
];
