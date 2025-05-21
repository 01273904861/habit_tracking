import 'package:flutter/material.dart';
import 'package:habbit_tracking_app/core/Router/routes.dart';
import 'package:habbit_tracking_app/core/helper/extension.dart';
import 'package:habbit_tracking_app/core/helper/spacing.dart';
import 'package:habbit_tracking_app/core/models/day_model.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/features/home%20page/ui/widgets/day_widget.dart';

class DaysListviewPage extends StatefulWidget {
  const DaysListviewPage({
    super.key,
    required this.daysList,
  });

  final List<DayModel> daysList;

  @override
  State<DaysListviewPage> createState() => _DaysListviewPageState();
}

class _DaysListviewPageState extends State<DaysListviewPage> {
  final ScrollController scrollController = ScrollController();
  void _scrollToEnd() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    _scrollToEnd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 162, 190, 232),
      body: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, i) => horizontalSpace(10),
        itemBuilder: (context, i) {
          double precent = 0;
          if (!widget.daysList[i].percent!.isNaN) {
            precent = widget.daysList[i].percent!;
          }
          return GestureDetector(
            onTap: () {
              context.pushNamed(Routes.dayHabitsPage, args: i);
            },
            child: DayWidget(
              precent: precent,
              dayModel: widget.daysList[i],
            ),
          );
        },
        itemCount: widget.daysList.length,
      ),
    );
  }
}
