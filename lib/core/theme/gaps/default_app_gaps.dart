import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: implementation_imports
import 'package:gap/src/widgets/gap.dart';
import 'i_app_gaps.dart';

class DefaultAppGaps implements IAppGaps {
  DefaultAppGaps() {
    small = Gap(10.sp);
    normal = Gap(16.sp);
    extra = Gap(48.sp);
    large = Gap(32.sp);
  }

  @override
  late final Gap extra;

  @override
  late final Gap small;

  @override
  late final Gap large;

  @override
  late final Gap normal;
}
