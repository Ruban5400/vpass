import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/language/language.dart';
import 'package:visitor_pass/routes/routes.dart';
import 'package:clarity_flutter/clarity_flutter.dart';
import 'constants/constants.dart';
import 'firebase_options.dart';


final config = ClarityConfig(
    projectId: "tgjiyvh3ix",
    logLevel: LogLevel.None
);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  dynamic langValue = const Locale('en', 'US');
  if (box.read('lang') != null) {
    langValue = Locale(box.read('lang'), box.read('langKey'));
  } else {
    langValue = const Locale('en', 'US');
  }

  runApp(ClarityWidget(
    app: VisitorPass(langValue: langValue),
    clarityConfig: config,
  ));
  // runApp(VisitorPass(langValue: langValue));
}

class VisitorPass extends StatelessWidget {
  final dynamic langValue;
  const VisitorPass({super.key, this.langValue});

  @override
  Widget build(BuildContext context) {
    dynamic width = MediaQuery.of(context).size.width;

    if (width <= 600) {
      box.write('isMobile', true);
    } else {
      box.write('isMobile', false);
    }
    if (box.read('isMobile')) {
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );
    }
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Visitor Pass Solution',
            translations: Languages(),
            locale: langValue,
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: AppColor.primaryColor,
            ),
            initialRoute: "/",
            getPages: Routes.pages,
          );
        });
  }
}
