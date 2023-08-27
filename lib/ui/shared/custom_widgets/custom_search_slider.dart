import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../utils.dart';
import 'custom_textfield.dart';

class CustomSearchSlider extends StatefulWidget {
  CustomSearchSlider(
      {super.key,
      required this.Searchcontroller,
      this.currentIndex,
      this.imageList,
      this.heightSlider});
  final TextEditingController Searchcontroller;
  int? currentIndex;
  final List<dynamic>? imageList;
  final double? heightSlider;
  @override
  State<CustomSearchSlider> createState() => _CustomSearchSliderState();
}

class _CustomSearchSliderState extends State<CustomSearchSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          hitText: "بحث",
          controller: widget.Searchcontroller,
          imageNamePrefix: "ic_search",
          visibleImagePrefixIcon: true,
          hintColor: AppColors.SearchgrayColor,
          fillColor: AppColors.mainQrayColor.withOpacity(0.05),
          imagePrefixColor: AppColors.mainTextColor1,
          width: screenWidth(1),
          height: screenWidth(9.5),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: widget.heightSlider,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
            onPageChanged: (index, _) {
              widget.currentIndex = index;
            },
          ),
          items: widget.imageList!.map((item) {
            return Container(
              child: Center(
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageList!.map((url) {
            int index = widget.imageList!.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: widget.currentIndex == index
                    ? AppColors.mainDarkPurple
                    : AppColors.grayColor,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
