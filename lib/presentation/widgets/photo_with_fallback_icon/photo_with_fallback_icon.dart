import 'package:flutter/material.dart';
import 'package:mobile/business_logic/models/photo/photo.dart';
import 'package:mobile/presentation/widgets/no_image_icon_placeholder/no_image_icon_placeholder.dart';

const Duration fadeInDuration = Duration(milliseconds: 1500);

class PhotoWithFallbackIcon extends StatefulWidget {
  final Photo? photo;
  final Size size;
  const PhotoWithFallbackIcon({super.key, this.photo, required this.size});

  @override
  State<PhotoWithFallbackIcon> createState() => _PhotoWithFallbackIconState();
}

class _PhotoWithFallbackIconState extends State<PhotoWithFallbackIcon>
    with SingleTickerProviderStateMixin {
  NetworkImage? _image;
  bool _isLoading = true;
  AnimationController? _controller;
  Animation<double>? _fadeInOpacityAnimation;

  @override
  Widget build(BuildContext context) {
    if (widget.photo == null) {
      return NoImageIconPlaceholder(
        size: widget.size,
        isAnimated: true,
      );
    }

    // Note: While loading the recipe image from the internet,
    // we show an icon as a placeholder and once the image data
    // is available, we fade it slowly in.
    return Stack(children: <Widget>[
      if (_isLoading)
        NoImageIconPlaceholder(
          size: widget.size,
          isAnimated: true,
        ),
      if (!_isLoading && _fadeInOpacityAnimation != null)
        AnimatedBuilder(
          animation: _fadeInOpacityAnimation!,
          builder: (BuildContext context, Widget? child) {
            final opacity = _fadeInOpacityAnimation!.value;
            return Opacity(opacity: opacity, child: child!);
          },
          child: Image(
            image: _image!,
            fit: BoxFit.cover,
            width: widget.size.width,
            height: widget.size.height,
          ),
        ),
    ]);
  }

  @override
  void initState() {
    super.initState();
    if (widget.photo == null) return;

    _createFadeImageInAnimation();
    _animateImageFadeInOnImageUploadCompleted();
  }

  @override
  void dispose() {
    if (_controller != null) _controller!.dispose();
    // FIXME: HOW TO DISPOSE OF THE LISTENER?
    super.dispose();
  }

  void _createFadeImageInAnimation() {
    _controller = AnimationController(
      value: 0.0,
      vsync: this,
      duration: fadeInDuration,
    );

    _fadeInOpacityAnimation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
    );
  }

  void _animateImageFadeInOnImageUploadCompleted() {
    if (_controller == null) return;

    final listener = ImageStreamListener((ImageInfo info, bool syncCall) {
      if (mounted == false) return;
      setState(() {
        _isLoading = false;
      });

      _controller!.forward();
    });

    _image = NetworkImage(widget.photo!.url);
    _image?.resolve(const ImageConfiguration()).addListener(listener);
  }
}
