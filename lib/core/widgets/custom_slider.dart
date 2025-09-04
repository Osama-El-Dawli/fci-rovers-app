import 'package:carousel_slider/carousel_slider.dart';
import 'package:fci_rovers_app/core/widgets/custom_dots.dart';
import 'package:flutter/material.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
    required this.items,
    required this.itemBuilder,
  });

  final List<String> items;
  final Widget Function(BuildContext context, String item, int index)
  itemBuilder;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState<T> extends State<CustomSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _currentIndex = 0;

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
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return CarouselSlider.builder(
                        carouselController: _controller,
                        itemCount: widget.items.length,
                        itemBuilder: (context, index, _) {
                          final item = widget.items[index];
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: constraints.maxHeight,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: widget.itemBuilder(context, item, index),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          aspectRatio: 16 / 6,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.6,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) => setState(() {
                            _currentIndex = index;
                          }),
                        ),
                      );
                    },
                  ),
                  Positioned.fill(
                    right: -2,
                    left: -2,
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
                            stops: const [0.0, 0.15, 0.85, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -30,
                    child: _arrowButton(
                      icon: Icons.arrow_forward_ios,
                      onTap: () => _controller.nextPage(),
                    ),
                  ),
                  Positioned(
                    right: -30,
                    child: _arrowButton(
                      icon: Icons.arrow_back_ios_new,
                      onTap: () => _controller.previousPage(),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
          ],
        ),
        SizedBox(height: 24),
        CustomDots(
          dotsCount: widget.items.length,
          position: (widget.items.length - 1 - _currentIndex).toDouble(),
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
