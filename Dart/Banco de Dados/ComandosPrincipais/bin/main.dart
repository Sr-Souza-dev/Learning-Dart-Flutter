import 'BancoDeDados.dart' as bd;
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/results/results.dart';

void main() async{
  var conn = await bd.creatConnection();
  await creatTable(conn);
  await insertData(conn);
  await updateData(conn);
  await listData(conn);
  await removeData(conn);
  await listData(conn);
  await dropTable(conn);
  await conn.close();
}
Future<void> updateData(MySqlConnection conn) async{
  print('\n Atualizando Datas...');
  //Mudando o nome e idade quando o id for igual a 5
  await conn.prepared('UPDATE people SET name = ?, age = ? where id = ?', ['Gabriel',20,5]);
}
//Removendo um dado
Future<void> removeData(MySqlConnection conn) async {
  print('removing dates...');
  //remove apenas o dado com id 6
  await conn.prepared('DELETE from people where id =?',[6]);
  //Remove todos os dados da tabela
//  await conn.execute('DELETE from people where id =?');


}
Future<void> listData(MySqlConnection conn) async{
  print('Listando dados...');
  StreamedResults results = await conn.execute('select * from people');
  results.forEach((Row row) => print('ID: ${row[0]}; Name: ${row[1]}; Age: ${row[3]}; Email: ${row[2]}'));
}
Future<void> insertData(MySqlConnection conn) async{
  print('Inserting Data...');
  var data = [
    ['leonardo', 'leo@leo.com', 19],
    ['Tella', 'tellat@tellat.com',31],
    ['Gaby', 'gab@gabs.com',20]
  ];
  await conn.preparedWithAll('INSERT INTO people (name, email, age) values(?,?,?)', data);
  print('Data inserted with success!');
}
Future<void> creatTable(MySqlConnection conn) async{
  print('Creating Table');
  await conn.execute('CREATE TABLE IF NOT EXISTS people (id INTEGER NOT NULL auto_increment, '
      'name VARCHAR(255), '
      'email VARCHAR(255), '
      'age INTEGER, '
      'PRIMARY KEY (id))');
  print('Table created with success');
}
//Excluindo a tabela
Future<void> dropTable(MySqlConnection conn) async{
  print('Removendo a tabela...');
  await conn.execute('DROP TABLE people');
}