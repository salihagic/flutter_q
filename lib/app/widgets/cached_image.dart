import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_q/_all.dart';
import 'package:octo_image/octo_image.dart';

class CachedImage extends StatelessWidget {
  final String? url;
  final String? blurHash;
  final Widget? placeholder;
  final BoxFit fit;
  final double? width;
  final double? height;
  final bool zoomEnabled;

  const CachedImage({
    Key? key,
    this.url,
    this.blurHash,
    this.placeholder,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.zoomEnabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final octoImage = OctoImage(
      image: CachedNetworkImageProvider(url ?? ''),
      placeholderBuilder: () {
        if (blurHash != null && blurHash != '') {
          return OctoPlaceholder.blurHash(blurHash!);
        }

        return OctoPlaceholder.circularProgressIndicator();
      }(),
      errorBuilder: placeholder != null ? (_, __, ___) => placeholder! : OctoError.icon(color: Colors.red),
      fit: fit,
      width: width,
      height: height,
    );

    if (zoomEnabled) {
      return InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(80),
        minScale: 0.8,
        maxScale: 4,
        child: octoImage,
      );
    } else {
      return octoImage;
    }
  }
}
