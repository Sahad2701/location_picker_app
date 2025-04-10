import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:location_picker_app/core/constants/app_const.dart';
import 'package:location_picker_app/core/di/injector.dart';
import 'package:location_picker_app/core/theme/app_theme.dart';
import 'package:location_picker_app/feature/country_state_picker/presentation/cubit/location_cubit.dart';
import 'package:location_picker_app/feature/country_state_picker/presentation/ui/location_picker_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationCubit>(
      create: (_) => GetIt.instance<LocationCubit>(),
      child: MaterialApp(
        title: AppConst.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const LocationPickerScreen(),
      ),
    );
  }
}