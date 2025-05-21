import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habbit_tracking_app/core/theming/app_colors.dart';
import 'package:habbit_tracking_app/features/create%20account/data/models/image_model.dart';
import 'package:habbit_tracking_app/features/home%20page/logic/cubit/day_cubit.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

class ChooseImageGridview extends StatefulWidget {
  const ChooseImageGridview({
    super.key,
  });

  @override
  State<ChooseImageGridview> createState() => _ChooseImageGridviewState();
}

class _ChooseImageGridviewState extends State<ChooseImageGridview> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    final dayCubit = context.read<DayCubit>();
    return StaggeredGridView.countBuilder(
      itemCount: imagesList.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () {
            currentIndex = i;
            dayCubit.image = imagesList[i].image;
            setState(() {});
          },
          child: currentIndex == i
              ? Card(
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(width: 3, color: AppColors.mainBlue)),
                  borderOnForeground: true,
                  child: Image.asset(imagesList[i].image),
                )
              : Card(
                  child: Image.asset(imagesList[i].image),
                ),
        );
      },
      mainAxisSpacing: 8,
      crossAxisCount: 3,
      staggeredTileBuilder: (int index) => StaggeredTile.count(
          (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
    );
  }
}
