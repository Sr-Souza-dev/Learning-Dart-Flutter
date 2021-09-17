import 'package:sqljocky5/sqljocky.dart';
creatConnection() async{
    var bd = ConnectionSettings(
      user: "root",
      password: "Gabriel@123",
      host: "localhost",
      port: 3306,
      db: "dart",
    );
    return await MySqlConnection.connect(bd);
}

/**
    ******* CRIANDO DATABASE 'DART' NO SQL PARA QUE POSSA SER USADO *******
    create database DataBaseName; -> para criar o banco de dados do projeto

    ***** COMANDOS NO SQL APÓS DATABASE JA CRIADO *******
    show databases; -> para visualizar todos bancos de dados cadastrados
    use nameBanco; -> para carregar o banco de dados desejado
    show tables; -> para visualizar todas as tabelas cadastradas no banco de dados selecionado
    select * from nameTable -> para visualizar todos itens da tabela
**/
