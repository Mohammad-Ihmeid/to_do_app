import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/translation/app_string.dart';
import 'package:to_do_app/core/utils/app_values.dart';
import 'package:to_do_app/home/presentation/screen/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p16,
            horizontal: AppPadding.p24,
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                flexibleSpace: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.toDoList.toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Icon(
                      Icons.settings,
                    ),
                  ],
                ),
              ),
              SliverAppBar(
                backgroundColor: Colors.transparent,
                leadingWidth: 70.sW(context),
                leading: Row(
                  children: [
                    Icon(
                      Icons.list_sharp,
                      color: AppColorsLight.primaryDarkColor,
                      size: 40.sF(context),
                    ),
                    Text(
                      AppString.listOfToDo.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                actions: [
                  Icon(
                    Icons.filter_alt_outlined,
                    color: AppColorsLight.primaryDarkColor,
                    size: 25.sF(context),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BottomSheetScreen().open(context: context, scaffoldKey: scaffoldKey);
        },
        materialTapTargetSize: MaterialTapTargetSize.padded,
        child: Icon(
          Icons.add,
          color: AppColorsLight.white,
          size: 40.sF(context),
        ),
      ),
    );
  }
}
