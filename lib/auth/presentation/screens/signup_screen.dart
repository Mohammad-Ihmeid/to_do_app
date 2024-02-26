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
import 'package:to_do_app/core/widget_global/custom_text_field.dart';
import 'package:to_do_app/core/widget_global/show_loading_dialog.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) =>
            previous.requestSignUpState != current.requestSignUpState,
        listener: (context, state) {
          switch (state.requestSignUpState) {
            case ButtonRequestState.normal:
              break;
            case ButtonRequestState.loading:
              return LoadingDialog.show(context, key: UnKey.unKey1);
            case ButtonRequestState.error:
              AppConstance.messageWarning(state.errorSignUp, context);
              break;
            case ButtonRequestState.success:
              Navigator.pushReplacementNamed(context, Routes.signIn);
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
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      ImagesAssets.logoTextApp,
                      width: 40.sW(context),
                    ),
                  ),
                  5.sizedHeight,
                  Expanded(
                    flex: 2,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _emailWidget(),
                        _fullNameWidget(),
                        _passwordWidget(),
                        _confirmPasswordWidget(),
                        _signUpWidget(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppString.haveAnAccount,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            5.sizedWidth,
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, Routes.signIn),
                              child: Text(
                                AppString.signIn,
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

  Widget _signUpWidget(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.read<AuthBloc>().add(SignUPEvent()),
            child: Text(
              AppString.signUP,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }

  Widget _confirmPasswordWidget() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomTextField(
          controller: context.read<AuthBloc>().confirmPasswordController,
          hintText: AppString.confirmPassword,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          suffixIcon: const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _passwordWidget() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomTextField(
          controller: context.read<AuthBloc>().passwordController,
          hintText: AppString.password,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          suffixIcon: const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _fullNameWidget() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomTextField(
          controller: context.read<AuthBloc>().fullNameController,
          hintText: AppString.fullName,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          suffixIcon: const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _emailWidget() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomTextField(
          controller: context.read<AuthBloc>().emailController,
          hintText: AppString.email,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          suffixIcon: const SizedBox.shrink(),
        );
      },
    );
  }
}
