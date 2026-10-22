class Usuario {
  Usuario({
    required this.nome,
    required this.email,
    this.telefone,
    this.dataNascimento,
  });

  String nome;
  final String email; // RF005: e-mail não é editável
  final String? telefone; 
  final DateTime? dataNascimento;
}