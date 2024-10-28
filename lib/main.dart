import 'package:Islami/core/helper/db_helper.dart';
import 'package:Islami/core/provider/prayer_time_provider.dart';
import 'package:Islami/core/provider/radio_provider.dart';
import 'package:Islami/core/provider/reciter_provider.dart';
import 'package:Islami/core/services/reciter_services.dart';
import 'package:Islami/core/utils/colors.dart';
import 'package:Islami/core/utils/routes.dart';
import 'package:Islami/data/datasource/prayer_time_api.dart';
import 'package:Islami/data/datasource/radio_datasource.dart';
import 'package:Islami/data/repository/radio_repo_impl.dart';
import 'package:Islami/data/repository/reciter_repo.dart';
import 'package:Islami/domain/usecase/get_prayer_time_usecase.dart';
import 'package:Islami/domain/usecase/radio_usecase.dart';
import 'package:Islami/domain/usecase/reciter_secase.dart';
import 'package:Islami/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.database; // Initialize database

  // Initialize Dio for network requests
  final dio = Dio();

  // Create the Remote Data Source for radio
  final remoteDataSource = RemoteDataSource(dio);

  // Create the Radio Repository
  final radioRepository = RadioRepositoryImpl(remoteDataSource);

  // Create the GetRadios Use Case
  final getRadiosUseCase = GetRadiosUseCase(radioRepository);

  // Create the Reciter Repository and Use Case
  final reciterRepository = RecitersRepository(ApiService());
  final fetchRecitersUseCase = FetchRecitersUseCase(reciterRepository);

  // Initialize PrayerTime API and Use Case
  final prayerTimeApi = PrayerTimeApi();
  final getPrayerTimesUseCase = GetPrayerTimesUseCase(prayerTimeApi);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RadioProvider(getRadiosUseCase)),
        ChangeNotifierProvider(create: (_) => ReciterProvider(fetchRecitersUseCase)),
        ChangeNotifierProvider(create: (_) => PrayerTimeProvider(getPrayerTimesUseCase)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // Default to English

  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.secondary,
        useMaterial3: true,
      ),
      routes: AppRoutes.routes(_setLocale),
      initialRoute: AppRoutes.splash,
    );
  }
}
