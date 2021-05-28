part of 'widgets.dart';

class MainPageMenu extends StatelessWidget {
  const MainPageMenu({
    Key key,
    @required this.title,
    @required this.image,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 0),
              color: Colors.black.withOpacity(0.5),
              blurRadius: 3)
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(color: ThemeColor.borderMenu),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(image: AssetImage(image)),
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.blackHeadline6,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
