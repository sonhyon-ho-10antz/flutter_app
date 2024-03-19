import 'package:flutter/material.dart';
import 'package:insta_flutter/src/components/avatar_widget.dart';
import 'package:insta_flutter/src/components/image_data.dart';

import '../components/user_card.dart';


class MyPage extends StatefulWidget {
  const MyPage({Key?key}) :super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> with TickerProviderStateMixin{
  late TabController tabController;
  
  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  Widget _statisticsOne(String title,int value){
    return Column(
      children: [
        Text(
          value.toString(),
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
          ),
        ),
        Text(title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _infomation(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                AvatarWidget(
                  type: AvatarType.TYPE3,
                  thumbPath: 'https://cdn.pixabay.com/photo/2023/05/05/21/00/cute-7973191_1280.jpg',
                  size: 80,
                ),

                const SizedBox(width: 10,),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: _statisticsOne('Post',15)),
                      Expanded(child: _statisticsOne('Followers',11)),
                      Expanded(child: _statisticsOne('Following',3)),
                    ],
                  ),
                ),
              ],
          ),

          const SizedBox(height: 10,),

          const Text(
            'hellow world',
            style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _discoverPeople(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Discover People',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children:
                List.generate(
                  10,
                  (index) => UserCard(
                  userId:'user$index',
                  description :'user$index is follow you',
                ),
              ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _tabMenu(){
    return TabBar(
      controller: tabController,
        indicatorColor: Colors.black,
        indicatorWeight: 1,
        tabs: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ImageData(IconsPath.gridViewOn),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ImageData(IconsPath.myTagImageOff),
          ),
        ],
    );
  }

  Widget _tabView(){
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 100,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
    itemBuilder:  (BuildContext context, int index){
        return Container(
          color: Colors.grey,
        );
    },
    );
  }

  Widget _menu(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Row(
        children: [
          Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    color: const Color(0xffdedede),
                  ),
                ),
                child: const Text(
                  'Edit profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
          ),

          SizedBox(width: 8,),

          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: const Color(0xffdedede),
              ),
              color:  const Color(0xffefefef),
            ),
            child: ImageData(IconsPath.addFriend),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        title: const Text(
          'test',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){},
            child:  ImageData(IconsPath.uploadIcon,width: 50,),
          ),
          GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ImageData(IconsPath.menuIcon,width: 50,),
              )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _infomation(),
            _menu(),
            _discoverPeople(),
            const SizedBox(height: 20,),
            _tabMenu(),
            _tabView(),
          ],
        ),
      ),
    );
  }
}