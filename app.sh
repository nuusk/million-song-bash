#!/bin/sh

# variable declaration
triplets="triplets_sample_20p.txt"
tracks="unique_tracks.txt"

triplets_test="triplets_test.txt"
tracks_test="tracks_test.txt"

# GET TEST FILES
# awk 'BEGIN{FS="<SEP>"} {print} NR==10000{exit}' data/$tracks > data/$tracks_test
# awk 'BEGIN{FS="<SEP>"} {print} NR==10000{exit}' data/$triplets > data/$triplets_test

# actual procecessing

# aside from generating temporary file with song hashmap, this script also creates db/songs.in
# mawk -f scripts/transform_tracks.awk data/$tracks_test | sort -t, -nk1 | mawk -F, '{print $2}' > "db/tmp/song_id.in";
mawk -f scripts/transform_tracks.awk data/$tracks_test

# gawk -f scripts/transform_triplets.awk FS="," "db/tmp/songs.hash" FS="<SEP>" data/$triplets_test

mawk -f scripts/transform_triplets.awk data/$triplets_test

