class Video{
  String id;
  String titulo;
  String imagem;
  String canal;
  String decricao;

  Video({this.id='', this.titulo='', this.imagem='', this.canal='', this.decricao=''});

  //****** AO UTILIZAR O FACTORY TAMBÉM É POSSÍVEL CHAMAR SEM INSTANCIAR UTILIZANDO UM UNICO ESPAÇO DE MEMORIA *****
  //***** COM O FACTORY É POSSÍVEL CRIAR UM CONSTRUTOR COM RETORNO
  factory Video.fromJson(Map<String,dynamic> json){
    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      imagem: json['snippet']['thumbnails']['high']['url'],
      canal: json['snippet']['channelTitle'],
      decricao: json['snippet']['description'],
    );
  }

  /* ******** CRIARIA UMA NOVA INSTANCIA A CADA EXECUÇÃO (UTILIZANDO MAIS MEMORIA) *******
  static convertJson(Map<String,dynamic> json){
    return Video(
      id: json['id']['videoId'],
      titulo: json['snippet']['title'],
      imagem: json['snippet']['thumbnails']['high']['url'],
      canal: json['snippet']['channelId'],
    );
  }
  */
}