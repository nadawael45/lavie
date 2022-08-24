//import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:lavie/presentation/modules/home/add_forum.dart';
//import 'package:lavie/presentation/widgets/custom_appbar.dart';
//import 'package:lavie/presentation/widgets/custom_button.dart';
//import 'package:lavie/shared/router.dart';
//
//import 'home/units/search_formField.dart';
//
//class DiscussionForums extends StatefulWidget {
//  const DiscussionForums({Key? key}) : super(key: key);
//
//  @override
//  State<DiscussionForums> createState() => _DiscussionForumsState();
//}
//
//class _DiscussionForumsState extends State<DiscussionForums> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            print('llllllllllllllllllllll');
//            Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPost()));
//            //MagicRouter.navigateTo(NewPost());
//          },
//          backgroundColor: Colors.green,
//          child: Icon(Icons.add),
//        ),
//        body: SafeArea(
//            child: Column(children: [
//              SizedBox(height: 10,),
//              CustomAppBar(text: 'Discussion Forums',width: 0.2.sw,),
//              Padding(
//                padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                child: Column(
//                  children: [
//                    SearchFormField(),
//                    Padding(
//                      padding: const EdgeInsets.symmetric(vertical: 15),
//                      child: Row(
//                        children: [
//                          Container(
//                            height: 28,
//                            width: 111,
//                            decoration: BoxDecoration(
//                              color: Colors.green,
//                              borderRadius: BorderRadius.circular(8),
//                            ),
//                            child: const Center(
//                              child: Text(
//                                'All Forums',
//                                style: TextStyle(
//                                    fontSize: 12,
//                                    fontWeight: FontWeight.bold,
//                                    color: Colors.white),
//                              ),
//                            ),
//                          ),
//                          const SizedBox(
//                            width: 10,
//                          ),
//                          Container(
//                            height: 28,
//                            width: 111,
//                            decoration: BoxDecoration(
//                              border: Border.all(color: Colors.grey),
//                              color: Colors.white,
//                              borderRadius: BorderRadius.circular(8),
//                            ),
//                            child: const Center(
//                              child: Text(
//                                'My Forums',
//                                style: TextStyle(
//                                    fontSize: 12,
//                                    fontWeight: FontWeight.bold,
//                                    color: Colors.grey),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    Container(
//                      height: 265,
//                      width: 1.sw,
//                      decoration:
//                      BoxDecoration(border: Border.all(color: Colors.black12)),
//    )
//
//    ],
//    ),
//    ),
//   ]
//    )));
//  }
//}


