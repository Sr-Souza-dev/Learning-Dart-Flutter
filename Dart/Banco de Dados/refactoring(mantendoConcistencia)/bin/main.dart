import 'package:sqljocky5/sqljocky.dart';
import 'package:refactoringDart/bd.dart' as db;

main() async {

  var conn = await db.createConnection();
  await createTables(conn);

  var trans = await conn.begin();

  try {
    //insere uma pessoa
    await trans.execute('insert into people (id, name, email, age) values (1, "Leonardo", "leo@leo.com", 23)');
    //insere outro cavalo somente se existir a pessoa 'person_id' salva no banco de dados
    await trans.execute('insert into horse (person_id) values (1)');
    //Caso dê certo ele faz um commit no banco de dados e atualiza as informações
    await trans.commit();

  } catch(e) {
    //Caso dê errado ele ignora toda operação e continua a execução
    print(e);
    await trans.rollback();
  }
  //Fechando o banco de dados
  await conn.close();
}


Future<void> createTables(MySqlConnection conn) async {
  await conn.execute('CREATE TABLE IF NOT EXISTS people (id INTEGER NOT NULL auto_increment, name VARCHAR(255), age INTEGER, email VARCHAR(255), PRIMARY KEY (id))');
  await conn.execute('CREATE TABLE IF NOT EXISTS horse (id INTEGER NOT NULL auto_increment, person_id INTEGER NOT NULL, PRIMARY KEY (id), FOREIGN KEY (person_id) REFERENCES people(id))');
}
