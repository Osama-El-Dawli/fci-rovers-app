import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fci_rovers_app/core/widgets/custom_title_widget.dart';
import 'package:fci_rovers_app/core/widgets/custom_slider.dart';
import 'package:fci_rovers_app/features/home/cubits/image_cubit/images_cubit.dart';
import 'package:fci_rovers_app/features/home/widgets/error_card.dart';
import 'package:fci_rovers_app/features/home/widgets/loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomTitleWidget(title: 'معرض الصور'),
        SizedBox(height: isMobile ? 24 : 45),
        BlocBuilder<ImagesCubit, ImagesState>(
          builder: (context, state) {
            if (state is ImageSuccess) {
              return CustomSlider(
                items: state.images,
                itemBuilder: (context, item, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: WidgetZoom(
                      heroAnimationTag: 'gallery_image_$index',
                      zoomWidget: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: item,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 36.0),
                              child: LoadingCard(),
                            ),
                            errorWidget: (context, url, error) =>
                                const ErrorCard(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is ImagesFailure) {
              log(state.errMessage);
              return CustomSlider(
                items: [1, 2, 3],
                itemBuilder: (context, item, index) => const ErrorCard(),
              );
            } else {
              return CustomSlider(
                items: [1, 2, 3],
                itemBuilder: (context, item, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: LoadingCard(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
