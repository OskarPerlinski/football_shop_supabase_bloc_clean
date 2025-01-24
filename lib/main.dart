import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:football_app/bloc/club_collections/club_collections_cubit.dart';
import 'package:football_app/bloc/splash/splash_cubit.dart';
import 'package:football_app/presentation/splash/splash.dart';
import 'package:football_app/service_locator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await Supabase.initialize(
     url: dotenv.env['SUPABASE_API_URL']!,
    anonKey: dotenv.env['SUPABASE_API_KEY']!,
  );

  await initialzeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..appStated()),
        BlocProvider(create: (context) => ClubCollectionsCubit()..displayClubCollections()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage(), 
      ),
    );
  }
}
