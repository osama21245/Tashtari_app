import 'package:flutter/material.dart';
import 'package:woocommerce_app/core/constant/imgaeasset.dart';
import '../../../linksApi.dart';
import '../../model/imageList_model.dart';
import '../../../core/constant/imgaeasset.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Imagelist> imagelist = [
  Imagelist(SvgPicture.network(Apilinks.linkcamera), "camera"),
  Imagelist(SvgPicture.network(Apilinks.linkdress), "dress"),
  Imagelist(SvgPicture.network(Apilinks.linklaptop), "laptop"),
  Imagelist(SvgPicture.network(Apilinks.linkmobile), "mobile"),
  Imagelist(SvgPicture.network(Apilinks.linkshose), "shose")
];
