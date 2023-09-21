import 'dart:io';

void main() {
  Music playlist = createSongsCollection();
  playlist.outputAllSongs();
  playlist.outputTotalSongsDuration();
  playlist.findSongs();
}

class Song {
  String title;
  String artistName;
  Duration songDuration;
  DateTime releaseDate;

  Song({
    required this.title,
    required this.artistName,
    required this.releaseDate,
    required this.songDuration
  });
}

class Playlist {
  String title;
  List<Song> songs;

  Playlist({required this.title, required this.songs});

  void outputAllSongs () {
    print("List of songs: ");

    for (int i = 0; i < songs.length; i++) {
      Song song = songs[i];
      print("Title: ${song.title}, artist: ${song.artistName}, duration: ${song.songDuration.toString().split(".")[0]}, date of release: ${song.releaseDate.toString().split(" ")[0]}");
    }
  }

  void outputTotalSongsDuration() {
    print("Total duration song's list: ${songs.getTotalSongsDuration().toString().split(".")[0]}");
  }
}

class Music extends Playlist with SearchMixin {
  Music({required super.title, required super.songs});
}

mixin SearchMixin on Playlist {
  List<Song> filteredSongs = [];

  void findSongs() {
    String? searchInputValue = stdin.readLineSync();

    if (searchInputValue == null || searchInputValue.isEmpty) {
      print("You entered empty value");
      return;
    }

    filteredSongs = songs.where((Song song) {
      return song.title.toLowerCase().contains(searchInputValue.toLowerCase())
          || song.artistName.toLowerCase().contains(searchInputValue.toLowerCase());
    }).toList();

    if (filteredSongs.isEmpty) {
      print("No song in the list");
    }

    for (int i = 0; i < filteredSongs.length; i++) {
      Song song = filteredSongs[i];
      print("Title: ${song.title}, artist: ${song.artistName}, duration: ${song.songDuration.toString().split(".")[0]}, date of release: ${song.releaseDate.toString().split(" ")[0]}");
    }

    print("Total duration of filtered song's list: ${filteredSongs.getTotalSongsDuration().toString().split(".")[0]}");
  }
}

extension TotalSongsDuration on List<Song> {
  Duration getTotalSongsDuration() {
    Duration totalDuration = const Duration();

    for (int i = 0; i < length; i++) {
      Song song = this[i];
      totalDuration += song.songDuration;
    }

    return totalDuration;
  }
}

Music createSongsCollection() {
  Set<Song> mySongs = {
    Song(title: "Another love",
        artistName: "Trinity",
        releaseDate: DateTime(2020, 3, 11),
        songDuration: const Duration(minutes: 3, seconds: 20)),
    Song(title: "Mama, I'm coming home",
        artistName: "Ozzy Osbourne",
        releaseDate: DateTime(2015, 7, 12),
        songDuration: const Duration(minutes: 2, seconds: 17)),
    Song(title: "Bleed out",
        artistName: "WT",
        releaseDate: DateTime(2023, 5, 19),
        songDuration: const Duration(minutes: 2, seconds: 32)),
    Song(title: "Run you",
        artistName: "The Qemists",
        releaseDate: DateTime(2010, 9, 8),
        songDuration: const Duration(minutes: 5, seconds: 11)),
    Song(title: "Fire",
        artistName: "Within Temptation",
        releaseDate: DateTime(2012, 4, 22),
        songDuration: const Duration(minutes: 2, seconds: 57)),
    Song(title: "Summer vibes",
        artistName: "Deep Radio",
        releaseDate: DateTime(2019, 11, 30),
        songDuration: const Duration(minutes: 1, seconds: 32)),
    Song(title: "Lay low",
        artistName: "Tiesto",
        releaseDate: DateTime(2012, 4, 17),
        songDuration: const Duration(minutes: 6, seconds: 54)),
    Song(title: "Hope",
        artistName: "NF",
        releaseDate: DateTime(2019, 10, 25),
        songDuration: const Duration(minutes: 4, seconds: 41)),
    Song(title: "last ride of the day",
        artistName: "Nightwish",
        releaseDate: DateTime(2022, 2, 8),
        songDuration: const Duration(minutes: 2, seconds: 34)),
    Song(title: "Mercy mirror",
        artistName: "WT",
        releaseDate: DateTime(2021, 10, 29),
        songDuration: const Duration(minutes: 3, seconds: 50)),
  };

  return Music(title: "My favorite songs", songs: mySongs.toList());
}