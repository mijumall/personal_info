import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.description,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    final _cardWidth = MediaQuery.of(context).size.width * 0.95;
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(5),
          height: 150,
          width: _cardWidth,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.black12,
            child: Row(
              children: [
                // Picture
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                ),

                // Divider
                const VerticalDivider(
                  color: Colors.grey,
                  width: 1,
                  thickness: 1,
                ),

                // Name and Description
                Flexible(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        // Name
                        Expanded(
                          flex: 1,
                          child: Text(
                            name,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        // Description
                        Expanded(
                          flex: 1,
                          child: Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
