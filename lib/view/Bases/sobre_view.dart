import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 46,
              backgroundColor: Color.fromARGB(255, 248, 225, 124),
              child: Icon(
                Icons.auto_stories,
                size: 52,
                color: Color.fromARGB(255, 142, 96, 23),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'BooKollection',
              textAlign: TextAlign.center,
              style: GoogleFonts.alfaSlabOne(
                  fontSize: 20,
                  color:  const Color.fromARGB(255, 142, 96, 23),
                ),
            ),
            const SizedBox(height: 8),
            Text(
              'Versão 1.0.0',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sobre o aplicativo',
                      style: GoogleFonts.lato(
                        fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'O BooKollection é um espaço para leitores, estudantes e '
                      'pesquisadores organizarem suas leituras e compartilharem '
                      'citações, recomendações, artigos e ideias. Também permite '
                      'descobrir comunidades e conversar com pessoas interessadas '
                      'nos mesmos assuntos.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: const [
                  _InformacaoAcademica(
                    icone: Icons.person_outline,
                    titulo: 'Aluno',
                    valor: 'Cauã Vitor Gonçalves Leão',
                  ),
                  Divider(height: 1),
                  _InformacaoAcademica(
                    icone: Icons.menu_book_outlined,
                    titulo: 'Disciplina',
                    valor: 'Eletiva a dispositivos móveis',
                  ),
                  Divider(height: 1),
                  _InformacaoAcademica(
                    icone: Icons.school_outlined,
                    titulo: 'Instituição',
                    valor: 'FATEC Ribeirão Preto',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Projeto acadêmico • BooKollection',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Voltar para o login'),
                  
                ),
          ],
        ),
      );
    }
  }

  class _InformacaoAcademica extends StatelessWidget {
    const _InformacaoAcademica({
      required this.icone,
      required this.titulo,
      required this.valor,
    });

    final IconData icone;
    final String titulo;
    final String valor;

    @override
    Widget build(BuildContext context) {
      return ListTile(
        leading: Icon(icone),
        title: Text(titulo),
        subtitle: Text(valor),
    );
  }
}
