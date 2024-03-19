import 'package:flutter/material.dart';
import 'package:insta_flutter/src/components/avatar_widget.dart';
import 'package:insta_flutter/src/components/image_data.dart';
import 'package:insta_flutter/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory(){
    return Stack(
      children: [
       AvatarWidget(
           type: AvatarType.TYPE2,
           thumbPath: 'https://cdn.pixabay.com/photo/2023/05/05/21/00/cute-7973191_1280.jpg',
           size: 70,
       ),
        Positioned(
            right:5,
            bottom:0,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:Colors.blue,
                border: Border.all(
                    color: Colors.white,
                    width: 2
                ),
              ),
              child: const Center(
                child: Text('+',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      height: 1.1,
                  ),
                ),
              ),
            ),
        )
      ],
    );
  }

  Widget _storyBoardList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 20,),
          _myStory(),
          SizedBox(width: 5,),
          ...List.generate(
            100,
                (index) => AvatarWidget(
              type: AvatarType.TYPE1,
              thumbPath: 'https://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _postList(){
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          elevation: 0,
          title:ImageData(IconsPath.logo,width: 270,),
          actions: [
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ImageData(
                  IconsPath.directMessage,
                  width: 50,
                ),
              ),
            )
          ],
        ),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList(),
          ],
      ),
    );
  }
}