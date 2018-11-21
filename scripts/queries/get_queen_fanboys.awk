BEGIN {
	FS=",";
	OFS=","

  queen_song_iterator=0;
}

FILENAME == "db/users.in" {
  # get the real id of a user
  users[$1]=$2;
}

FILENAME == "db/songs.in" && $2 == "Queen" {
  # assuming all tracks in our input are unique, we don't have to check whether a song is already in the array
  queen_songs[$1]=1;
}

FILENAME == "db/activities.in" {
  if ($2 in queen_songs) {
    # this user is listening to a queen song

    # this key looks like "a,b", 
    # a - represents the user that is listening 
    # b - song that this user listens to
    hash_user_activity_queen = $1 "," $2;
    # 1 means 'true', or in other words: user 'a' has listened to song 'b'
    queen_fanboys[hash_user_activity_queen]=1;
    popularity[$2]++;
  }
}

END {
  # find three maximum popularity values
  for (i=0; i<3; i++) {
    for (j in popularity) {
      if (popularity[j] > max[i]) {
        max[i] = j;
      }
    }
    # after we select the current maximum value, delete this song from the list
    delete popularity[max[i]];
  }

  # convert max array to dictionary that tells us which
  for (i=0; i<3; i++) {
    is_most_popular[max[i]]=1;
  }

  for (i in queen_fanboys) {
    # print i;
    # split activity key into seperate elements
    # activity[1] is the user id
    # activity[2] is the song id
    split(i, activity, ",");

    if (!already_listened[activity[1]]) {
      # if it's 1, the user hasn't been listening to most popular tracks (yet)
      already_listened[activity[1]] = 1 + 0;
    }

    # check history is based on three prime numbers: 2, 3 and 5
    # if the user has listened to the first most popular queen track, his already_listened value will be divisible by 2
    # if the user has listened to the second most popular queen track, his already_listened value will be divisible by 3
    # if the user has listened to the thid most popular queen track, his already_listened value will be divisible by 5
    primes[0]=2; primes[1]=3; primes[2]=5;
    # iterate through our prime numbers
    for (i = 0; i < 3; i++) {
      if (activity[2] == max[i] && (already_listened[activity[1]]%primes[i]) != 0) {
        already_listened[activity[1]] *= primes[i];
      }  
    }
  }

  for (i in queen_fanboys) {
    split(i, activity, ",");
    if (already_listened[activity[1]] == 30 && already_printed[activity[1]] != 1) {
      print users[activity[1]];
      already_printed[activity[1]] = 1;
    }
  }
}
