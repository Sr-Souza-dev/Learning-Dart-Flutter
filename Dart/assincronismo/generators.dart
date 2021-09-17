import 'dart:async';

//Gerador sincrono (a cada elemento novo calculado ele faz um retorno atravez do yield)
gerador() {
  Iterable<int> geradorSincrono(int repeticao) sync* {
    int valor = 0;
    while (valor < repeticao) {
      yield ++valor; //Soma 1 e faz um retorno do novo valor
    }
  }

  print(geradorSincrono(10));

  /*
    No gerador assincrono, é criado um stream (canal de comunicação) e a cada 
    novo valor carregado pelo while, ele é disponibilizado neste canal
  */
  Stream<int> geradorAssincrono(int repeticao) async* {
    int valor = 0;
    while (valor < repeticao) {
      await Future.delayed(const Duration(seconds: 1));
      yield ++valor; //Soma 1 e faz um retorno do novo valor
    }
  }

  //o forEach fica esperando o novo valor ser lançado na stream e depois executa a arrow function
  geradorAssincrono(10).forEach((element) => print(element));
}

main() {
  gerador();
}
