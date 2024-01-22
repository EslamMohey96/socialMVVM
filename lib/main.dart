import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:social/constants.dart';
import 'package:social/core/utils/bloc_observer.dart';
import 'package:social/core/utils/cacheHelper.dart';
import 'package:social/feature/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:social/feature/login/presentation/views/login_view.dart';
import 'package:social/feature/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:social/feature/social_layout/presentation/manager/social_cubit/social_cubit.dart';
import 'package:social/feature/social_layout/presentation/views/social_layout.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
      (value) => Println("done ${Firebase.app().options.projectId.toString()}"));
FirebasePerformance.instance;

  Bloc.observer = HandelBlocObserver();
  // dioHelper.init();
  await cacheHelper.init();

  Widget startPage;
  uIdConst = cacheHelper.getData(key: 'uId') ?? '';
  if (uIdConst == '') {
    startPage = const LoginView();
  } else {
    startPage = const SocialLayout();
  }

  runApp(MyApp(
    startPage: startPage,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startPage;

  const MyApp({super.key ,required this.startPage,});
 

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
        BlocProvider(
          create: (BuildContext context) =>
              SocialCubit()..getUserData(uIdConst),
        ),
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: lightMode,
            // darkTheme: darkMode,
            themeMode: ThemeMode.dark,
            home: LayoutBuilder(builder: (context, constraints) {
              LoginCubit.get(context).changeConstraints(constraints.minWidth.round() );
              return startPage;
            }),
          );
        },
      ),
    );
  }
}
