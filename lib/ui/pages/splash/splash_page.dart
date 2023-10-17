import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/ui/components/app_splash_box.dart';
import 'package:test_app/ui/components/app_svg.dart';
import 'package:test_app/ui/pages/splash/cubit/splash_cubit.dart';
import 'package:test_app/utils/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return const AppSplashBox(
              bgColor: colorWhite,
              color: Colors.black,
              children: [
                AppSvg(assetName: "flutter"),
              ]);
        },
      ),
    );
  }
}
