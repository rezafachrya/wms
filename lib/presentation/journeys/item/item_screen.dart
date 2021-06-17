part of 'item.dart';

class ItemScreen extends StatefulWidget {
  final ItemArguments arguments;

  const ItemScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  late ScanqrCubit scanqrCubit;
  late ManifestoutitemCubit manifestoutitemCubit;
  late ManifestoutCubit manifestoutCubit;
  late ManifestouttrackCubit manifestouttrackCubit;

  DateTime now = DateTime.now();

  bool isLoading = false;

  TextEditingController? _descriptionNameController;

  @override
  void initState() {
    super.initState();
    _descriptionNameController = TextEditingController();
    scanqrCubit = getItInstance<ScanqrCubit>();
    manifestoutitemCubit = scanqrCubit.manifestoutitemCubit;
    manifestouttrackCubit = scanqrCubit.manifestouttrackCubit;
    scanqrCubit.scanQrCode(widget.arguments.qrcode);
    manifestoutCubit = getItInstance<ManifestoutCubit>();
    // manifestouttrackCubit = getItInstance<ManifestouttrackCubit>();
  }

  @override
  void dispose() {
    scanqrCubit.close();
    manifestoutitemCubit.close();
    manifestoutCubit.close();
    manifestouttrackCubit.close();
    _descriptionNameController?.dispose();
    super.dispose();
  }

