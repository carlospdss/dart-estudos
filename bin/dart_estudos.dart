class Usuario {
  String nome;
  int seguidores;

  Usuario(this.nome, this.seguidores);

  String postar() {
    return "Postagem realizada!";
  }

  String quantidadeSeguidores() {
    return "O usuário $nome tem $seguidores seguidores.";
  }
}

void main() {
  Usuario usuario1 = Usuario("Carlos", 90);
  Usuario usuario2 = Usuario("Ana", 1500);

  print(usuario1.postar());
  print(usuario1.quantidadeSeguidores());
  print(usuario2.postar());
  print(usuario2.quantidadeSeguidores());
}

