import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget{
  ProfilePage({Key? key}):super(key: key);

  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage>{
   bool isLoading= false;

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.5,
        backgroundColor: Color(0XFFFFFFFF),
      ),
      body: Container(
        color: Color(0XFFFFFFFF),
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
      
              // contains my profile picture
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(image: AssetImage("assets/profilePicture.jpg"), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Noseta",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                       ),
                    ],
                  ),
                ),
              ),     
      
              customContainer(
                context: context,
                title: "Fullname",
                data: "Akhaze Onosetale Godswill"
              ),
      
              customContainer(
                context: context,
                title: "Username",
                data: "Noseta"
              ),

              customContainer(
                context: context,
                title: "Pronouns",
                data: "he/him"
              ),


              SizedBox(height: 80,),
      
              // The Check Github button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10),
                child: InkWell(
                  onTap: () {
                    launchUrl(Uri.parse("https://github.com/AKHAZE-GODSWILL"), mode: LaunchMode.inAppWebView);
                    setState(() {
                          isLoading=true;
                        });
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Check Github Account",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10,),
                       isLoading? SizedBox(
                        height: 20,
                        width: 20 ,
                        child: CircularProgressIndicator(color: Colors.white)): Icon(Icons.arrow_forward, color: Colors.white,)
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }

  // I'm using a custom container, since I'll basically be using the same widgets over again to display info
  Widget customContainer({required BuildContext context,required String title,required String data}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),

          // holds the title of each detail
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
          ),

          SizedBox(height: 10,),

          // holds a specific user detail
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
            height: 40,
            width: MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(
              color: Color(0XFFF3F4F6),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Text(
            data,
            style: TextStyle(
              fontSize: 14,
            ),
            ),
          )
        ],
      ),
    );
  }
}