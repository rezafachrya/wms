part of 'pages.dart';

class ListResultItemPage extends StatefulWidget {
  final String qrcode;

  const ListResultItemPage({Key key, this.qrcode}) : super(key: key);
  @override
  _ListResultItemPageState createState() => _ListResultItemPageState();
}

class _ListResultItemPageState extends State<ListResultItemPage> {
  TextEditingController _descriptionNameController;

  @override
  void initState() {
    super.initState();
    _descriptionNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Get.to(HomePage()),
      child: GeneralPage(
        title: 'ITEM',
        subtitle: 'List of Item',
        onBackButtonPressed: () {
          Get.to(HomePage());
        },
        backColor: 'FAFAFC'.toColor(),
        child: Column(
          children: [
            SizedBox(
              height: Sizes.dimen_12.h,
            ),
            //// Bagian atas
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
                          widget.qrcode,
                          style: Theme.of(context).textTheme.blackHeadline6,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Text(
                        'total item(s)',
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              Sizes.dimen_24.w -
                              5,
                          child: Text(
                            'barang1',
                            style: Theme.of(context).textTheme.greySubtitle1,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              Sizes.dimen_24.w -
                              5,
                          child: Text(
                            '1',
                            style: Theme.of(context).textTheme.blackHeadline6,
                            textAlign: TextAlign.right,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              Sizes.dimen_24.w -
                              5,
                          child: Text(
                            'barang1',
                            style: Theme.of(context).textTheme.greySubtitle1,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              Sizes.dimen_24.w -
                              5,
                          child: Text(
                            '1',
                            style: Theme.of(context).textTheme.blackHeadline6,
                            textAlign: TextAlign.right,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              Sizes.dimen_24.w -
                              5,
                          child: Text(
                            'barang1',
                            style: Theme.of(context).textTheme.greySubtitle1,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              Sizes.dimen_24.w -
                              5,
                          child: Text(
                            '1',
                            style: Theme.of(context).textTheme.blackHeadline6,
                            textAlign: TextAlign.right,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              Sizes.dimen_24.w -
                              5,
                          child: Text(
                            'barang1',
                            style: Theme.of(context).textTheme.greySubtitle1,
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              Sizes.dimen_24.w -
                              5,
                          child: Text(
                            '1',
                            style: Theme.of(context).textTheme.blackHeadline6,
                            textAlign: TextAlign.right,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(bottom: Sizes.dimen_12.h),
              padding: EdgeInsets.symmetric(
                  horizontal: Sizes.dimen_24.w, vertical: Sizes.dimen_8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: Sizes.dimen_4.h),
                    child: Text(
                      'Description',
                      style: Theme.of(context).textTheme.blackHeadline6,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black)),
                    child: TextFormField(
                      controller: _descriptionNameController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: Theme.of(context).textTheme.greySubtitle1,
                          hintText: 'Type your description...'),
                      minLines:
                          6, // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w),
              height: 45,
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                elevation: 0,
                color: ThemeColor.royalBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Send",
                  style: Theme.of(context).textTheme.blackSubtitle1,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            )
          ],
        ),
      ),
    );
  }
}
