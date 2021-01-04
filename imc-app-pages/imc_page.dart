import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ImcPage extends StatefulWidget {
  @override
  _ImcPageState createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  double imcResult = 0.0;
  final alt = TextEditingController();
  final peso = TextEditingController();
  void _calcimc(){
    //print(alt.text);
    //print(peso.text);
    setState(() {
      imcResult = calcularIMC(double.parse(peso.text), double.parse(alt.text));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calc IMC'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: TextField(
                    controller: peso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'SEU PESO',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(height: 20,),
                Container(
                  child: TextField(
                    controller: alt,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'SUA ALTURA',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(height: 30,),
                RaisedButton(
                  onPressed: (){
                    _calcimc();
                  },
                  child: Text('Calcular'),
                ),
                CalcShow(
                  imc: imcResult,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
calcularIMC(double peso, double altura){
  return peso/pow(altura, 2);
}
class CalcShow extends StatelessWidget {
  double imc;
  CalcShow({
    this.imc,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 200,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
          left: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
          right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
          bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
        ),
      ),
      child: Center(child: Text('seu IMC é $imc', style: TextStyle(fontSize: 30.0),)),
    );
  }
}


