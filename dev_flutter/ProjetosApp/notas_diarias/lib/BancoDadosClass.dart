import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados{
  String _tableName; //
  String _baseName;
  String _tableColumns;
  String _primaryKey;

  //Construtor recebe o nome da tabela, o nome do banco de daods, as colunas no formato SQL e a coluna principal
  //Ex -> BancoDados('usuarios', 'dados', 'id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR', 'id');
  BancoDados(this._tableName, this._baseName, this._tableColumns, this._primaryKey);

  _recuperarBancoDados() async{
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados,'$_baseName.db');
    Database dataBase = await openDatabase(
        localBancoDados,
        version: 1,
        onCreate: (dataBase,versaoRecenteDataBase){
          String sql ='CREATE TABLE $_tableName ($_tableColumns)';
          dataBase.execute(sql);
        }
    );
    return dataBase;
  }

  //Recebe um Map com as repectivas chaves respeitando as colunas e retorna a chave principal da tabela
  //EX: inserir({'nome' : 'Gabriel', 'idade' : 20})  -> Vai salvar o registro na tabela seguindo as orientações das colunas
  Future<String> inserir(Map<String, dynamic> registro)async{
    Database database = await _recuperarBancoDados();
    var primaryKey = await database.insert(_tableName, registro);
    return primaryKey.toString();
  }


  //Recebe as colunas que serão coletadas e o condicional. Retorna uma lista com os dados filtrados
  //EX: pesquisar("nome, idade", "idade = 20") -> vai retornar uma lista com nome e idade de todos cadastrados que tenha 20 anos de idade
  Future<List> pesquisar(String columns, {String conditional = '1=1'}) async{
    Database database = await _recuperarBancoDados();
    String sql = "SELECT $columns FROM $_tableName WHERE $conditional";
    List registers = await database.rawQuery(sql);
    return registers;
  }

  //Recebe o conteúdo do registro desejado da coluna principal. Supondo que a coluna principal seja o id veja o ex abaixo
  // EX: excluirRegistro(4) -> vai excluir o registro de id 4
  Future<int> excluirRegistro(var primaryKeyData)async{
    Database database = await _recuperarBancoDados();

    int qtdDeletado = await database.delete(
      _tableName,
      where: "$_primaryKey = ?",
      whereArgs: [primaryKeyData],
    );
    return qtdDeletado; //Retorna a quantidade de itens que foram deletados
  }


  //Recebe um Map formatado de acordo com as colunas e um dado da coluna principal, supondo que a coluna principal seja o id veja o ex abaixo
  //EX: atualizarRegistro({'nome' : 'Gabriel', 'idade' : 20}, 7)  -> vai ir no registro de id 7 e atualizar os parametros passados no Map
  Future<int> atualizarRegistro(Map<String,dynamic> register, var primaryKeyData) async{
    Database database = await _recuperarBancoDados();

    int qtdAtualizados = await database.update(
      _tableName,
      register,
      where: "$_primaryKey = ?",
      whereArgs: [primaryKeyData],
    );
    return qtdAtualizados; //Retorna a quantidade de registros que foram atualizados
  }
}

/*
      Definições que podem ser utilizadas junto com o WHERE no metodo 'pesquisar'
      WHERE idade = 20 AND cidade = 'div' -> Verifica os registros que tenha 20 anos e morem em div
      WHERE idade BETWEEN 18 AND 46 -> Verifica os registro que tenham idade entre 18 e 46 anos
      WHERE idade IN (18,30) -> Verifica os registros que tem a idade exatamente sendo 18 ou 30
      WHERE nome LIKE 'Gabriel%' -> Verifica os registros que tenham o nome Gabriel mas de sobrenome qualquer
      OBS: ao utilizar o LIKE o simbolo % fica como indefinido, então qualquer busca que tenha % o banco retornará todas possibilidades seguindo o que foi passado
      WHERE 1=1 ORDER BY nome ASC -> retorna todos os registros de forma ordenada (ASC -> crescente / -> DESC decrescente)
      WHERE 1=1 ORDER BY nome ASC LIMIT 3 -> retorno os 3 primeiros itens após a ordenação
      OBS: UPPER(nome) -> UPPER é permitido utilizar em qualquer string e converte todos caracteres para maiúsculo
     */
