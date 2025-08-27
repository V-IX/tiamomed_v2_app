class DoctorVideoMaterial {
  DoctorVideoMaterial({
    required this.previewImagePath,
    required this.videoPath,
    this.isSelected = true,
  });

  final String previewImagePath;
  final String videoPath;

  final bool isSelected;

  DoctorVideoMaterial changeSelection() {
    return DoctorVideoMaterial(
      previewImagePath: previewImagePath,
      videoPath: videoPath,
      isSelected: !isSelected,
    );
  }

}
