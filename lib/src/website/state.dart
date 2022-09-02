import 'package:f_yc_utils/f_yc_utils.dart';

class WebsiteState {
  // title
  final _title = "".obs;
  set title(value) => _title.value = value;
  get title => _title.value;

  // url
  final _url = "".obs;
  set url(value) => _url.value = value;
  get url => _url.value;
}
