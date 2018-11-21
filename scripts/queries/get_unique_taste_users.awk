BEGIN {
	FS=",";
	OFS=",";
}

FILENAME == "db/activities.in" {
  print $0
}

FILENAME == "db/songs.in" {

}

FILENAME == "db/users.in" {

}

END {
  for (i in popularity) {
    print songs[i], popularity[i];
  }
}
