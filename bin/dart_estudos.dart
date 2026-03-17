String criarSaudacao (String nome) {
    return "Bem-vindo, $nome!";
  }

void main() {
  String mensagemFinal = criarSaudacao("Carlos");

  print(mensagemFinal);
}
