abstract class DetailSessionState {}

// DetailSession
class DetailSessionInitial extends DetailSessionState {
  final int currentIndex = 0;
}

class DetailSessionChanged extends DetailSessionState {
  final int currentIndex;

  DetailSessionChanged(this.currentIndex);
}