//import 'package:flutter/material.dart';
//
//class DiscussionForums extends StatefulWidget {
//  const DiscussionForums({Key? key}) : super(key: key);
//
//  @override
//  State<DiscussionForums> createState() => _DiscussionForumsState();
//}
//
//class _DiscussionForumsState extends State<DiscussionForums> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {  },
//          backgroundColor: Colors.green,
//          child: Icon(Icons.add),
//        ),
//        body: SafeArea(
//        child: SingleChildScrollView(
//        child: Column(
//        children: [
//    Padding(
//    padding: const EdgeInsets.all(8.0),
//    child: Row(
//    children: const [
//    Icon(Icons.arrow_back_ios),
//    SizedBox(
//    width: 60,
//    ),
//    Center(
//    child: Text(
//    'Discussion Forums',
//    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
//    )),
//    ],
//    ),
//    ),
//    Padding(
//    padding: const EdgeInsets.all(15.0),
//    child: Container(
//    decoration: BoxDecoration(
//    borderRadius: BorderRadius.circular(20),
//    color: Colors.grey[300]),
//    child: TextFormField(
//    decoration: const InputDecoration(
//    hintText: 'Search',
//    hintStyle: TextStyle(color: Colors.grey),
//    prefixIcon: Icon(
//    Icons.search,
//    color: Colors.black,
//    ),
//    border: InputBorder.none),
//    )),
//    ),
//    Padding(
//    padding: const EdgeInsets.all(8.0),
//    child: Row(
//    children: [
//    Container(
//    height: 28,
//    width: 111,
//    decoration: BoxDecoration(
//    color: Colors.green,
//    borderRadius: BorderRadius.circular(8),
//    ),
//    child: const Center(
//    child: Text(
//    'All Forums',
//    style: TextStyle(
//    fontSize: 12,
//    fontWeight: FontWeight.bold,
//    color: Colors.white),
//    ),
//    ),
//    ),
//    const SizedBox(
//    width: 10,
//    ),
//    Container(
//    height: 28,
//    width: 111,
//    decoration: BoxDecoration(
//    border: Border.all(color: Colors.grey),
//    color: Colors.white,
//    borderRadius: BorderRadius.circular(8),
//    ),
//    child: const Center(
//    child: Text(
//    'My Forums',
//    style: TextStyle(
//    fontSize: 12,
//    fontWeight: FontWeight.bold,
//    color: Colors.grey),
//    ),
//    ),
//    ),
//    ],
//    ),
//    ),
//
//    Column(
//    children: [
//    Padding(
//    padding: const EdgeInsets.all(15.0),
//    child: Container(
//    height: 265,
//    width: double.infinity,
//    decoration:
//    BoxDecoration(border: Border.all(color: Colors.black12)),
//
//    Column(
//    children: [
//    Padding(
//    padding: const EdgeInsets.all(15.0),
//    child: Container(
//    height: 265,
//    width: double.infinity,
//    decoration: BoxDecoration(
//    border: Border.all(color: Colors.black12)),
//    child: Column(
//    mainAxisAlignment: MainAxisAlignment.start,
//    crossAxisAlignment: CrossAxisAlignment.start,
//    children: [
//    ListTile(
//    title: const Text(
//    'Mayar Mohamed',
//    style: TextStyle(
//    fontSize: 13, fontWeight: FontWeight.w700),
//    ),
//    subtitle: const Text('a month ago',
//    style: TextStyle(
//    fontSize: 11, fontWeight: FontWeight.w400)),
//    leading: Image.network(
//    'https://th.bing.com/th/id/R.5434e5c515855f13621d077b9d4eac73?rik=7v3sn4nlQ9ZMCA&riu=http%3a%2f%2fwww.publicdomainpictures.net%2fpictures%2f50000%2fvelka%2fwoman-1375372792b9F.jpg&ehk=oGYGmMy5TWM3PdkM79pPtaNyLGQMqgJiIcZOOWAl5Ak%3d&risl=&pid=ImgRaw&r=0',
//    ),
//    ),
//    const Padding(
//    padding: EdgeInsets.only(left: 10),
//    child: Text(
//    'How To treat plants',
//    style: TextStyle(
//    fontSize: 15,
//    fontWeight: FontWeight.w700,
//    color: Colors.green),
//    ),
//    ),
//    const Padding(
//    padding: EdgeInsets.only(left: 12, top: 10),
//    child: Text(
//    'It is a long established fact that a reader will be distracted',
//    style: TextStyle(
//    fontSize: 11,
//    fontWeight: FontWeight.w400,
//    color: Colors.grey),
//    ),
//    ),
//    Container(
//    height: 149,
//    width: double.infinity,
//    child: const Image(
//    image: NetworkImage(
//    'https://images.unsplash.com/photo-1547699224-0924faf995c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8ZG93bmxvYWR8fDB8fHx8MTYxOTIwODA3NQ&ixlib=rb-1.2.1&q=80&w=1080'),
//    fit: BoxFit.cover,
//    ),
//    ),
//    ],
//    ),
//    ),
//    ),
//    Padding(
//    padding: const EdgeInsets.only(left: 8.0),
//    child: Row(
//    children: [
//    Padding(
//    padding: const EdgeInsets.all(8.0),
//    child: Row(
//    children: const [
//    Icon(Icons.add_circle, color: Colors.grey),
//    Text(
//    '0 Likes',
//    style: TextStyle(
//    fontSize: 11,
//    fontWeight: FontWeight.w500,
//    color: Colors.grey),
//
//    Nada Wael, [8/24/2022 6:25 AM]
//    )
//    ],
//    ),
//    ),
//    Padding(
//    padding: const EdgeInsets.all(15.0),
//    child: Row(
//    children: const [
//    Text(
//    '2 Replies',
//    style: TextStyle(
//    fontSize: 11,
//    fontWeight: FontWeight.w500,
//    color: Colors.grey),
//    )
//    ],
//    ),
//    )
//    ],
//    ),
//    )
//    ],
//    ),
//    Column(
//    children: [
//    Padding(
//    padding: const EdgeInsets.all(15.0),
//    child: Container(
//    height: 265,
//    width: double.infinity,
//    decoration: BoxDecoration(
//    border: Border.all(color: Colors.black12)),
//    child: Column(
//    mainAxisAlignment: MainAxisAlignment.start,
//    crossAxisAlignment: CrossAxisAlignment.start,
//    children: [
//    ListTile(
//    title: const Text(
//    'Mayar Mohamed',
//    style: TextStyle(
//    fontSize: 13, fontWeight: FontWeight.w700),
//    ),
//    subtitle: const Text('a month ago',
//    style: TextStyle(
//    fontSize: 11, fontWeight: FontWeight.w400)),
//    leading: Image.network(
//    'https://th.bing.com/th/id/R.5434e5c515855f13621d077b9d4eac73?rik=7v3sn4nlQ9ZMCA&riu=http%3a%2f%2fwww.publicdomainpictures.net%2fpictures%2f50000%2fvelka%2fwoman-1375372792b9F.jpg&ehk=oGYGmMy5TWM3PdkM79pPtaNyLGQMqgJiIcZOOWAl5Ak%3d&risl=&pid=ImgRaw&r=0',
//    ),
//    ),
//    const Padding(
//    padding: EdgeInsets.only(left: 10),
//    child: Text(
//    'How To treat plants',
//    style: TextStyle(
//    fontSize: 15,
//    fontWeight: FontWeight.w700,
//    color: Colors.green),
//    ),
//    ),
//    const Padding(
//    padding: EdgeInsets.only(left: 12, top: 10),
//    child: Text(
//    'It is a long established fact that a reader will be distracted',
//    style: TextStyle(
//    fontSize: 11,
//    fontWeight: FontWeight.w400,
//    color: Colors.grey),
//    ),
//    ),
//    Container(
//    height: 149,
//    width: double.infinity,
//    child: const Image(
//    image: NetworkImage(
//    'https://images.unsplash.com/photo-1547699224-0924faf995c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8ZG93bmxvYWR8fDB8fHx8MTYxOTIwODA3NQ&ixlib=rb-1.2.1&q=80&w=1080'),
//    fit: BoxFit.cover,
//    ),
//
//    ),
//    ],
//    ),
//    ),
//    ),
//    Padding(
//    padding: const EdgeInsets.only(left: 8.0),
//    child: Row(
//    children: [
//    Padding(
//    padding: const EdgeInsets.all(8.0),
//    child: Row(
//    children: const [
//    Icon(Icons.add_circle, color: Colors.grey),
//    Text(
//    '0 Likes',
//    style: TextStyle(
//    fontSize: 11,
//    fontWeight: FontWeight.w500,
//    color: Colors.grey),
//    )
//    ],
//    ),
//    ),
//    Padding(
//    padding: const EdgeInsets.all(15.0),
//    child: Row(
//    children: const [
//    Text(
//    '2 Replies',
//    style: TextStyle(
//    fontSize: 11,
//    fontWeight: FontWeight.w500,
//    color: Colors.grey),
//    )
//    ],
//    ),
//    )
//    ],
//    ),
//    )
//    ],
//    ),
//
//

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/domain/cubit/forum/forum_state.dart';
import '../../domain/cubit/forum/forum_cubit.dart';
import 'add_forum.dart';
import 'package:lavie/shared/router.dart';

