import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pearson_flutter/events/authentication_events.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/providers/app_settings.dart';
import 'package:pearson_flutter/screens/exercise/answer_status.dart';
import 'package:pearson_flutter/screens/registration/login.dart';
import 'package:pearson_flutter/splash_screen.dart';
import 'package:pearson_flutter/states/authentication_states.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/utils/session.dart';
import 'package:provider/provider.dart';

import 'blocs/authentication_bloc.dart';

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Session.init();
  var _authenticationBloc = AuthenticationBloc(AuthenticationUninitialized());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppSettings>(
          create: (_) => AppSettings(),
        ),
        BlocProvider(create: (BuildContext context) {
          return _authenticationBloc..add(AppStarted());
        })
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppConfig.kSwatch[900],
      ),
    );
    return Consumer<AppSettings>(
      builder: (_, AppSettings settings, __) {
        var _textTheme = TextTheme(
          bodyText1: TextStyle(
            color: AppConfig.kSwatch,
            fontSize: 14.0 * settings.textScale,
            fontWeight: FontWeight.bold,
            fontFamily: settings.fontName,
          ),
          bodyText2: TextStyle(
            color: AppConfig.kSwatch,
            fontSize: 14.0 * settings.textScale,
            fontFamily: settings.fontName,
          ),
          subtitle1: TextStyle(
            color: AppConfig.kSwatch,
            fontSize: 18 * settings.textScale,
            fontWeight: FontWeight.w900,
            fontFamily: settings.fontName,
          ),
          subtitle2: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 14.0 * settings.textScale,
          ),
          headline1: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 35 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline2: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 28 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline3: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 24 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline4: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 21 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline5: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 18 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline6: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 16 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          caption: TextStyle(
            color: AppConfig.kSwatch[400],
            fontFamily: settings.fontName,
            fontSize: 13 * settings.textScale,
            fontWeight: FontWeight.w300,
          ),
          button: TextStyle(
            color: AppConfig.kSwatch,
            fontWeight: FontWeight.w900,
            fontSize: 12 * settings.textScale,
            fontFamily: settings.fontName,
          ),
          overline: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 14.0 * settings.textScale,
          ),
        );
        var _textThemeDark = TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 14.0 * settings.textScale,
            fontFamily: settings.fontName,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 14.0 * settings.textScale,
            fontFamily: settings.fontName,
          ),
          subtitle1: TextStyle(
            color: Colors.white,
            fontSize: 18.0 * settings.textScale,
            fontWeight: FontWeight.w900,
            fontFamily: settings.fontName,
          ),
          subtitle2: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 14.0 * settings.textScale,
          ),
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 35 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 28 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline3: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 24 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline4: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 21 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline5: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 18 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline6: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 16 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          caption: TextStyle(
            color: Colors.white70,
            fontFamily: settings.fontName,
            fontSize: 14 * settings.textScale,
            fontWeight: FontWeight.w300,
          ),
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 12 * settings.textScale,
            fontFamily: settings.fontName,
          ),
          overline: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 14.0 * settings.textScale,
          ),
        );

        var _inputTheme = InputDecorationTheme(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppConfig.kDividerColor, width: 0.5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppConfig.kDividerColor, width: 0.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(settings.color), width: 1),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppConfig.kErrorColor, width: 0.5),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppConfig.kErrorColor, width: 1),
          ),
        );

        var _inputThemeDark = InputDecorationTheme(
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppConfig.kDividerColorDark, width: 0.5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppConfig.kDividerColorDark, width: 0.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(settings.color), width: 1),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: AppConfig.kErrorColorDark, width: 0.5),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppConfig.kErrorColorDark, width: 1),
          ),
        );

        var _theme = ThemeData(
          primarySwatch: AppConfig.kSwatch,
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
            height: 36,
            buttonColor: Color(settings.color),
          ),
          popupMenuTheme: PopupMenuThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
          ),
          primaryColor: Colors.white,
          canvasColor: Colors.white,
          accentColor: Color(settings.color),
          buttonColor: Color(settings.color),
          cardColor: Colors.white,
          secondaryHeaderColor: AppConfig.kHeaderColor,
          backgroundColor: AppConfig.kSwatch[50],
          dividerColor: AppConfig.kSwatch[100],
          hintColor: AppConfig.kSwatch[200],
          primaryColorBrightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          textTheme: _textTheme,
          inputDecorationTheme: _inputTheme,
          appBarTheme: AppBarTheme(
            textTheme: _textTheme,
            elevation: 1.0,
            // brightness: Brightness.dark,
            // actionsIconTheme: IconThemeData(color: Color(settings.color)),
          ),
          chipTheme: ChipThemeData(
            backgroundColor: AppConfig.kSwatch[50],
            disabledColor: AppConfig.kSwatch,
            selectedColor: Color(settings.color),
            secondarySelectedColor: Color(settings.color),
            padding: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
            labelStyle: _textTheme.bodyText2,
            secondaryLabelStyle:
                _textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),
            brightness: Brightness.light,
          ),
          iconTheme: IconThemeData(color: AppConfig.kSwatch),
          fontFamily: settings.fontName,
        );
        var _darkTheme = ThemeData(
          primarySwatch: AppConfig.kSwatch,
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
            height: 36,
            buttonColor: Color(settings.color),
          ),
          popupMenuTheme: PopupMenuThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
          ),
          inputDecorationTheme: _inputThemeDark,
          primaryColor: AppConfig.kSwatch,
          canvasColor: AppConfig.kSwatch,
          accentColor: Color(settings.color),
          buttonColor: Color(settings.color),
          secondaryHeaderColor: AppConfig.kHeaderColorDark,
          cardColor: AppConfig.kSwatch,
          hintColor: Colors.white38,
          disabledColor: AppConfig.kSwatch[200],
          backgroundColor: AppConfig.kSwatch[900],
          brightness: Brightness.dark,
          accentColorBrightness: Brightness.dark,
          primaryColorBrightness: Brightness.dark,
          scaffoldBackgroundColor: AppConfig.kSwatch,
          textTheme: _textThemeDark,
          appBarTheme: AppBarTheme(
            textTheme: _textThemeDark,
            elevation: 0.0,
            color: AppConfig.kSwatch[900],
            // actionsIconTheme: IconThemeData(color: Color(settings.color)),
          ),
          chipTheme: ChipThemeData(
            backgroundColor: AppConfig.kSwatch[900],
            disabledColor: AppConfig.kSwatch,
            selectedColor: Color(settings.color),
            secondarySelectedColor: Color(settings.color),
            padding: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
            labelStyle: _textThemeDark.button,
            secondaryLabelStyle: _textThemeDark.button,
            brightness: Brightness.dark,
          ),
          dividerColor: Color(0x33ffffff),
          iconTheme: IconThemeData(color: Colors.white),
          fontFamily: settings.fontName,
        );

        return MaterialApp(
          theme: _theme,
          darkTheme: _darkTheme,
          themeMode: ThemeMode.light,
          routes: {
            "/home": (_) => HomePage(),
            "/report": (_) => AnswerStatus(),
          },
          // themeMode: settings.themeMode,
          // supportedLocales: [
          //   Locale('en', 'US'),
          //   Locale('es'),
          // ],
          // locale: settings.locale,
          // localizationsDelegates: [
          //   AppLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          // ],
          // routes: {
          //   '/login': (context) => Login(),
          //   '/home': (context) => Home(),
          //   '/splash': (context) => Splash(),
          // },
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (BuildContext context, AuthenticationState state) {
              if (state is AuthenticationUninitialized) {
                return SplashScreen();
              } else if (state is AppLoggedIn) {
                return HomePage();
              } else
                return LoginPage();
            },
          ),
        );
      },
    );
  }
}
