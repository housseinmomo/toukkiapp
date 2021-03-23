import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:toukki_app/ConnexionClient.dart';
import 'package:toukki_app/ConnexionPrestataire.dart';
import 'package:toukki_app/InscriptionClient.dart';
import 'package:toukki_app/InscriptionPrestataire.dart';
import 'package:toukki_app/apropos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toukki App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: updateDataTrigger(),
    );
  }
}

class updateDataTrigger extends StatefulWidget
{
  updateData createState() => updateData();
}

class updateData extends State<updateDataTrigger> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          // AppBar : header
          title: Text("Toukki Home"),
          elevation: 30.0,
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),

      // Creation de menu
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget> [
            DrawerHeader(
              // container dimenseion
              padding: EdgeInsets.all(50),
              margin: EdgeInsets.only(bottom: 45),

                  child: Text("Menu de navigation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                  ),
                   decoration: BoxDecoration(color: Colors.blue,),

            ),


            ListTile(title:
            RaisedButton(
                child: Text("Inscription Client" ,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){getInscriptionClient();},
                color: Colors.blue,
                splashColor: Colors.purple,
              ),
            ),


            ListTile(
            title:  RaisedButton(
                child: Text("Inscription Prestataire" ,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: (){getInscriptionPrestataire();},
                color: Colors.blue,
                splashColor: Colors.purple,
              ),

            ),


            ListTile(title:
            RaisedButton(
              child: Text("Connexion Client" ,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: (){getConnexionClient();},
              color: Colors.blue,
              splashColor: Colors.purple,
            ),
            ),


            ListTile(title:
            RaisedButton(
              child: Text("Connexion Prestataire" ,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: (){getConnexionPrestataire();},
              color: Colors.blue,
              splashColor: Colors.purple,
            ),

            ),
            ListTile(title:
            RaisedButton(
              child: Text("Plus d'information" ,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: (){getPropoPage();},
              color: Colors.blue,
              splashColor: Colors.blueGrey,
            ),
            ),


          ],
        ),
      ),
      ),


        body:
        Container(

          decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("images/fond1.png"),
          fit: BoxFit.cover,
          ),
          ),

        )
    );
  }



  //////////////////////////// Fonction de navigation////////////////////////////////
  void getPropoPage()
  {
    Navigator.push(context,
    MaterialPageRoute(
      builder: (BuildContext context)
          {
            return apropos();
          }
    )
    );
  }

  void getInscriptionClient()
  {
    Navigator.push(context,
     MaterialPageRoute(
         builder: (BuildContext context)
             {
               return InscriptionClient();
             }
     )
    );
  }

  void getInscriptionPrestataire()
  {
    Navigator.push(context,
    MaterialPageRoute(
        builder: (BuildContext context)
            {
              return InscriptionPrestataire();
            }
    )
    );
  }

  void getConnexionClient()
  {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext context)
            {
              return ConnexionClient();
            }
        )
    );
  }

  void getConnexionPrestataire()
  {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (BuildContext context)
            {
              return ConnexionPrestataire();
            }
        )
    );
  }




}





