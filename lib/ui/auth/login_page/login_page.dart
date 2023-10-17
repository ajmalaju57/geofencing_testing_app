import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/ui/auth/login_page/cubit/login_cubit.dart';
import 'package:test_app/ui/components/app_text_field.dart';
import 'package:test_app/ui/components/btn_primary_gradient.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/extensions/margin_ext.dart';
import 'package:test_app/utils/strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      body: BlocProvider(
        create: (context) => LoginCubit(context),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final cubit = context.read<LoginCubit>();
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                      label: username,
                      hint: "Enter Username",
                      controller: cubit.userName),
                  AppTextField(
                      label: pass,
                      hint: "Enter Password",
                      controller: cubit.pass),
                  16.hBox,
                  BtnPrimaryGradient(
                    onTap: () {
                      cubit.login();
                    },
                    text: login,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
