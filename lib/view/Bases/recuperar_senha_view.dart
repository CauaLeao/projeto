import 'package:flutter/material.dart';

class RecuperarSenhaView extends StatefulWidget {
  const RecuperarSenhaView({super.key});

  @override
  State<RecuperarSenhaView> createState() => _RecuperarSenhaViewState();
}

class _RecuperarSenhaViewState extends State<RecuperarSenhaView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _enviarSolicitacao() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            'Solicitação enviada para ${_emailController.text.trim()}.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Topo
      appBar: AppBar(title: const Text('Recuperar senha'),
      backgroundColor: const Color.fromARGB(255, 250, 246, 232),
      ),

      backgroundColor: const Color.fromARGB(255, 250, 246, 232),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                const Icon(
                  Icons.mark_email_read_outlined,
                  size: 76,
                  color: Color.fromARGB(255, 142, 96, 23),
                ),


                const SizedBox(height: 24),
                Text(
                  'Esqueceu sua senha?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),


                const SizedBox(height: 12),
                const Text(
                  'Informe o e-mail usado no cadastro. Você verá uma confirmação '
                  'quando a solicitação for enviada.',
                  textAlign: TextAlign.center,
                ),


                const SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),


                  validator: (valor) {
                    final email = valor?.trim() ?? '';
                    final formatoValido =
                        RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email);

                    if (email.isEmpty) return 'Informe seu e-mail';
                    if (!formatoValido) return 'Informe um e-mail válido';
                    return null;
                  },
                  onFieldSubmitted: (_) => _enviarSolicitacao(),
                ),


                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _enviarSolicitacao,
                  icon: const Icon(Icons.send_outlined),
                  label: const Text('Enviar instruções'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    iconColor: const Color.fromARGB(255, 142, 96, 23),
                  ),
                ),


                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Voltar para o login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
