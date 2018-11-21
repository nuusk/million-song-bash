BEGIN {
	FS=",";
	OFS=",";
}

FILENAME == "db/activities.in" {
  if ($2 in popularity) {
    popularity[$2]++;
  } else {
    popularity[$2]=1;
  }
}

FILENAME == "db/songs.in" {
  songs[$1]=$3 " " $2;
}

END {
  for (i in popularity) {
    print songs[i], popularity[i];
  }
}
