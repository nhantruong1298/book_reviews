import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/app/routes.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupPlatformService();
    });

    RouteBuilder.init();
  }

  void _setupPlatformService() async {
    try {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    } catch (err, _) {
      if (!mounted) return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouteBuilder.router,
      localizationsDelegates: const [
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
        // FormBuilderLocalizations.delegate
      ],
      //supportedLocales: S.delegate.supportedLocales,
    );
  }
}
