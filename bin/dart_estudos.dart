void main() {
  String status = "modificado";

  if (status == "modificado"){
    print("Execute o git add .");
  } else if (status == "staged"){
    print("Execute o git commit");
  } else {
    print ("Tudo ataulizado");
  }
}
