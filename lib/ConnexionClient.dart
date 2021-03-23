import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toukki_app/InscriptionClient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toukki_app/Chargement.dart';
import 'package:toukki_app/InscriptionPrestataire.dart';
import 'package:toukki_app/client/profilClient.dart';



class ConnexionClient extends StatefulWidget {

  // Mes variables
  @override
  _ConnexionClientState createState() => _ConnexionClientState();
}



class _ConnexionClientState extends State<ConnexionClient> {

  // Firebase variable connexion

  FirebaseAuth _auth = FirebaseAuth.instance;

  bool change = false ;


  String email = "" ;
  String password = "" ;
  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



      return change ? chargement() :Scaffold(

      appBar: AppBar(
        // AppBar : header
        title: Text("Formulaire de connexion"),
        elevation: 30.0,
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50 , horizontal: 30),
          child: Form(
            key: _keyform,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                //Image.asset("images/connexionlogo.png" , height: 100.0, width: 100.0,),
                SizedBox(height: 60,),

                Center(
                  child: Text("Se connecter en tant que client" ,
                  style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold
                  ),
                ),
                ),

                SizedBox(height: 20.0,),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Veuillez saisir votre email",
                    helperText: "un email correcte est attendu",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),

                  // Valider Field
                  validator: (value) => value.isEmpty ? "le remplissage de ce champs est obligatoire" : null ,
                  onChanged: (value) => email = value,
                ),

                SizedBox(height: 20,),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Veuillez saisir votre password",
                    helperText: "un password correcte est attendu",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),

                  // Valider Field
                  validator: (value) => value.isEmpty ? "le remplissage de ce champs est obligatoire" : null ,
                  onChanged: (value) => password = value,
                ),



                SizedBox(height: 20,),

                FlatButton(
                  padding: EdgeInsets.all(15),
                  color: Colors.blueGrey,
                  child: Text("Se connecter" ,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: () async {
                    if (_keyform.currentState.validate()) {
                      //TODO: Aplliquer la logique
                      setState(() {
                        change = true;
                      });
                        AuthResult resultat = await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(resultat == null)
                          {
                            print("Erreur de connexion");
                          }


                    }
                  }
                ),

                SizedBox(height: 20,),

                FlatButton(
                  padding: EdgeInsets.all(15),
                  color: Colors.indigo,
                  child: Text("Vider le formulaire" ,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),

                  onPressed: () {
                    _keyform.currentState.reset();
                  },

                ),

                SizedBox(height: 20,),

                OutlineButton (
                  padding: EdgeInsets.all(15),
                  child: Text("Je n'ai pas de compte !"),
                  borderSide: BorderSide(width: 2.0 , color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: (){getInscriptionClient();},
                ),

            ]
            ),
          ),
        ),
      ),
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







}

