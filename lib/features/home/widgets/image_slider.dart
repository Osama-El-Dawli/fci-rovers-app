import 'package:carousel_slider/carousel_slider.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  final List<String> images = [
    'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
    'https://static.vecteezy.com/system/resources/thumbnails/036/324/708/small/ai-generated-picture-of-a-tiger-walking-in-the-forest-photo.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(flex: 1),
            Expanded(
              flex: 4,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount: images.length,
                    itemBuilder: (context, index, _) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Image.network(
                          images[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      viewportFraction: 0.7,
                      enlargeCenterPage: false,
                    ),
                  ),
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.background.withValues(alpha: 0.9),
                              AppColors.background.withValues(alpha: 0.0),
                              AppColors.background.withValues(alpha: 0.0),
                              AppColors.background.withValues(alpha: 0.9),
                            ],
                            stops: const [0.0, 0.1, 0.9, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -30,
                    child: _arrowButton(
                      icon: Icons.arrow_forward_ios,
                      onTap: () => _controller.previousPage(),
                    ),
                  ),
                  Positioned(
                    right: -30,
                    child: _arrowButton(
                      icon: Icons.arrow_back_ios_new,
                      onTap: () => _controller.nextPage(),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ],
    );
  }

  Widget _arrowButton({required IconData icon, required VoidCallback onTap}) {
    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, size: 30, color: AppColors.background),
      ),
    );
  }
}
