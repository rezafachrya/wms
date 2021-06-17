part of 'item.dart';

class ItemBody extends StatelessWidget {
  final String manifestid;
  final String status;

  const ItemBody({
    Key? key,
    required this.manifestid,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManifestoutitemCubit, ManifestoutitemState>(
      builder: (context, state) {
        if (state is ManifestoutitemSuccess) {
          return ItemBodyWidget(
            manifestid: manifestid,
            status: status,
            totalItemData: Text(
              'total item(${state.mitems.length})',
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            detailItemList: state.mitems
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(
                        top: (e == state.mitems.first)
                            ? Sizes.dimen_6.h
                            : Sizes.dimen_0,
                        bottom: Sizes.dimen_6.h),
                    child: ItemData(
                      item: e,
                    ),
                  ),
                )
                .toList(),
          );
        } else if (state is ManifestoutitemLoading) {
          List<int> tempShimmerList = [1, 2, 3, 4, 5];
          return ItemBodyWidget(
            manifestid: manifestid,
            status: status,
            totalItemData: ShimmerWidget.rectangular(
                width: Sizes.dimen_100.w, height: Sizes.dimen_16.sp),
            detailItemList: tempShimmerList
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(
                        top: (e == tempShimmerList.first)
                            ? Sizes.dimen_6.h
                            : Sizes.dimen_0,
                        bottom: Sizes.dimen_6.h),
                    child: ItemData(),
                  ),
                )
                .toList(),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

class ItemBodyWidget extends StatelessWidget {
  const ItemBodyWidget({
    Key? key,
    required this.manifestid,
    required this.status,
    required this.totalItemData,
    required this.detailItemList,
  }) : super(key: key);

  final String manifestid;
  final String status;
  final Widget totalItemData;
  final List<Widget> detailItemList;

  @override
  Widget build(BuildContext context) {
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
                SharedString.itemOrdered,
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
                  totalItemData,
                ],
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
                      SharedString.status,
                      style: Theme.of(context).textTheme.blackHeadline6,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Text(
                    status == 'DL'
                        ? 'DELIVERY'
                        : status == 'PC'
                            ? 'PACKAGING'
                            : status == 'DN'
                                ? 'DELIVERED'
                                : 'BAST',
                    style: Theme.of(context).textTheme.greenHeadline6,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Sizes.dimen_6.h, bottom: Sizes.dimen_4.h),
                child: Text(
                  SharedString.detailItems,
                  style: Theme.of(context).textTheme.blackHeadline6,
                ),
              ),
              Column(children: detailItemList),
              SizedBox(
                height: Sizes.dimen_6.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemData extends StatelessWidget {
  const ItemData({
    Key? key,
    this.item,
  }) : super(key: key);
  final TmanifestoutitemEntity? item;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width / 2 - Sizes.dimen_24.w - 5,
            child: item != null
                ? Text(
                    item?.mitem?.itemname ?? '',
                    style: Theme.of(context).textTheme.greySubtitle1,
                  )
                : ShimmerWidget.rectangular(height: Sizes.dimen_12.h)),
        SizedBox(
            width: MediaQuery.of(context).size.width / 2 - Sizes.dimen_24.w - 5,
            child: item != null
                ? Text(
                    item?.itemqty.toString() ?? '',
                    style: Theme.of(context).textTheme.blackHeadline6,
                    textAlign: TextAlign.right,
                  )
                : ShimmerWidget.rectangular(height: Sizes.dimen_12.h))
      ],
    );
  }
}
