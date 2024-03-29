import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/app_constance.dart';
import 'package:to_do_app/core/extension/padding_extensions.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/services/services_locator.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/translation/app_string.dart';
import 'package:to_do_app/core/utils/app_values.dart';
import 'package:to_do_app/core/utils/enums.dart';
import 'package:to_do_app/core/utils/unique_key.dart';
import 'package:to_do_app/core/widget_global/custom_date_picker.dart';
import 'package:to_do_app/core/widget_global/custom_text_field.dart';
import 'package:to_do_app/core/widget_global/show_loading_dialog.dart';
import 'package:to_do_app/home/presentation/components/widget/pick_image_dialog.dart';
import 'package:to_do_app/home/presentation/controller/bloc_bottom_sheet/bottom_sheet_bloc.dart';

class BottomSheetScreen {
  Future<dynamic> open({
    required BuildContext context,
    String anyScreen = '',
    int noteID = 0,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColorsLight.primaryColor,
      showDragHandle: true,
      constraints: BoxConstraints(
        minHeight: 90.sH(context),
        maxHeight: 90.sH(context),
        minWidth: double.infinity,
      ),
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) =>
              getIt<BottomSheetBloc>()..add(EditToDoEvent(noteID)),
          child: BlocListener<BottomSheetBloc, BottomSheetState>(
            listenWhen: (previous, current) =>
                previous.saveState != current.saveState,
            listener: (context, state) {
              switch (state.saveState) {
                case ButtonRequestState.normal:
                  break;
                case ButtonRequestState.loading:
                  LoadingDialog.show(context, key: UnKey.unKeyBottomSheet);
                case ButtonRequestState.error:
                  LoadingDialog.hide(context);
                  AppConstance.messageWarning(state.saveError, context);
                  break;
                case ButtonRequestState.success:
                  LoadingDialog.hide(context);
                  Navigator.pop(context, true);
                  break;
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: SizedBox(
                height: 80.sH(context),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _titleWidget(),
                    2.sH(context).sizedHeight,
                    _descWidget(),
                    2.sH(context).sizedHeight,
                    _dateNote(context),
                    2.sH(context).sizedHeight,
                    _imageWidget(context),
                    2.sH(context).sizedHeight,
                    addWidget(context, noteID),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget addWidget(BuildContext context, int noteID) {
    return BlocBuilder<BottomSheetBloc, BottomSheetState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColorsLight.white,
            ),
            onPressed: () {
              if (noteID == 0) {
                context.read<BottomSheetBloc>().add(AddToDoEvent());
              } else {
                context.read<BottomSheetBloc>().add(UpdateToDoEvent(noteID));
              }
            },
            child: Text(
              '${noteID != 0 ? AppString.edit : AppString.add}  ${AppString.toDo}'
                  .toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        );
      },
    );
  }

  Widget _imageWidget(BuildContext context) {
    return BlocBuilder<BottomSheetBloc, BottomSheetState>(
      buildWhen: (previous, current) => previous.image != current.image,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            PickImageDialog().showPicker(context: context).then((value) {
              if (value != null) {
                context.read<BottomSheetBloc>().add(AddImageEvent(value));
              }
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              border: Border.all(
                color: state.image != ''
                    ? AppColorsLight.white
                    : AppColorsLight.white50,
              ),
              borderRadius: BorderRadius.circular(AppBorderRadius.s12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.image != ''
                      ? AppString.imageAddedSuccessfully
                      : "${AppString.add}  ${AppString.image}  (${AppString.optional})",
                  style: TextStyle(
                    fontSize: 14.sF(context),
                    color: state.image != ''
                        ? AppColorsLight.white
                        : AppColorsLight.white50,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.image_outlined,
                  color: state.image != ''
                      ? AppColorsLight.white
                      : AppColorsLight.white50,
                  size: 20.sF(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _dateNote(BuildContext context) {
    return BlocBuilder<BottomSheetBloc, BottomSheetState>(
      buildWhen: (previous, current) => previous.dateNote != current.dateNote,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            CustomDatePicker()
                .showPicker(context, state.dateNote)
                .then((value) {
              if (value != null) {
                context.read<BottomSheetBloc>().add(ChangeDateNoteEvent(value));
              }
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              border: Border.all(
                color: state.dateNote != null
                    ? AppColorsLight.white
                    : AppColorsLight.white50,
              ),
              borderRadius: BorderRadius.circular(AppBorderRadius.s12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.dateNote != null
                      ? AppConstance.formatDate(state.dateNote!)
                      : "${AppString.deadline} (${AppString.optional})",
                  style: TextStyle(
                    fontSize: 14.sF(context),
                    color: state.dateNote != null
                        ? AppColorsLight.white
                        : AppColorsLight.white50,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  color: state.dateNote != null
                      ? AppColorsLight.white
                      : AppColorsLight.white50,
                  size: 20.sF(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _descWidget() {
    return BlocBuilder<BottomSheetBloc, BottomSheetState>(
      builder: (context, state) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColorsLight.white),
              borderRadius: BorderRadius.circular(AppBorderRadius.s12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextField(
                controller: context.read<BottomSheetBloc>().descController,
                style: Theme.of(context).textTheme.titleMedium,
                textInputAction: TextInputAction.done,
                maxLines: null,
                cursorColor: AppColorsLight.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppString.description,
                  hintStyle: TextStyle(
                    fontSize: 15.sF(context),
                    color: AppColorsLight.white50,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _titleWidget() {
    return BlocBuilder<BottomSheetBloc, BottomSheetState>(
      builder: (context, state) {
        return CustomTextField(
          controller: context.read<BottomSheetBloc>().titleController,
          hintText: AppString.title,
          hintTextColor: AppColorsLight.white50,
          fillColor: AppColorsLight.primaryColor,
        );
      },
    );
  }
}
