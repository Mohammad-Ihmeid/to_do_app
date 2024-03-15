import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:to_do_app/core/extension/padding_extensions.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/translation/detect_language.dart';
import 'package:to_do_app/core/utils/app_values.dart';
import 'package:to_do_app/home/domain/entities/to_do.dart';

class DetailToDoScreen extends StatelessWidget {
  final ToDo detailToDo;
  const DetailToDoScreen(this.detailToDo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsLight.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColorsLight.black,
            size: 25.sF(context),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            visualDensity:
                const VisualDensity(horizontal: VisualDensity.minimumDensity),
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.access_time,
              color: AppColorsLight.black,
              size: 25.sF(context),
            ),
          ),
          IconButton(
            onPressed: () {},
            visualDensity:
                const VisualDensity(horizontal: VisualDensity.minimumDensity),
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.edit_outlined,
              color: AppColorsLight.black,
              size: 25.sF(context),
            ),
          ),
          IconButton(
            onPressed: () {},
            visualDensity:
                const VisualDensity(horizontal: VisualDensity.minimumDensity),
            padding: const EdgeInsets.only(right: AppPadding.p8),
            icon: Icon(
              Icons.delete_outline,
              color: AppColorsLight.black,
              size: 25.sF(context),
            ),
          ),
        ],
      ),
      body: Padding(
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
                  detailToDo.title,
                  textAlign: detectLanguage(string: detailToDo.title) == "ar"
                      ? TextAlign.right
                      : TextAlign.left,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  detailToDo.subTitle,
                  textAlign: detectLanguage(string: detailToDo.subTitle) == "ar"
                      ? TextAlign.right
                      : TextAlign.left,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              Image.memory(
                base64Decode(detailToDo.imageNote),
                width: double.infinity,
                height: 50.sH(context),
                errorBuilder: (context, object, stack) {
                  return const SizedBox.shrink();
                },
              ),
            ].paddingDirectional(bottom: AppPadding.p24),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: AppPadding.p8),
        child: Text(
          "Created at ${detailToDo.dateCreatedNote}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}