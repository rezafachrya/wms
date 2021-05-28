part of 'item.dart';

class ItemScreen extends StatefulWidget {
  final ItemArguments arguments;

  const ItemScreen({
    Key key,
    @required this.arguments,
  }) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  ScanqrCubit scanqrCubit;
  ManifestoutitemCubit manifestoutitemCubit;
  ManifestoutCubit manifestoutCubit;
  ManifestouttrackCubit manifestouttrackCubit;

  DateTime now = DateTime.now();

  TextEditingController _descriptionNameController;

  @override
  void initState() {
    super.initState();
    _descriptionNameController = TextEditingController();
    scanqrCubit = getItInstance<ScanqrCubit>();
    manifestoutitemCubit = scanqrCubit.manifestoutitemCubit;
    scanqrCubit.scanQrCode(widget.arguments.qrcode);
    manifestoutCubit = getItInstance<ManifestoutCubit>();
    manifestouttrackCubit = getItInstance<ManifestouttrackCubit>();
  }

  @override
  void dispose() {
    scanqrCubit?.close();
    manifestoutitemCubit?.close();
    manifestoutCubit?.close();
    manifestouttrackCubit?.close();
    _descriptionNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String userlocid =
        (BlocProvider.of<LoginCubit>(context).state as LoginSuccess)
            .userEntity
            .userlocid;
    String userlocname =
        (BlocProvider.of<LoginCubit>(context).state as LoginSuccess)
            .userEntity
            .userlocname;
    double userloclat =
        (BlocProvider.of<LoginCubit>(context).state as LoginSuccess)
            .userEntity
            .userloclat;
    double userloclong =
        (BlocProvider.of<LoginCubit>(context).state as LoginSuccess)
            .userEntity
            .userloclong;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, RouteList.home);
        return;
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: scanqrCubit),
          BlocProvider.value(value: manifestoutitemCubit),
          BlocProvider.value(value: manifestoutCubit),
          BlocProvider.value(value: manifestouttrackCubit),
        ],
        child: GeneralPage(
          title: 'ITEM',
          subtitle: 'List of Item',
          onBackButtonPressed: () {
            Navigator.of(context).pushNamed(RouteList.home);
          },
          backColor: 'FAFAFC'.toColor(),
          child: BlocBuilder<ScanqrCubit, ScanqrState>(
            builder: (context, state) {
              if (state is ScanqrSuccess) {
                return Column(
                  children: [
                    SizedBox(
                      height: Sizes.dimen_12.h,
                    ),
                    ItemBody(manifestid: state.tmanifestoutEntity.manifestid),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: Sizes.dimen_12.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_24.w,
                          vertical: Sizes.dimen_8.h),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: Sizes.dimen_16.w),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black)),
                            child: TextFormField(
                              controller: _descriptionNameController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle:
                                      Theme.of(context).textTheme.greySubtitle1,
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
                      margin:
                          EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w),
                      height: 45,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () async {
                          String status = (userlocid.toUpperCase() ==
                                  state.tmanifestoutEntity.locdesti
                                      .toUpperCase())
                              ? 'DN'
                              : 'DL';
                          await context
                              .read<ManifestoutCubit>()
                              .updateManifestout(
                                state.tmanifestoutEntity.tmanifestoutpk
                                    .toString(),
                                status,
                              );
                          ManifestoutState manifestoutState =
                              context.read<ManifestoutCubit>().state;
                          if (manifestoutState is UpdateManifestoutSuccess) {
                            await context
                                .read<ManifestouttrackCubit>()
                                .insertManifestoutTrackCubit(
                                  tmanifestoutpk:
                                      state.tmanifestoutEntity.tmanifestoutpk,
                                  trackdesc: _descriptionNameController.text,
                                  tracklat: userloclat,
                                  tracklocation: userlocname,
                                  tracklong: userloclong,
                                  tracktime: formattedDate,
                                );
                            SharedDialog.successSnackBar(
                                SharedString.updateManifestout,
                                SharedString.updateManifestoutSuccess);
                            await Future.delayed(Duration(milliseconds: 1750));
                            await Navigator.of(context)
                                .pushNamed(RouteList.home);
                          } else {
                            SharedDialog.errorSnackBar(
                                SharedString.updateManifestout,
                                SharedString.updateManifestoutFailed);
                            await Future.delayed(Duration(milliseconds: 1750));
                          }
                        },
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
                );
              } else if (state is ScanqrFailed) {
                return Container(
                  child: Center(
                    child: Text('Error'),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
