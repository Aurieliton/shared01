import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetLogin extends StatefulWidget {
  @override
  _WidgetLoginState createState() => _WidgetLoginState();
}

class _WidgetLoginState extends State<WidgetLogin> {
  // final String nome;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getStringToSf() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      myController.text = prefs.getString('nome');
    }

    setStringToSf(String nome) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('nome', nome);
    }

    void initState() {
      super.initState();
      {
        getStringToSf();
      }
    }

    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   leading: CheckedPopupMenuItem(),
      //   title: Text('Controle de estoque'),
      //   actions: <Widget>[
      //     Icon(Icons.android),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Colors.transparent,
                child: Image.asset(
                  'imagens/berplogo.png',
                  height: 100,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                controller: myController,
                decoration: InputDecoration(
                  labelText: "Resposta",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 30,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 80, maxWidth: 230),
                child: FlatButton(
                  splashColor: Colors.yellowAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    setStringToSf('teste');
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.android,
                        size: 50,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Clique Aqui!',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
