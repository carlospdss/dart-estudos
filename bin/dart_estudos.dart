import 'dart:io';
import 'dart:math';

class Gerenciador {
  List<Usuario> bancoDeUsuarios = [];
  List<Usuario> bancoDeBanidos = [];

  void adicionarUsuario(Usuario usuario) {
    usuario.id = proximoId();
    bancoDeUsuarios.add(usuario);
    print(
      "Usuário ${usuario.nome} adicionado, seu ID de usuário é: ${usuario.id}",
    );
  }

  void adicionarBanido(Usuario usuario) {
    bancoDeBanidos.add(usuario);
  }

  void removerUsuario(Usuario usuario) {
    bancoDeUsuarios.remove(usuario);
  }

  void removerBanido(Usuario usuario) {
    bancoDeBanidos.remove(usuario);
  }

  bool verificarUsuario(String usuario, String senha) {
    for (Usuario u in bancoDeUsuarios) {
      if (u.usuario == usuario && u.senha == senha) {
        return true;
      }
    }
    return false;
  }

  Usuario? verificarId(int id) {
    for (Usuario u in bancoDeUsuarios) {
      if (u.id == id) {
        return u;
      }
    }
    return null;
  }

  int proximoId() {
    if (bancoDeUsuarios.isEmpty) {
      return 1;
    } else {
      return bancoDeUsuarios.last.id + 1;
    }
  }
}

class Usuario {
  String nome;
  int _seguidores = 0;
  String _usuario;
  String _senha;
  bool estaAtivo = true;
  int id;
  final List<String> nivelAcesso = [
    "Visitante",
    "Leitor",
    "Colaborador",
    "Moderador",
    "Administrador",
  ];

  Usuario(this.nome, this._usuario, this._senha, this.id);

  int get seguidores => _seguidores;
  String get usuario => _usuario;
  String get senha => _senha;

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
  Moderador(String nome, String usuario, String senha, int id)
    : super(nome, usuario, senha, id);

  String get nivel => nivelAcesso[3];

  void banirUsuario(int id, Usuario usuario, bool banido) {
    // Definindo o status do usuário como inativo se banido for true
    if (banido == true) {
      usuario.estaAtivo = false;
      print("O usuário ${usuario.nome} foi banido.");
    }
  }
}

class Login {
  String usuario;
  String senha;
  Gerenciador gerenciador = Gerenciador();

  Login(this.usuario, this.senha, this.gerenciador);

  Future<bool> fazerLogin() async {
    print("Verificando credenciais...");
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  String login() {
    bool usuarioVerificado = false;
    String nomeUsuario = "";

    for (Usuario u in this.gerenciador.bancoDeUsuarios) {
      if (u.usuario == this.usuario && u.senha == this.senha) {
        usuarioVerificado = true;
        nomeUsuario = u.nome;
        break;
      }
    }
    if (usuarioVerificado == true) {
      return "Login bem-sucedido! Bem-vindo, $nomeUsuario!";
    } else {
      return "Credenciais inválidas. Tente novamente.";
    }
  }
}

void main() async {
  Gerenciador gerenciador = Gerenciador();

  bool continuar = true;
  int opcao = 0;
  bool sucesso = false;

  while (continuar) {
    print("Bem-vindo ao aplicativo de estudos!");
    print("1. Criar conta");
    print("2. Fazer login");
    print("3. Ver usuários ativos");
    print("4. Ver usuários banidos");
    print("5. Banir usuário");
    print("6. Sair");
    print("Digite a opção desejada:");
    try {
      opcao = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print(
        "Entrada inválida. Por favor, digite um número válido entre as opções do menu.",
      );
      continue;
    }
    switch (opcao) {
      case 1:
        print("Digite seu nome:");
        String? entrada = stdin.readLineSync();
        print("Crie seu nome de usuário:");
        String? usuarioEntrada = stdin.readLineSync();
        print("Crie sua senha:");
        String? senhaEntrada = stdin.readLineSync();
        Usuario novoUsuario = Usuario(
          entrada!,
          usuarioEntrada!,
          senhaEntrada!,
          0,
        );
        gerenciador.adicionarUsuario(novoUsuario);
        print(
          "Conta criada com sucesso! Bem-vindo, Faça login para acessar sua conta.",
        );
        break;
      case 2:
        print("Digite seu usuario:");
        String? usuario = stdin.readLineSync();
        print("Digite sua senha:");
        String? senha = stdin.readLineSync();
        Login login = Login(usuario!, senha!, gerenciador);
        sucesso = await login.fazerLogin();
        if (sucesso) {
          print(login.login());
        }
        break;
      case 3:
        print("Exibindo usuários ativos...");
        for (Usuario ativo in gerenciador.bancoDeUsuarios) {
          if (ativo.estaAtivo) {
            print("${ativo.nome}, ${ativo.usuario} ${ativo.id}");
          }
        }
        break;
      case 4:
        print("Exibindo usuários banidos...");
        for (Usuario banido in gerenciador.bancoDeBanidos) {
          print(banido.nome);
        }
        break;
      case 5:
        print("Digite o ID do usuário que deseja banir:");
        try {
          int id = int.parse(stdin.readLineSync()!);
        } catch (e) {
          print(
            "Entrada inválida. Por favor, digite um número válido para o ID do usuário.",
          );
          break;
        }
        Usuario? procurarUsuario = gerenciador.verificarId(id);

        if (procurarUsuario != null) {
          gerenciador.adicionarBanido(procurarUsuario);
          gerenciador.removerUsuario(procurarUsuario);
          break;
        } else {
          print("ID inválido. Por favor, tente novamente.");
        }
        break;
      case 6:
        print("Saindo do aplicativo. Até logo!");
        continuar = false;
        break;
      default:
        print("Opção inválida. Por favor, escolha uma opção válida.");
    }
  }
}
