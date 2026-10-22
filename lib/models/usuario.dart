class Usuario {
  Usuario({
    required this.nome,
    required this.email,
  });

  String nome;
  final String email; // RF005: e-mail não é editável
}