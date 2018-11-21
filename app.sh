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
mawk -f scripts/transform_tracks.awk data/$tracks_test

mawk -f scripts/transform_triplets.awk data/$triplets_test

# get popular songs. works.
# mawk -f scripts/queries/get_popularity.awk db/activities.in db/songs.in \
# | sort -t, -nrk2 \
# | sed 's/,/ /g'

# get most unique taste
mawk -f scripts/queries/get_unique_taste_users.awk db/activities.in db/songs.in db/users.in \
# | sort -t, -nrk2 \
# | sed 's/,/ /g'


