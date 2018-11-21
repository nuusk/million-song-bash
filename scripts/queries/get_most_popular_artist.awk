BEGIN {
	FS=",";
	OFS=","
}

FILENAME == "db/songs.in" {
  # map song to the artist
  song_to_artist[$1]=$2;
}

FILENAME == "db/activities.in" {
  # increment popularity of that artist
  popularity[song_to_artist[$2]]++;
}

END {
  for (i in popularity) {
    print i, popularity[i];
  }
}
