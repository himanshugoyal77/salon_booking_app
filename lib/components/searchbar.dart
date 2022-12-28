import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 18),
      child: Row(
        children: [
          const SizedBox(
            height: 50,
            width: 250,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              textAlign: TextAlign.start,
              cursorHeight: 25,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.pink,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  hintText: 'Search'),
            ),
          ),
          const Spacer(),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(45)),
            child: const Center(
              child: Icon(
                CupertinoIcons.slider_horizontal_3,
                color: Colors.pink,
              ),
            ),
          ),
         const  Spacer(),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: const Center(
              child: Icon(
                Icons.filter_alt_outlined,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
