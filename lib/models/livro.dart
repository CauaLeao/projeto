enum StatusLeitura { lendo, lido, queroLer }

class Livro {
  Livro({
    required this.titulo,
    required this.autor,
    required this.status,
    this.sinopse = '',
  });

  final String titulo;
  final String autor;
  final String sinopse;
  StatusLeitura status;
}
