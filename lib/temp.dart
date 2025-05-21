  // void addDayMethod(bool copyOrNo) {
  //   DayModel dayModel;
  //   daysList = dayBox.values.toList();

  //   if (copyOrNo) {
  //     dayModel = daysList.last;
  //     for (var habit in dayModel.habitsList!) {
  //       habit.complements = 0;
  //     }
  //     dayModel.date = today;
  //     daysList.add(dayModel);
  //     dayBox.put(dayModel.date, dayModel);
  //   } else {
  //     dayModel = DayModel(
  //       date: today,
  //       habitsList: [],
  //       percent: 0.0,
  //       dayName: dayName,
  //       dayNum: dayNum,
  //       completness: 0,
  //       counter: 0,
  //     );
  //     daysList.add(dayModel);
  //     dayBox.put(dayModel.date, dayModel);
  //   }
  //   // scrollController.jumpTo(scrollController.position.minScrollExtent);
  //   // daysList = dayBox.values.toList();

  //   emit(DayListLoaded(daysList: daysList));
  // }
