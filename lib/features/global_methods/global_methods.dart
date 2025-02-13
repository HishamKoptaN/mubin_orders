import '../../core/global/responsive.dart';

double setWidth(context, double value) {
  return Res.isMobile(context) ? value : value / 2;
}

double setFont(context, double value) {
  return Res.isMobile(context) ? value * 1.3 : value;
}
