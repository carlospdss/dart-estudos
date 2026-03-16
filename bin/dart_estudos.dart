void formatarStatus({required String nome, String usuario = "Desconhecido"}) {
    print("LOG: O arquivo $nome foi processado por $usuario.");
  }

void main() {
  formatarStatus(nome: "main.dart", usuario: "Felipe");
  formatarStatus(nome: "README.md");
}
