BEGIN {
	FS=",";
	OFS=","
}

FILENAME == "db/activities.in" {
  # hash_key looks like a,b 
  # it represents a situation when user with given id 'a' listens to song with id 'b'
  hash_key=$1 "," $2;
  if (!(hash_key in unique_set)) {
    # here hash_key is unique
    # it means that user didn't listen to this song before (in previous lines)
    unique_taste_counter[$1]++;
    unique_set[hash_key] = 1;
  }
}

FILENAME == "db/users.in" {
  # get the real id of a user
  users[$1]=$2;
}

END {
  for (i in unique_taste_counter) {
    print users[i], unique_taste_counter[i];
  }
}
