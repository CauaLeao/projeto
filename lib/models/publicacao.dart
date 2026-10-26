enum TipoPublicacao { citacao, livro, artigo }

class Publicacao {
  Publicacao({
    required this.tipo,
    required this.autor,
    required this.titulo,
    required this.conteudo,
    required this.detalhe,
    required this.avaliacao,
    required this.curtidas,
    required this.comentarios,
  });

  final TipoPublicacao tipo;
  final String autor;
  final String titulo;
  final String conteudo;
  final String detalhe;
  final double avaliacao;
  int curtidas;
  int comentarios;
  bool curtido = false;
}