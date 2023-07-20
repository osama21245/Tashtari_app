import '../../../linksApi.dart';
import '../../model/imageList_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Imagelist> imagelist = [
  Imagelist(SvgPicture.network(Apilinks.linkcamera), "camera"),
  Imagelist(SvgPicture.network(Apilinks.linkdress), "dress"),
  Imagelist(SvgPicture.network(Apilinks.linklaptop), "laptop"),
  Imagelist(SvgPicture.network(Apilinks.linkmobile), "mobile"),
  Imagelist(SvgPicture.network(Apilinks.linkshose), "shose")
];
