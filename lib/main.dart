import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter/pages/choose_topic.dart';
import 'package:movie_flutter/pages/home_page.dart';
import 'package:movie_flutter/utils/theme.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimary,
      ),
      initialRoute: '$HomePage',
      routes: {
        '$HomePage': (_) => const HomePage(),
        '$ChooseTopic': (_) => const ChooseTopic(),
      },
    );
  }
}
