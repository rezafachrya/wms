part of 'widgets.dart';

class MainPageMenu extends StatelessWidget {
  const MainPageMenu({
    Key? key,
    required this.title,
    required this.image,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          child: InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
            child: Container(
              height: 80,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: ThemeColor.borderMenu),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image(image: AssetImage(image)),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          height: 40,
          child: Text(
            title,
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
