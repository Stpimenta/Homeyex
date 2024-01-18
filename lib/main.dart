import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

//rotas
import './pages/home/home.dart';
import './pages/ifControl/if_control_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //cell sempre em pe
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const MyHome()),
          GetPage(name: '/IfControl', page: () => IfControlView()),
        ],

        //theme
        theme: ThemeData(
            colorScheme: const ColorScheme(
          brightness: Brightness.dark, // Define a luminosidade geral do tema
          primary: Color.fromRGBO(212, 205, 166, 1), // A cor primária do tema
          onPrimary:
              Colors.white, // A cor do texto e ícones em cima da cor primária
          secondary: Colors.white, // A cor secundária do tema
          onSecondary: Color.fromRGBO(212, 205, 166,
              1), // A cor do texto e ícones em cima da cor secundária
          error: Colors.red, // A cor usada para indicar erros
          onError:
              Colors.white, // A cor do texto e ícones em cima da cor de erro
          background:
              Color.fromRGBO(14, 29, 34, 1), // A cor de fundo da aplicação
          onBackground:
              Colors.white, // A cor do texto e ícones em cima da cor de fundo
          surface: Color.fromRGBO(
              14, 29, 34, 1), // A cor de fundo de componentes da interface
          onSurface: Colors
              .white, // A cor do texto e ícones em cima da cor da superfície
        )));
  }
}
