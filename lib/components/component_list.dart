import 'package:flutter/material.dart';
import 'package:movieapp/constants.dart';

class ComponentList extends StatefulWidget {
  ComponentList(this.indexCallBack);
  final Function indexCallBack;
  @override
  _ComponentListState createState() => _ComponentListState();
}

class _ComponentListState extends State<ComponentList> {
  List<String> state = ['𝙸𝚗 𝚃𝚑𝚎𝚊𝚝𝚎𝚛', '𝙲𝚘𝚖𝚖𝚒𝚗𝚐 𝚂𝚘𝚘𝚗'];
  int selectedcategory = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      height: 65,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedcategory = index;
                      widget.indexCallBack(selectedcategory);
                    });
                  },
                  child: buildstate(context, selectedcategory, index, state),
                ),
              )),
    );
  }
}

Column buildstate(
    BuildContext context, int selectedcategory, int index, List state) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        state[index],
        style: Theme.of(context).textTheme.headline5.copyWith(
              fontWeight: FontWeight.w900,
              color: index == selectedcategory
                  ? kTextColor
                  : Colors.black.withOpacity(0.4),
            ),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 6,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:
              index == selectedcategory ? kSecondaryColor : Colors.transparent,
        ),
      ),
    ],
  );
}
