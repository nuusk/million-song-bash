#  _                        __                     
# | |                      / _|                    
# | |_ _ __ __ _ _ __  ___| |_ ___  _ __ _ __ ___  
# | __| '__/ _` | '_ \/ __|  _/ _ \| '__| '_ ` _ \ 
# | |_| | | (_| | | | \__ \ || (_) | |  | | | | | |
#  \__|_|  \__,_|_| |_|___/_| \___/|_|  |_| |_| |_|
                                               
#  _                  _        
# | |                | |       
# | |_ _ __ __ _  ___| | _____ 
# | __| '__/ _` |/ __| |/ / __|
# | |_| | | (_| | (__|   <\__ \
#  \__|_|  \__,_|\___|_|\_\___/

BEGIN {
  FS="<SEP>";
  OFS=",";
  songs_iterator=0;
}

{
  if (!($2 in songs)) {
    songs[$2] = songs_iterator;
    songs_iterator++;
  }
  print songs[$2], $3, $4 > "db/songs.in";
}

END {
  # create hash map for songs (abstract id -> real id)
  # abstract id is just a number from 0 to number of songs
  # it helps us to process data faster
  for (i in songs) {
    print songs[i], i > "db/tmp/songs.hash";
  }
}

# FNR - record number (in the current file)
# $2 - song id
# $3 - artist
# $4 - song
