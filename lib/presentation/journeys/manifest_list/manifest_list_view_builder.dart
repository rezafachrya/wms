part of 'manifest_list.dart';

class ManifestListViewBuilder extends StatelessWidget {
  final List<TmanifestoutEntity> manifests;

  const ManifestListViewBuilder({
    Key? key,
    required this.manifests,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Sizes.dimen_24.w,
        right: Sizes.dimen_24.w,
        top: Sizes.dimen_8.h,
      ),
      child: ListView.separated(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: manifests.length,
        // scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: Sizes.dimen_4),
            // height: Sizes.dimen_4.h,
          );
        },
        itemBuilder: (context, index) {
          final TmanifestoutEntity manifest = manifests[index];
          return InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              RouteList.itemScreen,
              arguments:
                  ItemArguments(manifest.manifestid, isManifestList: 'Y'),
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(manifest.manifestid,
                    style: Theme.of(context).textTheme.blackHeadline6),
              ),
            ),
          );
        },
      ),
    );
  }
}
