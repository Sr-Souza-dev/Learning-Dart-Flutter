class AnimalFactory {
  String nome;

  static final AnimalFactory instancia =
      AnimalFactory._construtorNomeado('Cachorro');

  //Singleton utilizando o factory, ele retorna parametros da instancia
  factory AnimalFactory() => instancia;

  AnimalFactory._construtorNomeado(this.nome) {
    //configurações iniciais
  }
}
