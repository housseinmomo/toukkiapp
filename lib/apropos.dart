import 'package:flutter/material.dart';

class apropos extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      appBar: AppBar(
        // AppBar : header
        title: Text("Toukki Information"),
        leading: Icon(Icons.directions_car),
        elevation: 30.0,
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          //SingleChildScrollView : nous permet de scroller dans l'ecran
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [

              // 1 Widget
              Container(
              child:  Text("Introduction" ,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
                ),
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(14),
              ),

              //1 widget
              Container(
                child:  Text(
                      "Le covoiturage est devenu ces 10 dernières années un nouveau moyen de déplacement pour des millions d’Européens. \n"
                      "C’est devenu une façon de voyager très populaire lorsqu’il s’agit de trajets sur une longue distance, avec des dizaines de milliers de trajets offerts chaque jour. \n"
                      " Mais malheureusement cette pratique est peu répandu dans notre continent (l'Afrique) . On compte peu de plateforme proposant ces services en Afrique. \n"
                      " Et c'est pour repondre a ce besoin que nous ToukkiApp intervenons.\n" ,

                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
                margin: EdgeInsets.only(top: 35),
                padding: EdgeInsets.all(14),
              ),



              Container(
               child: Text("Presentation General de ToukkiApp",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.all(14),
              ),

              //2 widget
              Container(
               child:  Text(
                      "ToukkiApp , c’est l’expérience de partager un trajet ensemble.\n"
                      "Cest une plateforme mobile de covoiturage qui va facilite le deplacement des personnes.\n"
                      " On s’assurera du confort de chaque client et du bon deroulement de chaque trajet. \n"
                      " Nous voulons d’abors commencer par la region de Dakar et ensuite nous developper dans tout le Senegal.\n" ,

                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
                margin: EdgeInsets.only(top: 35),
                padding: EdgeInsets.all(14),
              ),

              //3 Widget
              Container(
                child: Text("Pourquoi faire du covoiturage ?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0 ,
                    color: Colors.blueGrey,
                  ),
                ),
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.only(top: 35),
              ),

              //4 widget

              Container(
                child:  Text(
                      "Covoiturer sur les trajets du quotidien, c’est pratique, économique et écologique\n"
                      "Le covoiturage a beaucoup d’avantages : il réduit les coûts de voyage, c’est une solution de mobilité durable, et voyager ensemble \n"
                      "Le coût du voyage est partagé entre le conducteur et les passagers, qui peuvent voyager pour moins cher que d’autres moyens de transport.\n"
                      "Vous réduisez la pollution et les embouteillages et contribuer a l’ecologie.\n"
                      "Vous pouvez aussi vous faire pleins d’amis grâce a cela .\n",

                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.justify,
                ),
                margin: EdgeInsets.only(top: 35),
                padding: EdgeInsets.all(14),
              ),

              Container(
                child: Text("Presentation de l'equipe",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                margin: EdgeInsets.only(top: 50 , bottom: 30),
                padding: EdgeInsets.all(14),
              ),

              Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("1/Abdoulfatah Houssein Khaireh" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("2/Seydou Nourou Aw" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("3/Ousseini Adamou", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                  SizedBox(height: 40,),
                ],
              ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}