import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toukki_app/ConnexionClient.dart';
import 'package:toukki_app/ConnexionPrestataire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class InscriptionPrestataire extends StatefulWidget
{
  @override
  _InscriptionPrestataire createState() => _InscriptionPrestataire();
}

class _InscriptionPrestataire extends State<InscriptionPrestataire> {

  // Instance pour gerer les images
  PickedFile _imageFile ;
  PickedFile _imageFile1;
  PickedFile _imageFile2;

  final ImagePicker _picker = ImagePicker();
  final ImagePicker _picker1 = ImagePicker();
  final ImagePicker _picker2 = ImagePicker();

  // Etablir la connexion Firestore

  // Authentification firebase
  // Collection Reference
  final CollectionReference collectionPrestator = Firestore.instance.collection("prestataire");



  // information client
  String nom = '' ;
  String prenom = "";
  String telephone ="" ;
  String email = "" ;
  String password = "" ;
  String confirmPassword = "";

  // information vehicule
  String marque = "";
  String modele = "" ;
  String immatriculation = "";

  final _keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
                SizedBox(height: 20,),
                imageProfil(),
                SizedBox(height: 20,),
                Center(
                  child: Text(
                    "Rejoignez ToukkiApp en tant que prestataire",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Center(
                  child: Text(
                    "Information Personnelle",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

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

                Center(
                  child : Text("Information sur votre vehicule",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Marque",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    hintText: "Entrer la marque de votre vehicule",
                  ),

                  // Valider Field
                  validator: (value) => value.isEmpty ? "Entrer la marque" : null ,
                  onChanged: (value) => marque = value ,

                ),

                SizedBox(height: 20,),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Modele",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    hintText: "Entrer le modele de votre vehicule",
                  ),

                  // Valider Field
                  validator: (value) => value.isEmpty ? "Entrer votre modele" : null ,
                  onChanged: (value) => modele = value ,

                ),

                SizedBox(height: 20,),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Immatriculation",

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey, width: 3.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    hintText: "Entrer votre numero d'immatriculation",
                  ),

                  // Valider Field
                  validator: (value) => value.isEmpty ? "Entrer votre immatriculation" : null ,
                  onChanged: (value) => immatriculation = value ,

                ),


                SizedBox(height: 30,),

                Center(
                  child : Text("Photos de votre vehicule",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

            SizedBox(height: 40,),

                imageVehicule(),



                SizedBox(height: 40,),


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
                      //TODO: Add prestataire

                      //AuthResult resultat = await _auth.createUserWithEmailAndPassword(email: email, password: password);

                      collectionPrestator.add({


                        "nom" : nom ,
                        "prenom" : prenom ,
                        "telephone" : telephone,
                        "passeword" : password,
                        "marque" : marque,
                        "modele" : modele ,
                        "immatriculation" : immatriculation ,
                      });





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
                  onPressed: (){getConnexionPrestataire();},
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

  Widget imageVehicule()
  {
   return(
   Center(
    child: Row(
      children: [

        Center(
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage:
                _imageFile1 == null ?
                AssetImage("images/vehicule.jpg") :
                FileImage(File(_imageFile1.path)),

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
        ),

        SizedBox(width: 30,),
        Center(
          child: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage:
                _imageFile2 == null ?
                AssetImage("images/vehicule.jpg") :
                FileImage(File(_imageFile2.path)),

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
        ),

      ],
    ),
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

  Widget bottomSheet1()
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
                      takePhoto1(ImageSource.camera);
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
                      takePhoto1(ImageSource.gallery);
                    },
                  ),

                ],
              ),


            ],
          ),

        )
    );
  }

  Widget bottomShee2()
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
                      takePhoto2(ImageSource.camera);
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
                      takePhoto2(ImageSource.gallery);
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

  void takePhoto1(ImageSource source) async {
    final PickedFile = await _picker1.getImage(source: source);
    setState(() {
      _imageFile1 = PickedFile ;
    });
  }

  void takePhoto2(ImageSource source) async {
    final PickedFile = await _picker2.getImage(source: source);
    setState(() {
      _imageFile2 = PickedFile ;
    });
  }


  void getConnexionPrestataire()
  {
    Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context)
        {
          return ConnexionPrestataire();
        }
    )
    );
  }


}