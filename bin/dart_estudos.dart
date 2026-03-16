void formatarStatus(String nome) {
    print("LOG: O arquivo $nome foi processado.");
  }

void main() {
  List<String> alteracoes = ["adicionado", "modificado", "removido"];
  for (String item in alteracoes) {
    formatarStatus(item);
  }
}
