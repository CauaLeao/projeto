import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';

import 'view/Bases/cadastro_usuario_view.dart';
import 'view/Bases/login_view.dart';
import 'view/Bases/perfil_view.dart';
import 'view/Bases/recuperar_senha_view.dart';
import 'view/Bases/sobre_view.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',

      //
      // ROTAS
      //
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginView(),
        'cadastro_usuario': (context) => const CadastroUsuarioView(),
        'perfil': (context) => const PerfilView(),
        'recuperar_senha': (context) => const RecuperarSenhaView(),
        'sobre': (context) => const SobreView(),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      },
    );
  }
}
