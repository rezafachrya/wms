part of 'manifest_list.dart';

class ManifestListScreen extends StatefulWidget {
  const ManifestListScreen({Key? key}) : super(key: key);

  @override
  _ManifestListScreenState createState() => _ManifestListScreenState();
}

class _ManifestListScreenState extends State<ManifestListScreen>
    with SingleTickerProviderStateMixin {
  late ManifestTabbedCubit manifestTabbedCubit;
  int currentTabIndex = 0;

  @override
  void initState() {
    manifestTabbedCubit = getItInstance<ManifestTabbedCubit>();
    manifestTabbedCubit.manifestTabChanged(currentTabIndex: currentTabIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => manifestTabbedCubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            SharedString.manifestList,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: BlocBuilder<ManifestTabbedCubit, ManifestTabbedState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for (var i = 0;
                        i < ManifestListConstant.manifestTabs.length;
                        i++)
                      TabTitleWidget(
                        title: ManifestListConstant.manifestTabs[i].title,
                        onTap: () => _onTabTapped(i),
                        isSelected:
                            ManifestListConstant.manifestTabs[i].index ==
                                state.currentTabIndex,
                      )
                  ],
                ),
                if (state is ManifestTabChanged)
                  //null safety pada saat movies null otomatis []
                  state.manifests.isEmpty
                      ?
                      //movie null
                      Expanded(
                          child: Center(
                            child: Text(
                              SharedString.manifestEmpty,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        )
                      : Expanded(
                          child: ManifestListViewBuilder(
                              manifests: state.manifests),
                          // child: Container(
                          //   child: Text('Manifest Ada'),
                          // ),
                        ),
                if (state is ManifestTabLoadError)
                  Expanded(
                    // child: AppErrorWidget(
                    //   errorType: state.errorType,
                    //   onPressed: () => movieTabbedCubit.movieTabChanged(
                    //       currentTabIndex: state.currentTabIndex),
                    // ),
                    child: Center(
                      child: Text('Error'),
                    ),
                  ),
                if (state is ManifestTabLoading)
                  Expanded(
                      child: Center(
                    child: SpinKitFadingCircle(
                      size: Sizes.dimen_64.w,
                      color: ThemeColor.royalBlue,
                    ),
                  ))
              ],
            );
          },
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    manifestTabbedCubit.manifestTabChanged(currentTabIndex: index);
  }
}
