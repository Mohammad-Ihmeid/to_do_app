import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/auth/presentation/controller/bloc_auth/auth_bloc.dart';
import 'package:to_do_app/core/app_constance.dart';
import 'package:to_do_app/core/extension/padding_extensions.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/core/services/services_locator.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/translation/app_string.dart';
import 'package:to_do_app/core/utils/app_values.dart';
import 'package:to_do_app/core/utils/assets_manager.dart';
import 'package:to_do_app/core/utils/enums.dart';
import 'package:to_do_app/core/utils/unique_key.dart';
import 'package:to_do_app/core/widget_global/custom_auth_text_field.dart';
import 'package:to_do_app/core/widget_global/show_loading_dialog.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.requestSignInState != current.requestSignInState,
        listener: (context, state) {
          switch (state.requestSignInState) {
            case ButtonRequestState.normal:
              break;
            case ButtonRequestState.loading:
              return LoadingDialog.show(context, key: UnKey.unKeySignIn);
            case ButtonRequestState.error:
              LoadingDialog.hide(context);
              AppConstance.messageWarning(state.errorSignIn, context);
              break;
            case ButtonRequestState.success:
              LoadingDialog.hide(context);
              Navigator.pushReplacementNamed(context, Routes.home);
              break;
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p16,
                horizontal: AppPadding.p24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox.shrink(),
                  Expanded(
                    child: SvgPicture.asset(
                      ImagesAssets.logoTextApp,
                      width: 50.sW(context),
                    ),
                  ),
                  15.sizedHeight,
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _emailWidget(),
                        _passwordWidget(),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            AppString.forgotPassword,
                            textAlign: TextAlign.right,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        _signInWidget(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppString.dontHaveAccount,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            5.sizedWidth,
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, Routes.signUp),
                              child: Text(
                                AppString.signUP,
                                style: TextStyle(
                                  fontSize: 12.sF(context),
                                  color: AppColorsLight.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].paddingDirectional(bottom: AppPadding.p16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInWidget(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.read<AuthBloc>().add(SignInEvent()),
            child: Text(
              AppString.signIn,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }

  Widget _passwordWidget() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomAuthTextField(
          controller: context.read<AuthBloc>().passwordController,
          hintText: AppString.password,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        );
      },
    );
  }

  Widget _emailWidget() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomAuthTextField(
          controller: context.read<AuthBloc>().emailController,
          hintText: AppString.email,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }
}
