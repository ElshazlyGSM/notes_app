import 'package:flutter/material.dart';
import 'package:notes_app/screens/notes_screen.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, NotesScreen.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: Colors.deepOrangeAccent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              ListTile(
                title: Text(
                  'Flutter note',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
                ),
                subtitle:  Text(
                  'Hello my friend i love you very mach ',
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: Icon(Icons.delete_forever,size: 26,),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Hello',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
