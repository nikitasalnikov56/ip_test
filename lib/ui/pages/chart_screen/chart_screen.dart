import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_test/ui/resources/app_colors.dart';
import 'package:flutter_new_test/ui/resources/app_style.dart';
import 'package:flutter_new_test/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';


class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go(AppRoutes.home);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.darkBlue,
          ),
        ),
        title: Text(
          'Chart Screen',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
      ),
      body: const ChartBody(),
    );
  }
}

class ChartBody extends StatelessWidget {
  const ChartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: AspectRatio(
          aspectRatio: 1.3,
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                startDegreeOffset: -45,
                borderData: FlBorderData(
                  show: true,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: [
                  PieChartSectionData(
                    color: Colors.blue,
                    radius: 140,
                    title: '40%',
                    titleStyle: AppStyle.fontStyle.copyWith(
                      fontSize: 28,
                      color: AppColors.white,
                    ),
                    value: 40,
                  ),
                  PieChartSectionData(
                    color: Colors.orange,
                    radius: 150,
                    title: '60%',
                    titleStyle: AppStyle.fontStyle.copyWith(
                      fontSize: 28,
                      color: AppColors.white,
                    ),
                    value: 60,
                  ),
                ],
              ),
              swapAnimationDuration:
                  const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.bounceIn,
            ),
          ),
        ),
      ),
    );
  }
}