class DiscussionForums extends StatefulWidget {
  const DiscussionForums({Key? key}) : super(key: key);

  @override
  State<DiscussionForums> createState() => _DiscussionForumsState();
}

class _DiscussionForumsState extends State<DiscussionForums> {
  var index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MagicRouter.navigateTo(NewPost());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children:  [
                  const Icon(Icons.arrow_back_ios),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*.2,
                  ),

                  const  Center(
                      child: Text(
                        'Discussion Forums',

                        style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold,),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300]),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        border: InputBorder.none),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      height: 28,
                      width: 111,
                      decoration: BoxDecoration(
                        color: index == 1 ? Colors.green : Colors.white,
                        border: Border.all(
                            color: index == 1
                                ? Colors.transparent
                                : Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'All Forums',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color:
                              index == 1 ? Colors.white : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Container(
                      height: 28,
                      width: 111,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: index == 2
                                ? Colors.transparent
                                : Colors.grey),
                        color: index == 2 ? Colors.green : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'My Forums',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color:
                              index == 2 ? Colors.white : Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BlocConsumer<ForumCubit,ForumState>(
                builder: (BuildContext context, state) {
                  print('ooooooooooooooooooooooo');
                  if(state is GetSuccess){
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) =>  ForumItem(
                          desc:state.blogList[index].description ,
                          title:state.blogList[index].title),
                    );

                  }else{
                    return SizedBox();
                  }
                }, listener: (BuildContext context, state) {  },
              ),
            ),
            SizedBox(height: 20,)

          ],
        ),
      ),
    );
  }
}

class ForumItem extends StatelessWidget {
   ForumItem({
    this.title,this.desc,Key? key,
  }) : super(key: key);
String? title;
   String? desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 265,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: const Text(
                    'Nada wael',
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                  subtitle: const Text('a month ago',
                      style: TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w400)),
                  leading: Image.network(
                    'https://th.bing.com/th/id/R.5434e5c515855f13621d077b9d4eac73?rik=7v3sn4nlQ9ZMCA&riu=http%3a%2f%2fwww.publicdomainpictures.net%2fpictures%2f50000%2fvelka%2fwoman-1375372792b9F.jpg&ehk=oGYGmMy5TWM3PdkM79pPtaNyLGQMqgJiIcZOOWAl5Ak%3d&risl=&pid=ImgRaw&r=0',
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(title!,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.green),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 12, top: 10,bottom: 20,right: 12),
                  child: Text(
                    desc!,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Container(

                    width: double.infinity,
                    child: const Image(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1547699224-0924faf995c6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8ZG93bmxvYWR8fDB8fHx8MTYxOTIwODA3NQ&ixlib=rb-1.2.1&q=80&w=1080'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Icon(Icons.add_circle, color: Colors.grey),
                    Text(
                      '0 Likes',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: const [
                    Text(
                      '2 Replies',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
