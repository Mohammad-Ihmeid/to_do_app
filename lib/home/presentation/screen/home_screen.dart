import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/core/services/services_locator.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/translation/app_string.dart';
import 'package:to_do_app/core/utils/app_values.dart';
import 'package:to_do_app/home/presentation/components/home_component/to_do_list_component.dart';
import 'package:to_do_app/home/presentation/controller/bloc_home/home_bloc.dart';
import 'package:to_do_app/home/presentation/screen/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(ShowToDoListEvent()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p16,
              horizontal: AppPadding.p24,
            ),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  pinned: true,
                  flexibleSpace: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.toDoList.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.profile),
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
                const ToDoListComponent(),
              ],
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                BottomSheetScreen().open(context: context).then((value) {
                  if (value != null) {
                    context.read<HomeBloc>().add(ShowToDoListEvent());
                  }
                });
              },
              materialTapTargetSize: MaterialTapTargetSize.padded,
              child: Icon(
                Icons.add,
                color: AppColorsLight.white,
                size: 40.sF(context),
              ),
            );
          },
        ),
      ),
    );
  }
}
