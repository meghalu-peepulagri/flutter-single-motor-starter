import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:starter/app/core/flutter_flow/flutter_flow_theme.dart';
import 'package:starter/app/core/flutter_flow/flutter_flow_util.dart';
import 'package:starter/app/data/storages/shared_preference_helper.dart';
import 'package:starter/app/presentation/routes/app_pages.dart';
import 'package:starter/app/presentation/routes/app_routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  await FlutterFlowTheme.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  @override
  void initState() {
    print("line 268 ----------->");
    super.initState();
    
  }


  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peepul Agri',
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      initialRoute: SharedPreferenceHelper.getAccessToken().isNotEmpty
          ? Routes.dashboard
          : Routes.splash,
      getPages: AppPages.getPages,
    );
  }
}

