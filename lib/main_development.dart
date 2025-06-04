import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/di/dependency_injection.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/core/routing/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';
import 'core/helpers/shared_preference_helper.dart';
import 'doc_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // Ensure that the screen size is initialized before running the app as release mode.
  await ScreenUtil.ensureScreenSize();
  await checkIfUserLoggedIn();
  runApp(DocApp(appRouter: AppRouter()));
}

checkIfUserLoggedIn() async {
  String? userToken = await SharedPreferenceHelper.getSecuredString(
    SharedPreferenceKeys.userToken,
  );
  if (!userToken.isNullOrEmpty) {
    isUserLoggedIn = true;
  } else {
    isUserLoggedIn = false;
  }
}
