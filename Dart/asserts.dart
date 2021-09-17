main() {
  try {
    var text;
    //'assert' verifica a entrada com a condição estabelecida, caso não seja respeitada emite um erro
    //É utilizado no momento de desenvolvimento para testes de logica
    assert(text != null, 'O texto tem que ser diferente de NULL');
    print('Finish');
  } catch (problem) {
    print(problem);
  }
}
