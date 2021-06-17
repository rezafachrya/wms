import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qrscan/common/constants/constants.dart';
import 'package:qrscan/common/themes/themes.dart';
import 'package:qrscan/common/extensions/extensions.dart';
import 'package:qrscan/di/get_it.dart';
import 'package:qrscan/domain/entities/entities.dart';
import 'package:qrscan/presentation/cubits/manifest_tabbed/manifest_tabbed_cubit.dart';
import 'package:qrscan/presentation/journeys/item/item.dart';

part 'manifest_list_screen.dart';
part 'manifest_list_constant.dart';
part 'tab_title_widget.dart';
part 'tab.dart';
part 'manifest_list_view_builder.dart';
