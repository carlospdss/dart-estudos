class Usuario {
  String nome;
  int _seguidores;

  Usuario(this.nome, this._seguidores);

  int get seguidores => _seguidores;

  void adicionarSeguidores(int novosSeguidores) {
    if(novosSeguidores > 0){
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

void main() {
  List<Usuario> usuariosDoApp = [];
  usuariosDoApp.add(Usuario("Ana", 1500));
  usuariosDoApp.add(Usuario("Bruno", 500));
  usuariosDoApp.add(Usuario("Carlos", 90));

for (Usuario usuario in usuariosDoApp) {
  usuario.adicionarSeguidores(50);
}

  for (Usuario usuario in usuariosDoApp) {
    print(usuario.postar());
    print(usuario.quantidadeSeguidores());
    print("-----");
  }
}