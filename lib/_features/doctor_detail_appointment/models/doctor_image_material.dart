class DoctorImageMaterial {
  DoctorImageMaterial({
    required this.imagePath,
    this.isSelected = true,
  });

  final String imagePath;

  final bool isSelected;

  DoctorImageMaterial changeSelection() {
    return DoctorImageMaterial(
      imagePath: imagePath,
      isSelected: !isSelected,
    );
  }

}
