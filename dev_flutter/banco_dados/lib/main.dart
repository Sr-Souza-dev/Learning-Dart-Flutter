import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDados() async{
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados,'banco.db');

    var dataBase = await openDatabase(
        localBancoDados,
        version: 1,
        onCreate: (dataBase,versaoRecenteDataBase){
            String sql ='CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)';
            dataBase.execute(sql);
        }
    );
    return dataBase;
  }

  _salvar()async{
    Database database = await _recuperarBancoDados();
    Map<String,dynamic> registro = {
      'nome' : 'Gabriel Souza',
      'idade' : 20
    };
    int idRegistro = await database.insert('usuarios', registro);
    print('ID: '+ idRegistro.toString());
  }

  _listar() async{
    Database database = await _recuperarBancoDados();
    /*
      Definições que podem ser utilizadas junto com o WHERE
      WHERE idade = 20 AND cidade = 'div' -> Verifica os registros que tenha 20 anos e morem em div
      WHERE idade BETWEEN 18 AND 46 -> Verifica os registro que tenham idade entre 18 e 46 anos
      WHERE idade IN (18,30) -> Verifica os registros que tem a idade exatamente sendo 18 ou 30
      WHERE nome LIKE 'Gabriel%' -> Verifica os registros que tenham o nome Gabriel mas de sobrenome qualquer
      OBS: ao utilizar o LIKE o simbolo % fica como indefinido, então qualquer busca que tenha % o banco retornará todas possibilidades seguindo o que foi passado
      WHERE 1=1 ORDER BY nome ASC -> retorna todos os registros de forma ordenada (ASC -> crescente / -> DESC decrescente)
      WHERE 1=1 ORDER BY nome ASC LIMIT 3 -> retorno os 3 primeiros itens após a ordenação
      OBS: UPPER(nome) -> UPPER é permitido utilizar em qualquer string e converte todos caracteres para maiúsculo
     */
    String sql = "SELECT * FROM usuarios WHERE nome = 'Gabriel Souza'";
    List registers = await database.rawQuery(sql);
    print('usuarios: '+ registers.toString());
  }

  _recuperarUsuarioPeloId(int id)async{
    Database database = await _recuperarBancoDados();
    List registros = await database.query(
      "usuarios",
      columns: ["id","nome","idade"],
      where: "id = ? ",
      whereArgs: [id]
    );
    print('Usuario P: ' + registros.toString());
  }

  _excluirRegistro(int id)async{
    Database database = await _recuperarBancoDados();

    int qtdDeletado = await database.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id],
    );

    print('Quantida removida: ' + qtdDeletado.toString());
  }

  _atualizarRegistro(int id)async{
    Database database = await _recuperarBancoDados();

    Map<String,dynamic> registro = {
      'idade' : 18
    };
    int qtdAtualizados = await database.update(
        'usuarios',
        registro,
      where: "id = ?",
      whereArgs: [id],
    );
    print('Quantida Atualizada: ' + qtdAtualizados.toString());
  }

  @override
  Widget build(BuildContext context) {
    _recuperarBancoDados();
    _salvar();
    _listar();
    _recuperarUsuarioPeloId(1);
    _excluirRegistro(0);
    _atualizarRegistro(15);
    return Container();
  }
}

