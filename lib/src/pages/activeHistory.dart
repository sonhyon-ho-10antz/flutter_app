import 'package:flutter/material.dart';
import 'package:insta_flutter/src/components/avatar_widget.dart';

class ActiveHistory extends StatelessWidget{
  const ActiveHistory({Key?key}):super (key:key);

  
  Widget _activeItemOne(){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            AvatarWidget(
              type: AvatarType.TYPE2,
              size: 40,
              thumbPath: 'https://tsimg.azureedge.net/img/2024/02/1708063799_4_KV_240202.jpg',
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text:'플레이어',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text:'님이 회원님의 게시물을 좋아합니다',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text:' 5 일전',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }

  Widget _newRecentlyActiveView(String title){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            ),
          ),
          const SizedBox(height: 15,),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:const Text(
          '활동',
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _newRecentlyActiveView('오늘'),
            _newRecentlyActiveView('이번주'),
            _newRecentlyActiveView('이번달'),
          ],
        ),
      ),
    );
  }
}