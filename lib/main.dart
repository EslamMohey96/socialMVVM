import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
// import 'package:social_app/layout/socialLayout.dart';
// import 'package:social_app/shared/components/constants.dart';
// import 'package:social_app/shared/cubit/loginCubit/loginStates.dart';
// import 'package:social_app/shared/cubit/socialCubit/socialCubit.dart';
// import 'package:social_app/shared/network/local/cacheHelper.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/constants.dart';
import 'package:social/core/utils/bloc_observer.dart';
import 'package:social/core/utils/cacheHelper.dart';
import 'package:social/feature/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:social/feature/login/presentation/views/login_view.dart';
import 'package:social/feature/register/presentation/manager/register_cubit/register_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:social_app/modules/userScreens/loginScreen/logInScreen.dart';
// import 'package:social_app/shared/components/blocObserver.dart';
// import 'package:social_app/shared/cubit/loginCubit/loginCubit.dart';
// import 'package:social_app/shared/cubit/registerCubit/registerCubit.dart';
// import 'package:social_app/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
      (value) => print("done ${Firebase.app().options.projectId.toString()}"));
// FirebaseCrashlytics.instance.crash();
FirebasePerformance.instance;

  Bloc.observer = HandelBlocObserver();
  // dioHelper.init();
  await cacheHelper.init();

  Widget startPage;
  uIdConst = cacheHelper.getData(key: 'uId') ?? '';
  bool? isLogin = uIdConst == '' ? false : true;
  // if (uIdConst == '') {
  //   startPage = const LoginView();
  // } else {
  //   startPage = socialLayout();
  // }
  startPage = const LoginView();

  runApp(MyApp(
    startPage,
  ));
}

class MyApp extends StatelessWidget {
  Widget startPage;
   MyApp(
    this.startPage,
  );

  @override
  Widget build(BuildContext context) {
       return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
        ),
        // BlocProvider(
        //   create: (BuildContext context) =>
        //       socialCubit()..getUserData(uIdConst),
        // ),
      ],
    // BlocProvider(
    //   create: (context) {
    //     return LoginCubit();
    //   }
      
      child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              // theme: lightMode,
              // darkTheme: darkMode,
              themeMode: ThemeMode.dark,
              home: LayoutBuilder(
                builder: (context, constraints) {
                  if (LoginCubit.get(context).constraints !=
                      constraints.minWidth.round()) {
                    LoginCubit.get(context).changeConstraints(
                      constraints.minWidth.round(),
                    );
                  }
                  return startPage;
                },
              ),
            );
          }),
    );
    //   LayoutBuilder(builder: (context, constraints) {
    //     // myLoginCubit.get(context).changeConstraints(constraints.minWidth.round() );
    //     return startPage;
    //   }),
    // );
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (BuildContext context) => LoginCubit(),
    //     ),
    //     BlocProvider(
    //       create: (BuildContext context) => registerCubit(),
    //     ),
    //     BlocProvider(
    //       create: (BuildContext context) =>
    //           socialCubit()..getUserData(uIdConst),
    //     ),
    //   ],
    //   child: BlocConsumer<myLoginCubit, myLoginStates>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       return MaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         theme: lightMode,
    //         darkTheme: darkMode,
    //         themeMode: ThemeMode.dark,
    //         home: LayoutBuilder(builder: (context, constraints) {
    //           myLoginCubit.get(context).changeConstraints(constraints.minWidth.round() );
    //           return startPage;
    //         }),
    //       );
    //     },
    //   ),
    // );
  }
}
