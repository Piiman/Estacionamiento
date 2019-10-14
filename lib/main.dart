import 'package:flutter/material.dart';

main()=>runApp(Parqui());

double primHora= 0,fracHora =0, total=0;
int iniHora = 0, iniMin=0, finHora=0,finMin=0;

class Parqui extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Puebla();
      }
    }
    
    class Puebla extends State{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calcular costo de estacionamiento"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: "Costo de la 1° hora",
                  hintText: "40",
                  helperText: "Solo ingresa numeros",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (cambio){
                  setState(() {
                   primHora= double.parse(cambio); 
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: "Costo por fraccion de hora (15 min)",
                  hintText: "10",
                  helperText: "Solo ingresa numeros",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (cambio){
                  setState(() {
                   fracHora= double.parse(cambio); 
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.timelapse),
                  labelText: "Hora de inicio",
                  hintText: "16:20",
                  helperText: "No ingreses letras",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (cambio){
                  setState(() {
                   List<String> tasajiado = cambio.split(':');
                   iniHora = int.parse(tasajiado[0]);
                   iniMin = int.parse(tasajiado[1]);
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.timelapse),
                  labelText: "Hora fin",
                  hintText: "18:00",
                  helperText: "No ingreses letras",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: (cambio){
                  setState(() {
                   List<String> tasajiado = cambio.split(':');
                   finHora = int.parse(tasajiado[0]);
                   finMin = int.parse(tasajiado[1]);
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: FlatButton(
                child: Text("Calcular"),
                onPressed: (){
                  print(iniHora);
                  print(iniMin);
                  print(finHora);
                  print(finMin);
                  setState(() {
                    int totalHora= -iniHora+finHora;
                    int totalMin= -iniMin+finMin;
                    if (totalHora<1){
                      totalHora+=24;
                      totalHora.abs();
                    }
                    totalHora-= 1;
                    total = primHora;
                    totalMin+= totalHora*60;
                    double totalFrac = totalMin/15;
                    print(totalFrac);
                    int iter = totalFrac.floor();
                    print(totalFrac);
                    for (var i = 0; i < iter; i++) {
                      total+= fracHora;
                    }
                  });
                },
                color: Colors.blue
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text("A pagar: $total"),
            )
          ],
        ),
      ),
    );
  }

}