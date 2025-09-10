import 'package:fci_rovers_app/core/widgets/adaptive_layout.dart';
import 'package:fci_rovers_app/features/home/cubits/image_cubit/images_cubit.dart';
import 'package:fci_rovers_app/features/home/cubits/videos_cubit/videos_cubit.dart';
import 'package:fci_rovers_app/features/home/views/home_desktop.dart';
import 'package:fci_rovers_app/features/home/views/home_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewLayout extends StatelessWidget {
  const HomeViewLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ImagesCubit()..getImages()),
        BlocProvider(create: (context) => VideosCubit()..getVideos()),
      ],
      child: AdaptiveLayout(
        mobileLayout: (context) => const HomeMobile(),
        desktopLayout: (context) => const HomeDesktop(),
      ),
    );
  }
}
