import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toukki_app/ConnexionClient.dart';
import 'package:toukki_app/ConnexionPrestataire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class InscriptionClient extends StatefulWidget
{
  @override
  _InscriptionClientState createState() => _InscriptionClientState();
}

class _InscriptionClientState extends State<InscriptionClient> {

  // Instance pour gerer les images

  PickedFile _imageFile ;
  final ImagePicker _picker = ImagePicker();

  // Authentification firebase
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser courant ;
  // Collection Reference
  final CollectionReference userCollection = Firestore.instance.collection("client");



  // Variables
  String nom = '' ;
  String prenom = "";
  String telephone ="" ;
  String email = "" ;
  String password = "" ;
  String confirmPassword = "";

  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    FirebaseAuth.instance.currentUser().then((FirebaseUser util) {
      setState(() {
        this.courant = util;
      });
    });

    // Recuperer le id de l'utilisateur courant

    String getId()
    {
      if(courant != null)
      {
        return courant.uid;
      }
      else{
        return "pas d'utilisateur";
      }
    }




    return Scaffold(

      appBar: AppBar(
        // AppBar : header
        title: Text("Formulaire d'inscription"),
        elevation: 30.0,
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50 , horizontal: 30),

          child: Form(

            key: _keyform ,

            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.stretch,
              children: <Widget>[

                imageProfil(),

                SizedBox(height: 30.0,),
                Center(
                  child: Text(
                    "Rejoignez ToukkiApp en tant que client",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

            SizedBox(height: 15,),

            SizedBox(height: 10.0),



            TextFormField(
              decoration: InputDecoration(
                labelText: "Nom",

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                hintText: "Veuillez entrer votre nom",

              ),

              // Validation Field
              validator: (value) => value.isEmpty ? "Entrer un nom" : null ,
              onChanged: (value) => nom = value ,

            ),
                SizedBox(height: 15.0),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Prenom",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    hintText: "Veuillez entrer votre prenom",

                  ),

                  //Valider champs

                  validator: (value) => value.isEmpty ? "Entrer un prenom" : null ,
                  onChanged: (value) => prenom = value ,

                ),
                SizedBox(height: 15.0),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Telephone",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    hintText: "Veuillez entrer votre telephone",
                  ),
                  // Valider Field

                  validator: (value) => value.length < 9 ? "Veuillez entre un numero de 9 chiffres (Senegal)" : null ,
                  onChanged: (value) => telephone = value  ,

                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15.0),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    hintText: "Veuillez entrer votre email",
                    helperText: "Email valide requis",
                  ),

                  // Valider Field

                  validator: (value) => value.isEmpty ? "Entrer un Email" : null ,
                  onChanged: (value) => email = value ,

                ),

                SizedBox(height: 15.0),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    hintText: "Veuillez entrer votre password",
                    helperText: "Utiliser un melange de chiffres / alphabets / symbole",
                  ),

                  // Valider Field
                  validator: (value) => value.isEmpty ? "Entrer un password" : null ,
                  onChanged: (value) => password = value ,
                ),

                SizedBox(height: 15.0),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm password",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    hintText: "Veuillez confrimer votre password",
                  ),

                  // Valider Field
                  onChanged: (value) => confirmPassword = value,
                  validator: (value) => confirmPassword != password ? "Les deux password ne correspondent pas" : null,

                ),
             SizedBox(height: 20,),
              FlatButton(
                padding: EdgeInsets.all(15),
                color: Colors.blueGrey,
                    child: Text("S'enregistrer" ,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),

                    onPressed: () async {
                      if(_keyform.currentState.validate())
                        {
                          //AuthResult resultat1 = await _auth.createUserWithEmailAndPassword(email: email, password: password);

                          userCollection.add(
                            {
                              "nom" : nom , "prenom" : prenom , "telephone" : telephone , "email" : email , "password" : password,
                            }
                          );



                        }
                    },
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
                  child: Text("J'ai deja un compte"),
                  borderSide: BorderSide(width: 2.0 , color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: (){getConnexionClient();},
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  // Function route vers page de connexion
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

  Widget imageProfil()
  {
    return(
     Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage:
            _imageFile == null ?
            AssetImage("images/avatar.jpg") :
            FileImage(File(_imageFile.path)),

          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: InkWell(
                onTap: (){
                  showModalBottomSheet(context: context,
                    builder: ((builder) => bottomSheet()),
                  );
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.blueGrey,
                  size: 30,
                ),
              ),
          ),
        ],
      ),
    )
    );
  }

  Widget bottomSheet()
  {
    return(
        Container(

          height: 100.0,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),

          child: Column(
            children: [

              Text(
                "Choisir une photo",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  FlatButton.icon(
                    icon: Icon(Icons.camera ,
                      color: Colors.blueGrey,
                      size: 30,
                    ),
                    label: Text("camera"),
                    onPressed: (){
                      takePhoto(ImageSource.camera);
                    },
                  ),

                  SizedBox(width: 25,),

                  FlatButton.icon(
                    icon: Icon(Icons.image ,
                      color: Colors.blueGrey,
                      size: 30,
                    ),
                    label: Text("galerie"),
                    onPressed: (){
                      takePhoto(ImageSource.gallery);
                    },
                  ),

                ],
              ),


            ],
          ),

        )
    );
  }


  void takePhoto(ImageSource source) async {
    final PickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = PickedFile ;
    });
  }


}