import 'package:flutter/foundation.dart';
import '../models/usuario.dart';

class UsuarioProvider extends ChangeNotifier {
  Usuario? _usuario;

  Usuario? get usuario => _usuario;

  void definirUsuario(Usuario usuario) {
    _usuario = usuario;
    notifyListeners(); // avisa as telas que escutam
  }

  void atualizarNome(String novoNome) {
    if (_usuario == null) return;
    _usuario!.nome = novoNome;
    notifyListeners();
  }
}