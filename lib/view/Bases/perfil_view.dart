import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/usuario_provider.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final usuario = context.read<UsuarioProvider>().usuario;
    if (usuario != null) {
      _nomeController.text = usuario.nome;
    }
  }
  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final usuario = context.watch<UsuarioProvider>().usuario;
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: usuario == null
          ? const Center(child: Text('Nenhum usuário logado'))
          : Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: usuario.email,
                    enabled: false, // RF005: só leitura
                    decoration: const InputDecoration(labelText: 'E-mail'),
                  ),
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (valor) {
                      if (valor == null || valor.trim().length < 3) {
                        return 'Informe um nome com pelo menos 3 caracteres';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<UsuarioProvider>().atualizarNome(
                              _nomeController.text.trim(),
                            );
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
    );
  }
}