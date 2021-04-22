import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controleAlcool = TextEditingController();
  TextEditingController _controleGasolina = TextEditingController();
  String _TextoResultado = "";

  void _calcular(){

    double precoAlcool = double.tryParse( _controleAlcool.text );
    double precoGasolina = double.tryParse( _controleGasolina.text );

    if( precoAlcool == null || precoGasolina == null ){
      setState(() {
        _TextoResultado = "Número inválido, digite apenas números positivos e utilize (.) ponto";
      });
    }else{

      if( ( precoAlcool / precoGasolina ) >= 0.7 ){
        setState(() {
          _TextoResultado = "Melhor abastecer com gasolina";
        });
      }else{

        setState(() {
          _TextoResultado = "Melhor abastecer com alcool";
        });
      }

      //_limparCampos();

    }

  }

  void _limparCampos(){
    _controleGasolina.text = "";
    _controleAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imagens/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecer seu automovel",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Álcool, Ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controleAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, Ex: 4.00"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controleGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _TextoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
