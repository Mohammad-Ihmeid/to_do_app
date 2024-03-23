import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/extension/padding_extensions.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/translation/app_string.dart';
import 'package:to_do_app/core/utils/app_values.dart';
import 'package:to_do_app/core/utils/assets_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.toDoList.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity),
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.settings,
                      color: AppColorsLight.black,
                      size: 25.sF(context),
                    ),
                  ),
                ],
              ),
              15.sizedHeight,
              Expanded(
                child: SvgPicture.asset(
                  ImagesAssets.profileImage,
                  width: 80.sW(context),
                ),
              ),
              15.sizedHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.fullName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Devin L. Waller",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              15.sizedHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.email,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "DevinWaller17@gmail.com",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              15.sizedHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.password,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    AppString.changePassword,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              30.sizedHeight,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.signIn, (route) => false);
                    });
                  },
                  child: Text(
                    AppString.logOut.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
