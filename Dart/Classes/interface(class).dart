//Uma interface em dart é feita por uma class
//É obrigatório rescrever todos os metodos implementados na class superior
//Serve para obrigar ao programador a implementar todos os metodos da class superior

main() {
  var TV = SmartTV();
  TV.volumeUp();
  TV.volumeDown();
  TV.netWorkConection();
}

//Interface
class Televisao {
  void volumeUp() {}
  void volumeDown() {}
}

//Classe
class SmartTV implements Televisao {
  bool netFlix = false;

  void volumeUp() {
    print('Aumentei o volume');
  }

  void volumeDown() {
    print('Abaixei o Volume');
  }

  void netWorkConection() {
    print('Conectado a internet');
  }
}
