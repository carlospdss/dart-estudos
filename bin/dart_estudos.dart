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
  List<Usuario> usuariosDoApp = [];
  usuariosDoApp.add(Usuario("Ana", 1500));
  usuariosDoApp.add(Usuario("Bruno", 500));
  usuariosDoApp.add(Usuario("Carlos", 90));

  for (Usuario usuario in usuariosDoApp) {
    print(usuario.postar());
    print(usuario.quantidadeSeguidores());
    print("-----");
  }
}

