class Usuario {
  String nome;
  int _seguidores;

  Usuario(this.nome, this._seguidores);

  int get seguidores => _seguidores;

  void adicionarSeguidores(int novosSeguidores) {
    if (novosSeguidores > 0) {
      _seguidores += novosSeguidores;
    }
  }

  String postar() {
    return "Postagem realizada!";
  }

  String quantidadeSeguidores() {
    return "O usuário $nome tem $seguidores seguidores.";
  }
}

class Moderador extends Usuario {
  Moderador(String nome, int seguidores) : super(nome, seguidores);

  void banirUsuario(Usuario usuario, bool banido) {
    if (banido == true) {
      print("O usuário ${usuario.nome} foi banido.");
    }
  }
}

void main() {
  Moderador moderador = Moderador("Diana", 2000);

  List<Usuario> usuariosDoApp = [];
  usuariosDoApp.add(Usuario("Ana", 1500));
  usuariosDoApp.add(Usuario("Bruno", 500));
  usuariosDoApp.add(Usuario("Carlos", 90));

  List<Usuario> usuariosBanidos = [];

  for (Usuario usuario in usuariosDoApp) {
    usuario.adicionarSeguidores(50);
  }

  for (Usuario usuario in usuariosDoApp) {
    print(usuario.postar());
    print(usuario.quantidadeSeguidores());
    print("-----");
  }

  bool botaoBanirUsuario = true; // Simulando o clique no botão de banir usuário
  for (Usuario banido in usuariosDoApp) {
    if (banido.nome == "Carlos") {
      botaoBanirUsuario =
          true; // Simulando o clique no botão de banir usuário para Carlos
      break;
    }
  }

  if (botaoBanirUsuario) {
    usuariosBanidos.add(
      usuariosDoApp[2],
    ); // Adicionando o usuário banido à lista de usuários banidos
    usuariosDoApp.removeAt(
      2,
    ); // Removendo o usuário banido da lista de usuários do app
    moderador.banirUsuario(usuariosBanidos[0], true); // Banindo

    print(" ");

    print("Usuários ativos: ");
    for (Usuario ativos in usuariosDoApp) {
      print(ativos.nome);
    }

    print(" ");

    print("Usuários banidos: ");
    for (Usuario banidos in usuariosBanidos) {
      print(banidos.nome);
    }
  }
}
