import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:insta_flutter/src/components/avatar_widget.dart';
import 'package:insta_flutter/src/components/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget ({Key?key}) : super (key:key);


  Widget _header(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AvatarWidget(
                type: AvatarType.TYPE3,
                nickName: 'Eno',
                size: 40,
                thumbPath: 'https://cdn.pixabay.com/photo/2023/05/05/21/00/cute-7973191_1280.jpg'
            ),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageData(
                  IconsPath.postMoreIcon,
                  width: 30,
                ),
              ),
            ),
          ],
        ),
    );
  }

  Widget _image(){
    return CachedNetworkImage(imageUrl: 'https://static8.depositphotos.com/1020341/896/i/950/depositphotos_8969502-stock-photo-human-face-with-cracked-texture.jpg');
  }

  Widget _infoCount(){
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ImageData(
                  IconsPath.likeOffIcon,
                  width: 65,
                ),
                const SizedBox(width: 15),
                ImageData(
                  IconsPath.replyIcon,
                  width: 50,
                ),
                const SizedBox(width: 15),
                ImageData(
                  IconsPath.directMessage,
                  width: 55,
                ),
              ],
            ),
            ImageData(
              IconsPath.bookMarkOffIcon,
              width: 50,
            ),
          ],
        ),
      );
  }

  Widget  _infoDescription(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'like 150',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          ExpandableText(
            'contet1\ncontet1\ncontet1\ncontet1\n',
            prefixText: 'Eno',
            onPrefixTap: (){
              print('move the page');
            },
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            expandText: 'more',
            collapseText: 'close',
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _replyTextBtn(){
    return GestureDetector(
      onTap: (){},
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          'comment view',
          style: TextStyle(color: Colors.grey,fontSize: 13),
        ),
      ),
    );
  }
  Widget _dateAgo(){
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        '1 days ago',
        style: TextStyle(
            color: Colors.grey,
            fontSize: 11,
        ),
      ),
    );
  }

  @override
  Widget build (BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(height: 15),
          _image(),
          const SizedBox(height: 15),
          _infoCount(),
          const SizedBox(height: 5),
          _infoDescription(),
          const SizedBox(height: 5),
          _replyTextBtn(),
          const SizedBox(height: 5),
          _dateAgo(),
        ],
      ),
    );
  }
}