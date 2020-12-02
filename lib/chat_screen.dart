import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool online;
  bool isTextFieldEmpty;

  final tcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.077),
        child: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {},
              child: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                leading: Padding(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.height * 0.007,
                  ),
                  child: CircleAvatar(
                    radius: 23,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/freddy.jpg',
                      ),
                    ),
                  ),
                ),
                title: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.001,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "Don Freddy",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      Flexible(
                        child: (online == true)
                            ? Text(
                                'Online',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 8,
                                ),
                              )
                            : Text(
                                'Today at 4:37 am',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500),
                              ),
                      ),
                    ],
                  ),
                ),
                titleSpacing: 0,
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            if (val.length == 0) {
                              isTextFieldEmpty = true;
                            }
                            if (val.length > 0) {
                              isTextFieldEmpty = false;
                            }
                          });
                        },
                        controller: tcontroller,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          hintText: 'Type your message',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.insert_photo),
                            onPressed: () {},
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.0090,
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          tcontroller.clear();
                          isTextFieldEmpty = true;
                        });
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      constraints:
                          BoxConstraints.tightFor(width: 45, height: 45),
                      shape: CircleBorder(),
                      fillColor: Theme.of(context).primaryColor,
                      elevation: 0.0,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
            ],
          )
        ],
      ),
    );
  }
}