  _setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserEntity userEntity =
        (BlocProvider.of<LoginCubit>(context).state as LoginSuccess).userEntity;
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return WillPopScope(
      onWillPop: () async {
        (widget.arguments.isManifestList == "Y")
            ? Navigator.pop(context)
            : Navigator.pushNamed(context, RouteList.home);
        return true;
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: scanqrCubit),
          BlocProvider.value(value: manifestoutitemCubit),
          BlocProvider.value(value: manifestoutCubit),
          BlocProvider.value(value: manifestouttrackCubit),
        ],
        child: GeneralPage(
          title: SharedString.item.toUpperCase(),
          subtitle: SharedString.listofItem,
          onBackButtonPressed: () {
            (widget.arguments.isManifestList == "Y")
                ? Navigator.pop(context)
                : Navigator.pushNamed(context, RouteList.home);
          },
          backColor: 'FAFAFC'.toColor(),
          child: BlocBuilder<ScanqrCubit, ScanqrState>(
            builder: (context, state) {
              if (state is ScanqrSuccess) {
                String sendStatus = (state.tmanifestoutEntity.status
                                .toUpperCase() ==
                            'PC' &&
                        userEntity.userlocid.toUpperCase() ==
                            state.tmanifestoutEntity.loccurrent.toUpperCase())
                    ? 'DL'
                    : (state.tmanifestoutEntity.status.toUpperCase() == 'DL' &&
                            userEntity.userlocid.toUpperCase() ==
                                state.tmanifestoutEntity.locdesti.toUpperCase())
                        ? 'DN'
                        : 'NN';

                bool isSend = (userEntity.userloctype == UserLocType.region &&
                        state.tmanifestoutEntity.status == 'PC' &&
                        sendStatus != 'NN' ||
                    userEntity.userloctype == UserLocType.subregion &&
                        state.tmanifestoutEntity.status == 'DL' &&
                        sendStatus != 'NN');
                return Column(
                  children: [
                    SizedBox(
                      height: Sizes.dimen_12.h,
                    ),
                    ItemBody(
                      manifestid: state.tmanifestoutEntity.manifestid,
                      status: state.tmanifestoutEntity.status,
                    ),
                    Visibility(
                      visible: widget.arguments.isManifestList != "Y",
                      child: Container(
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
                                SharedString.description,
                                style:
                                    Theme.of(context).textTheme.blackHeadline6,
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
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .greySubtitle1,
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
                    ),
                    Visibility(
                      visible: widget.arguments.isManifestList != "Y",
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: Sizes.dimen_12.w),
                        height: Sizes.dimen_24.h,
                        width: double.infinity,
                        child: isLoading
                            ? Center(
                                child: SpinKitFadingCircle(
                                  size: 40,
                                  color: ThemeColor.royalBlue,
                                ),
                              )
                            : ElevatedButton(
                                onPressed: isSend
                                    ? () async {
                                        _setLoading(true);
                                        await context
                                            .read<ManifestoutCubit>()
                                            .updateManifestout(
                                              state.tmanifestoutEntity
                                                  .tmanifestoutpk
                                                  .toString(),
                                              sendStatus,
                                            );
                                        ManifestoutState manifestoutState =
                                            context
                                                .read<ManifestoutCubit>()
                                                .state;
                                        if (manifestoutState
                                            is UpdateManifestoutSuccess) {
                                          await context
                                              .read<ManifestouttrackCubit>()
                                              .insertManifestoutTrackCubit(
                                                tmanifestoutpk: state
                                                    .tmanifestoutEntity
                                                    .tmanifestoutpk,
                                                trackdesc:
                                                    _descriptionNameController
                                                            ?.text ??
                                                        '',
                                                tracklat: userEntity.userloclat,
                                                tracklocation:
                                                    userEntity.userlocname,
                                                tracklong:
                                                    userEntity.userloclong,
                                                tracktime: formattedDate,
                                              );
                                          SharedDialog.successSnackBar(
                                              SharedString.updateManifestout,
                                              SharedString
                                                  .updateManifestoutSuccess);
                                          await Future.delayed(
                                              Duration(milliseconds: 1750));
                                          await Navigator.of(context)
                                              .pushNamed(RouteList.home);
                                        } else {
                                          SharedDialog.errorSnackBar(
                                              SharedString.updateManifestout,
                                              SharedString
                                                  .updateManifestoutFailed);
                                          await Future.delayed(
                                              Duration(milliseconds: 1750));
                                          _setLoading(false);
                                        }
                                      }
                                    : () async {
                                        SharedDialog.errorSnackBar(
                                            SharedString.updateManifestout,
                                            SharedString
                                                .updateManifestoutFailedUser);
                                        await Future.delayed(
                                            Duration(milliseconds: 1750));
                                      },
                                style: ButtonStyle(
                                    elevation:
                                        MaterialStateProperty.all<double>(0),
                                    backgroundColor: MaterialStateProperty.all(
                                        ThemeColor.royalBlue),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    )),
                                child: Text(
                                  SharedString.send,
                                  style: Theme.of(context)
                                      .textTheme
                                      .blackSubtitle1,
                                ),
                              ),
                      ),
                    ),
                    //TODO: Bottom Sheet
                    Visibility(
                      visible: widget.arguments.isManifestList == "Y",
                      child: Container(
                        height: Sizes.dimen_24.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => manifestoutTrackShowModalBottomSheet(
                              context, manifestouttrackCubit),
                          child: Text(
                            SharedString.manifestoutTrack,
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Sizes.dimen_2.h,
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

  Future<dynamic> manifestoutTrackShowModalBottomSheet(
      BuildContext context, ManifestouttrackCubit manifestouttrackCubit) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        // int totalIcon = 4;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.3),
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: Colors.red[400],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Sizes.dimen_4.h,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              color: ThemeColor.vulcan,
              width: double.infinity,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Sizes.dimen_2.h),
                      child: Text(
                        SharedString.manifestoutTrack,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: Sizes.dimen_1.h,
                      width: Sizes.dimen_140.w,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: Sizes.dimen_4.h,
                    ),
                    BlocBuilder<ManifestouttrackCubit, ManifestouttrackState>(
                      bloc: manifestouttrackCubit,
                      builder: (context, state) {
                        if (state is ManifestoutTrackLoadedSuccess) {
                          return Column(
                            children: state.tmanifestoutTracks
                                .map((e) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  shape: BoxShape.circle),
                                              width: Sizes.dimen_48.w,
                                              height: Sizes.dimen_12.h,
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: Sizes.dimen_20.w,
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    e.tracklocation,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1
                                                        ?.copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                  ),
                                                  Text(
                                                    e.trackdesc,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2,
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  e.tracktime.getAppDate,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: Sizes.dimen_1.h,
                                        ),
                                        (e == state.tmanifestoutTracks.last)
                                            ? SizedBox.shrink()
                                            : Container(
                                                height: Sizes.dimen_16.h,
                                                width: Sizes.dimen_48.w,
                                                color: Colors.transparent,
                                                child: Center(
                                                  child:
                                                      generateDashedDivider(38),
                                                ),
                                              )
                                      ],
                                    ))
                                .toList(),
                          );
                        } else if (state is ManifestoutTrackLoading) {
                          return Center(
                            child: SpinKitFadingCircle(
                              size: 40,
                              color: ThemeColor.royalBlue,
                            ),
                          );
                        } else {
                          return Center(
                            child: Text('Error'),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget generateDashedDivider(double height) {
    int n = height ~/ 4;
    return Column(
      children: List.generate(
          n,
          (index) => (index % 2 == 0)
              ? Container(
                  height: height / n,
                  width: 2,
                  color: Color(0xFFE4E4E4),
                )
              : SizedBox(
                  height: height / n,
                )),
    );
  }
}
