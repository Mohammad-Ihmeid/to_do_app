import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:to_do_app/core/extension/padding_extensions.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/services/services_locator.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/translation/detect_language.dart';
import 'package:to_do_app/core/utils/app_values.dart';
import 'package:to_do_app/core/utils/assets_manager.dart';
import 'package:to_do_app/core/utils/enums.dart';
import 'package:to_do_app/core/utils/unique_key.dart';
import 'package:to_do_app/core/widget_global/show_loading_dialog.dart';
import 'package:to_do_app/home/presentation/components/detail_component/delete_dialog.dart';
import 'package:to_do_app/home/presentation/controller/bloc_detail/detail_bloc.dart';
import 'package:to_do_app/home/presentation/screen/bottom_sheet.dart';

class DetailToDoScreen extends StatelessWidget {
  final int noteID;
  const DetailToDoScreen(this.noteID, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailBloc>()..add(GetDataNoteEvent(noteID)),
      child: BlocConsumer<DetailBloc, DetailState>(
        listener: (context, state) {
          switch (state.deleteNoteState) {
            case ButtonRequestState.normal:
              break;
            case ButtonRequestState.loading:
              LoadingDialog.show(context, key: UnKey.unKeyDetail);
            case ButtonRequestState.error:
              LoadingDialog.hide(context);
            case ButtonRequestState.success:
              LoadingDialog.hide(context);
              Navigator.pop(context, true);
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor: AppColorsLight.white,
            leading: IconButton(
              onPressed: () => Navigator.pop(context, true),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColorsLight.black,
                size: 25.sF(context),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.access_time,
                  color: AppColorsLight.black,
                  size: 25.sF(context),
                ),
              ),
              editIcon(context),
              deleteIcon(context),
            ],
          ),
          body: BlocBuilder<DetailBloc, DetailState>(
            buildWhen: (previous, current) =>
                previous.requestNoteState != current.requestNoteState,
            builder: (context, state) {
              switch (state.requestNoteState) {
                case ButtonRequestState.normal:
                  return Container();
                case ButtonRequestState.error:
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(IconsAssets.errorIcon),
                      SizedBox(height: 2.sH(context)),
                      Text(
                        state.requestNoteError,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  );
                case ButtonRequestState.loading:
                  return Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          width: double.infinity,
                          height: 5.sH(context),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: AppPadding.p8),
                          child: const Text("Title"),
                        ),
                      ),
                      SizedBox(height: 3.sH(context)),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          width: double.infinity,
                          height: 20.sH(context),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: AppPadding.p8),
                          child: const Text("Title"),
                        ),
                      ),
                    ],
                  );
                case ButtonRequestState.success:
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p16,
                      horizontal: AppPadding.p24,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              state.toDoNote.title,
                              textAlign: detectLanguage(
                                          string: state.toDoNote.title) ==
                                      "ar"
                                  ? TextAlign.right
                                  : TextAlign.left,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              state.toDoNote.subTitle,
                              textAlign: detectLanguage(
                                          string: state.toDoNote.subTitle) ==
                                      "ar"
                                  ? TextAlign.right
                                  : TextAlign.left,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                          Image.memory(
                            base64Decode(state.toDoNote.imageNote),
                            width: double.infinity,
                            height: 50.sH(context),
                            errorBuilder: (context, object, stack) {
                              return const SizedBox.shrink();
                            },
                          ),
                        ].paddingDirectional(bottom: AppPadding.p24),
                      ),
                    ),
                  );
              }
            },
          ),
          bottomNavigationBar: createdNote(context),
        ),
      ),
    );
  }

  Widget deleteIcon(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) => previous.toDoNote != current.toDoNote,
      builder: (context, state) {
        return IconButton(
          onPressed: () => DeleteDialog().open(context).then((value) {
            if (value != null) {
              context.read<DetailBloc>().add(DeleteNoteEven(state.toDoNote.id));
            }
          }),
          visualDensity:
              const VisualDensity(horizontal: VisualDensity.minimumDensity),
          padding: const EdgeInsets.only(right: AppPadding.p8),
          icon: Icon(
            Icons.delete_outline,
            color: AppColorsLight.black,
            size: 25.sF(context),
          ),
        );
      },
    );
  }

  Widget createdNote(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) => previous.toDoNote != current.toDoNote,
      builder: (context, state) {
        return SafeArea(
          child: Text(
            "Created at ${state.toDoNote.dateCreatedNote}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        );
      },
    );
  }

  Widget editIcon(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      buildWhen: (previous, current) => previous.toDoNote != current.toDoNote,
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            BottomSheetScreen()
                .open(context: context, noteID: state.toDoNote.id)
                .then((value) {
              context.read<DetailBloc>().add(
                    GetDataNoteEvent(noteID),
                  );
            });
          },
          visualDensity:
              const VisualDensity(horizontal: VisualDensity.minimumDensity),
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.edit_outlined,
            color: AppColorsLight.black,
            size: 25.sF(context),
          ),
        );
      },
    );
  }
}
