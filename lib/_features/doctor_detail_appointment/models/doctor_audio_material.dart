class DoctorAudioMaterial {
  DoctorAudioMaterial({
    required this.audioPath,
    this.isSelected = true,
  });

  final String audioPath;

  final bool isSelected;

  DoctorAudioMaterial changeSelection() {
    return DoctorAudioMaterial(
      audioPath: audioPath,
      isSelected: !isSelected,
    );
  }

}
