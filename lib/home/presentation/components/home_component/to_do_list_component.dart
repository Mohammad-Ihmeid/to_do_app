import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/utils/app_values.dart';
import 'package:to_do_app/core/utils/assets_manager.dart';
import 'package:to_do_app/core/utils/enums.dart';
import 'package:to_do_app/home/presentation/controller/bloc_home/home_bloc.dart';

class ToDoListComponent extends StatelessWidget {
  const ToDoListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.getToDoListState != current.getToDoListState,
      builder: (context, state) {
        switch (state.getToDoListState) {
          case ButtonRequestState.normal:
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[200]!,
                  child: Container(
                    width: double.infinity,
                    height: 15.sH(context),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                    child: Text("$index"),
                  ),
                ),
                childCount: 10,
              ),
            );
          case ButtonRequestState.loading:
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[200]!,
                  child: Container(
                    width: double.infinity,
                    height: 15.sH(context),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: AppPadding.p8),
                    child: Text("$index"),
                  ),
                ),
                childCount: 10,
              ),
            );
          case ButtonRequestState.error:
            return SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(IconsAssets.errorIcon),
                  SizedBox(height: 2.sH(context)),
                  Text(
                    state.getToDoListError,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          case ButtonRequestState.success:
            return state.toDoList.isEmpty
                ? SliverToBoxAdapter(
                    child: LottieBuilder.asset(IconsAssets.empytListIcon),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = state.toDoList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.detailToDo,
                              arguments: item,
                            ).then((value) {
                              if (value != null) {
                                context
                                    .read<HomeBloc>()
                                    .add(ShowToDoListEvent());
                              }
                            });
                          },
                          child: Card(
                            color: cardColor(item.dateDeadlineNote),
                            child: Padding(
                              padding: const EdgeInsets.all(AppPadding.p8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      showDeadlineIcon(item.dateDeadlineNote),
                                    ],
                                  ),
                                  SizedBox(height: 1.sH(context)),
                                  SizedBox(
                                    height: 8.sH(context),
                                    child: Text(
                                      item.subTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 1.sH(context)),
                                  Text(
                                    "Created at ${item.dateCreatedNote}",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: state.toDoList.length,
                    ),
                  );
        }
      },
    );
  }

  Color cardColor(String dateDeadlineNote) {
    if (dateDeadlineNote == '') {
      return AppColorsLight.primaryColor;
    } else {
      DateFormat format = DateFormat("dd MMMM yyyy");
      DateTime dateTime = format.parse(dateDeadlineNote);
      if (dateTime.isBefore(DateTime.now())) {
        return AppColorsLight.primaryColor;
      } else {
        return AppColorsLight.primaryDarkColor;
      }
    }
  }

  Widget showDeadlineIcon(String dateDeadlineNote) {
    if (dateDeadlineNote == '') {
      return const SizedBox.shrink();
    } else {
      DateFormat format = DateFormat("dd MMMM yyyy");
      DateTime dateTime = format.parse(dateDeadlineNote);
      if (dateTime.isBefore(DateTime.now())) {
        return const SizedBox.shrink();
      } else {
        return const Icon(
          Icons.access_time,
          color: AppColorsLight.white,
        );
      }
    }
  }
}
