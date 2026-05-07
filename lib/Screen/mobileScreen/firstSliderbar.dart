import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Firstsliderbar extends StatelessWidget {
  Firstsliderbar({super.key, required this.images});
  final List<String> images;
  final carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    if (images.isNotEmpty) {
      return sliderBar();
    } else {
      return SizedBox.shrink();
    }
  }

  Widget sliderBar() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            items: images.map((image) {
              return Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 300,
              viewportFraction: 1.0,
              aspectRatio: 2.0,
              initialPage: 0,
              autoPlay: false,
              enlargeCenterPage: true,
            ),
          ),
          Positioned(
            left: 10,
            top: 75,
            bottom: 75,
            child: ElevatedButton(
              onPressed: () => carouselController.previousPage(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.zero,
                minimumSize: const Size(45, 45),
              ),
              child: Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          Positioned(
            right: 10,
            top: 75,
            bottom: 75,
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () => carouselController.nextPage(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(45, 45),
                ),
                child: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
