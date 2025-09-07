import 'package:flutter/material.dart';
import 'package:fci_rovers_app/core/utils/app_colors.dart';
import 'package:fci_rovers_app/features/home/views/home_view_layout.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  runApp(const FciRoversApp());
}

class FciRoversApp extends StatelessWidget {
  const FciRoversApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: const String.fromEnvironment(
        'APP_NAME',
        defaultValue: 'FCI Rovers App',
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      home: const HomeViewLayout(),
    );
  }
}
