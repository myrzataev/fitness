import 'package:fitness/features/widgets/blogger_card.dart';
import 'package:fitness/features/widgets/day_view_widget.dart';
import 'package:fitness/features/widgets/week_view_widget.dart';
import 'package:fitness/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../internal/helpers/text_helper.dart';
import '../widgets/training_card_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/BODYPOWER.png",
          width: 136.w,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  top: 48.h,
                  bottom: 31.h,
                ),
                child: Text(
                  "НЕДЕЛЯ",
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ),
              const WeekViewWidget(),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  bottom: 31.h,
                ),
                child: Text(
                  "День",
                  style: TextHelper.w700s20
                      .copyWith(color: ColorHelper.greyD1D3D3),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  bottom: 30.h,
                ),
                child: const DayViewWidget(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: const TrainingCardWidget(),
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
