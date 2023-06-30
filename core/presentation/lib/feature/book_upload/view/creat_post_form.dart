import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:presentation/generated/assets.gen.dart';
import 'package:presentation/resources/app_colors.dart';
import 'package:presentation/resources/app_dimensions.dart';
import 'package:presentation/widgets/commons/Spacing.dart';
import 'package:presentation/widgets/commons/layouts/basic_layout.dart';

class CreatedPostForm extends StatefulWidget {
  const CreatedPostForm({super.key});

  @override
  State<CreatedPostForm> createState() => _CreatedPostFormState();
}

class _CreatedPostFormState extends State<CreatedPostForm> {
  String CAPTIONS_FIELD = 'Review';
  String CAPTIONS_NAMEBOOK = "Name";
  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: SingleChildScrollView(
        child: Column(children: [
          Spacing(1),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Nhập tên sách',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Nunito'),
            ),
          ),
          Spacing(1),
          _buildNameBookFIELD(),
          Spacing(2),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Chọn Thể loại sách',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Nunito'),
            ),
          ),
          Spacing(2),
          _buildButtonTagsBooks(),
          Spacing(2),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Chọn Hình sách',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Nunito'),
            ),
          ),
          Spacing(2),
          _buildImageVideoPicker(),
          Spacing(2),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'First Reviews',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Nunito'),
            ),
          ),
          Spacing(2),
          _buildInputCaptionField(),
          Spacing(2),
          _buildButtonSaveAndPublishNow()
        ]),
      ),
    );
  }

  _buildNameBookFIELD() {
    return Container(
      width: 317,
      height: 48,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffD0D5DD)),
          borderRadius: BorderRadius.circular(8)),
      child: Theme(
        data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
        child: FormBuilderTextField(
          name: CAPTIONS_NAMEBOOK,
          maxLines: 7,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w300, fontFamily: 'Nunito'),
          decoration: const InputDecoration.collapsed(
            border: InputBorder.none,
            fillColor: Color(0xff9A9B9C),
            hintText: 'Write a caption...',
          ),
        ),
      ),
    );
  }

  _buildButtonTagsBooks() {
    return Container(
      width: 317,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xffD0D5DD)),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.book),
                      ),
                      SizedBox(
                        child: Text(
                          'Book Tags',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Nunito'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }

  _buildImageVideoPicker() {
    return Container(
      width: 317,
      height: 75,
      child: ListView(
        shrinkWrap: true,
        // itemCount: 2,
        scrollDirection: Axis.horizontal,
        // itemBuilder: (context, index) => InkWell(
        //       child: Container(
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //               image: NetworkImage(
        //                 'https://cdn.tatmart.com/images/detailed/229/1_ij7h-zd.png',
        //               ),
        //               fit: BoxFit.cover),
        //           shape: BoxShape.circle,
        //         ),
        //         width: 65.w,
        //         height: 65.h,
        //         child: Stack(
        //           alignment: AlignmentDirectional.topEnd,
        //           children: [
        //             Container(
        //               width: 18.w,
        //               height: 18.h,
        //               decoration: BoxDecoration(
        //                   shape: BoxShape.circle, color: Colors.black),
        //               child: Icon(
        //                 Icons.close,
        //                 size: 16,
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     )
        children: [
          InkWell(
            child: Container(
              margin: EdgeInsets.only(right: 16),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.tatmart.com/images/detailed/229/1_ij7h-zd.png',
                    ),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
              width: 65,
              height: 65,
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildButtonMorePicker(1),
          _buildButtonMorePicker(1)
        ],
      ),
    );
  }

  _buildInputCaptionField() {
    return Container(
      width: 317,
      height: 158,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffD0D5DD)),
          borderRadius: BorderRadius.circular(8)),
      child: Theme(
        data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
        ),
        child: FormBuilderTextField(
          name: CAPTIONS_FIELD,
          maxLines: 7,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w300, fontFamily: 'Nunito'),
          decoration: const InputDecoration.collapsed(
            border: InputBorder.none,
            fillColor: Color(0xff9A9B9C),
            hintText: 'Write a caption...',
          ),
        ),
      ),
    );
  }

  _buildButtonSaveAndPublishNow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        width: 155,
        height: 38,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor500, width: 2),
            color: AppColors.primaryColor500),
        child: InkWell(
            child: Center(
          child: Text(
            'Publish now',
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
          ),
        )),
      )
    ]);
  }

  Widget _buildButtonMorePicker(int indexBt) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 16),
        width: 65,
        height: 65,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffD0D5DD)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }
}
