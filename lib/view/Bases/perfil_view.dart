import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/usuario_provider.dart';
import '../../models/livro.dart';
import '../../providers/estante_provider.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({super.key});

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  bool _nomeCarregado = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_nomeCarregado) return;
    final nome = context.read<UsuarioProvider>().usuario?.nome;
    if (nome != null) {
      _nomeController.text = nome;
      _nomeCarregado = true;
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  String _iniciais(String nome) {
    final partes = nome.trim().split(RegExp(r'\s+'));
    if (partes.isEmpty || partes.first.isEmpty) return 'BK';
    return partes.take(2).map((parte) => parte[0].toUpperCase()).join();
  }

  void _salvarNome() {
    if (!_formKey.currentState!.validate()) return;
    context.read<UsuarioProvider>().atualizarNome(_nomeController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nome atualizado com sucesso.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final usuario = context.watch<UsuarioProvider>().usuario;
    final estante = context.watch<EstanteProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Meu perfil')),
      body: usuario == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Nenhum usuário está conectado.'),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      'login',
                      (rota) => false,
                    ),
                    child: const Text('Ir para o login'),
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
              children: [
                _CartaoIdentidade(
                  nome: usuario.nome,
                  iniciais: _iniciais(usuario.nome),
                ),
                const SizedBox(height: 24),
                Text('Seus dados', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: _nomeController,
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                              labelText: 'Nome',
                              prefixIcon: Icon(Icons.person_outline),
                              border: OutlineInputBorder(),
                            ),
                            validator: (valor) =>
                                (valor?.trim().length ?? 0) < 3
                                    ? 'O nome precisa ter pelo menos 3 letras'
                                    : null,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.email_outlined),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('E-mail',
                                          style: Theme.of(context)
                                              .textTheme.labelMedium),
                                      const SizedBox(height: 4),
                                      Text(usuario.email),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.lock_outline, size: 18),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            onPressed: _salvarNome,
                            icon: const Icon(Icons.check),
                            label: const Text('Salvar alterações'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Text('Minha estante',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, 'estante'),
                      child: const Text('Abrir estante'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _ContadorEstante(
                        rotulo: 'Lendo',
                        quantidade:
                            estante.quantidadePorStatus(StatusLeitura.lendo),
                        icone: Icons.auto_stories_outlined,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _ContadorEstante(
                        rotulo: 'Lidos',
                        quantidade:
                            estante.quantidadePorStatus(StatusLeitura.lido),
                        icone: Icons.menu_book_outlined,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _ContadorEstante(
                        rotulo: 'Quero ler',
                        quantidade: estante
                            .quantidadePorStatus(StatusLeitura.queroLer),
                        icone: Icons.bookmark_border,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
    );
  }
}

class _CartaoIdentidade extends StatelessWidget {
  const _CartaoIdentidade({required this.nome, required this.iniciais});
  final String nome;
  final String iniciais;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFA87427), Color(0xFF694318)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 34,
            backgroundColor: Colors.white,
            child: Text(
              iniciais,
              style: const TextStyle(
                color: Color(0xFF694318),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SEU ESPAÇO DE LEITURA',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  nome,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Leitor BooKollection',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContadorEstante extends StatelessWidget {
  const _ContadorEstante({
    required this.rotulo,
    required this.quantidade,
    required this.icone,
  });
  final String rotulo;
  final int quantidade;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
        child: Column(
          children: [
            Icon(icone, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text('$quantidade',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    )),
            const SizedBox(height: 2),
            Text(rotulo, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
