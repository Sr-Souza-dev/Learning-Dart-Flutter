import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<EntradaSlider> {
  double _valorSlider = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
            children: [
              Icon(Icons.slideshow),
              Text('Entrada Slider')],
            ),
            backgroundColor: Colors.amber,
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 15),
                child: Slider(
                    value: _valorSlider,
                    min: 1,
                    max: 100,
                    label: _valorSlider.toInt().toString(),
                    divisions: 100,
                    activeColor: Colors.red,
                    inactiveColor: Colors.greenAccent,
                    onChanged: (double valor){
                      setState(() {
                        _valorSlider = valor;
                      });
                    }
                ),
              )
            ]),
        )
    );
  }
}
