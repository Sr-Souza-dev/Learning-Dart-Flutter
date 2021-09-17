import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

void main() async{
  // Inicializar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();



  runApp(MaterialApp(
    home: Home(),
  ));


}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File _imagem = File('');
  String _statusUpload = 'Upload não iniciado';
  String _urlImagemRecuperada = '';

  Future _recuperarImagem(bool daCamera)async{
    PickedFile? imagemSelecionada;
    if(daCamera){
      imagemSelecionada = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    }else{
      imagemSelecionada = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      _imagem = File(imagemSelecionada!.path);
    });
  }

  Future _uploadImage()async{
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz.child('fotos').child('foto1.jpg');

    //Fazendo upload da imagem
    UploadTask task = arquivo.putFile(_imagem);

    //Controlar progresso do upload
    task.snapshotEvents.listen((TaskSnapshot storageEvent) {
      if(storageEvent.state == TaskState.running){
        setState(() {
          _statusUpload = 'Carregando!';
        });
      }else if(storageEvent.state == TaskState.success){
        setState(() {
          _statusUpload = 'Carregado com sucesso!!';
        });
      }
    });

    //recuperar url da imagem
    String url = await (await task).ref.getDownloadURL();
    setState(() {
      _urlImagemRecuperada = url;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar Imagem'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: SingleChildScrollView(child: Column(
        children: [
          Text(_statusUpload),
          ElevatedButton(
            child: Text('Camera'),
            onPressed: () => _recuperarImagem(true),
          ),
          ElevatedButton(
            child: Text('Galeria'),
            onPressed: () => _recuperarImagem(false),
          ),
          _imagem.path == '' ? Container() :Image.file(_imagem),
          ElevatedButton(
            child: Text('UpLoad'),
            onPressed: () => _uploadImage(),
          ),
          Text(_urlImagemRecuperada),
          Image.network(_urlImagemRecuperada),
        ],
      ),),
    );
  }
}


