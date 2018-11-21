BEGIN {
  FS="<SEP>";
  OFS=",";
  users_iterator=0;
  songs_iterator=0;

  line_iterator=0;
  while(( getline line < "db/tmp/songs.hash") > 0  ) {
    split(line, song_id, ",");
    songs_hashmap[song_id[2]]=song_id[1];
  }
}

FILENAME == "data/triplets_test.txt" {

	# split($0, a, ",");
	# email = a[2];
	# emails[FNR] = email;
	# name[email] = a[1];
	# average[email] = a[3];
  print $2;
}

FILENAME == "addresses.txt" {
	email = $11;
	address[email] = $4 ", " $5 ", " $7 " " $8;
}

# END {
# 	for ( i in emails ) {
# 		print name[emails[i]], address[emails[i]], 
# 			int(average[emails[i]]);
# 	}
# }


# {
#   if (!($1 in users)) {
#     users[$1] = users_iterator;
#     users_iterator++;
#   }

#   # if (!($2 in songs)) {
#   #   songs[$2] = songs_iterator;
#   #   songs_iterator++;
#   # }
#   # user_id=users[$1];
#   # song_id=songs[$2];

#   # we only need a month from the date for our operations, so we don't extract it. strftime("%m", $3)
#   # print users[$1], tmp, strftime("%m", $3) > "db/activities.in"
#   print users[$1], $2, strftime("%m", $3);
# }

# END {
#   for (i in users) {
#     print users[i], i > "db/users.in"
#   }

#   for (j in songs_hashmap) {
#     # print songs[i], i > "db/songs.in"
#     # print j, songs_hashmap[j];
#   }
# }


# # FNR - record number (in the current file)
# # $2 - song id
# # $3 - artist
# # $4 - song
