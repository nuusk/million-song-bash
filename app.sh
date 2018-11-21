#!/bin/sh

# variable declaration
triplets="triplets_sample_20p.txt"
tracks="unique_tracks.txt"

triplets_test="triplets_test.txt"
tracks_test="tracks_test.txt"

# GET TEST FILES
# awk 'BEGIN{FS="<SEP>"} {print} NR==10000{exit}' data/$tracks > data/$tracks_test
# awk 'BEGIN{FS="<SEP>"} {print} NR==10000{exit}' data/$triplets > data/$triplets_test

# generate databse - transform to star schema. only change those files when changing instances
mawk -f scripts/transform_tracks.awk data/$tracks_test
mawk -f scripts/transform_triplets.awk data/$triplets_test

# get popular songs. works.
# gawk -f scripts/queries/get_popularity.awk db/activities.in db/songs.in \
# | sort -t, -nrk2 \
# | head -10 \
# | sed 's/,/ /g'

# get most unique taste
# mawk -f scripts/queries/get_unique_taste_users.awk db/activities.in db/users.in \
# | sort -t, -nrk2 \
# | head -10 \
# | sed 's/,/ /g'

# get most popular artist
# mawk -f scripts/queries/get_most_popular_artist.awk db/songs.in db/activities.in \
# | sort -t, -nrk2 \
# | head -1 \
# | sed 's/,/ /g'

# get number of activities in each month
mawk -f scripts/queries/get_most_monthly_activities.awk db/activities.in \
| sort -t, -nk1 \
| sed 's/,/ /g'