import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/ui/components/app_text.dart';
import 'package:test_app/ui/pages/home/components/logout_popup.dart';
import 'package:test_app/ui/pages/home/cubit/home_cubit.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/shared/fns.dart';
import 'package:test_app/utils/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showPopUp(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppText(appName),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                  onTap: () => Helper.logout(context),
                  child: const Icon(Icons.logout)),
            )
          ],
        ),
        body: BlocProvider(
          create: (context) => HomeCubit(context),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final cubit = context.read<HomeCubit>();
              return GestureDetector(
                onTap: () => cubit.geofencing(),
                child: Center(
                  child: CircleAvatar(
                    maxRadius: 100,
                    backgroundColor:
                        cubit.changeStatus.text == "GeofenceStatus.enter"
                            ? successGreen
                            : cubit.changeStatus.text == "GeofenceStatus.exit"
                                ? primaryColor
                                : Colors.black,
                    child: const AppText(
                      start,
                      size: 50,
                      color: colorWhite,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
