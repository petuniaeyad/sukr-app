import 'package:flutter/material.dart';
import 'package:sukar/helper/theme/app_colors.dart';
import 'package:sukar/presintation/widgets/padding/padding.dart';

class AndroidLoading extends StatelessWidget {
  const AndroidLoading({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CustomePadding(
          bottom: 10,
          child: CircularProgressIndicator(color: AppColors.darkSecondary),
        ),
        Text('loading...'),
      ],
    ),
  );
}
