import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/extension/padding_extensions.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/translation/app_string.dart';
import 'package:to_do_app/core/utils/app_values.dart';
import 'package:to_do_app/core/utils/assets_manager.dart';
import 'package:to_do_app/core/widget_global/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: AppString.email,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: const SizedBox.shrink(),
                    ),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: AppString.password,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      suffixIcon: const SizedBox.shrink(),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        AppString.forgotPassword,
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          AppString.signIn,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppString.dontHaveAccount,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        5.sizedWidth,
                        GestureDetector(
                          onTap: () {},
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
    );
  }
}
