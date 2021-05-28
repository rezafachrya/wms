part of 'item.dart';

class ItemBody extends StatelessWidget {
  final String manifestid;

  const ItemBody({
    Key key,
    @required this.manifestid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManifestoutitemCubit, ManifestoutitemState>(
      builder: (context, state) {
        if (state is ManifestoutitemSuccess) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: Sizes.dimen_12.h),
                padding: EdgeInsets.symmetric(
                    horizontal: Sizes.dimen_24.w, vertical: Sizes.dimen_8.h),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Item Ordered',
                      style: Theme.of(context).textTheme.blackHeadline6,
                    ),
                    SizedBox(
                      height: Sizes.dimen_6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 198,
                          // 2 * defaultMargin (jarak border) +
                          // 60 (lebar picture) +
                          // 12 (jarak picture ke title)+
                          // 78 (lebar jumlah items),
                          child: Text(
                            manifestid,
                            style: Theme.of(context).textTheme.blackHeadline6,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                          'total item(${state.mitems?.length})',
                          style: Theme.of(context).textTheme.greySubtitle1,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: Sizes.dimen_8.h, bottom: Sizes.dimen_4.h),
                      child: Text(
                        'Details Item',
                        style: Theme.of(context).textTheme.blackHeadline6,
                      ),
                    ),
                    Column(
                      children: state.mitems
                          .map((e) => Padding(
                                padding: EdgeInsets.only(
                                    top: (e == state.mitems.first)
                                        ? Sizes.dimen_6.h
                                        : Sizes.dimen_0,
                                    bottom: Sizes.dimen_6.h),
                                child: ItemData(
                                  item: e,
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

class ItemData extends StatelessWidget {
  const ItemData({
    Key key,
    this.item,
  }) : super(key: key);
  final TmanifestoutitemEntity item;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 2 - Sizes.dimen_24.w - 5,
            child: Text(
              item.mitem.itemname,
              style: Theme.of(context).textTheme.greySubtitle1,
            )),
        SizedBox(
            width: MediaQuery.of(context).size.width / 2 - Sizes.dimen_24.w - 5,
            child: Text(
              item.itemqty.toString(),
              style: Theme.of(context).textTheme.blackHeadline6,
              textAlign: TextAlign.right,
            ))
      ],
    );
  }
}
