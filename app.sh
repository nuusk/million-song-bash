#!/bin/sh

# change locale (fixes sorting issues)
LC_CTYPE=C

# variable declaration
triplets="triplets_sample_20p.txt"
tracks="unique_tracks.txt"

# create directories that will be used during the whole process
mkdir db 2> /dev/null
mkdir db/tmp 2> /dev/null

# generate databse - transform to star schema. only change those files when changing instances
mawk -f scripts/transform_tracks.awk data/$tracks
mawk -f scripts/transform_triplets.awk data/$triplets

# # get popular songs. works.
mawk -f scripts/queries/get_popularity.awk db/activities.in db/songs.in \
| sort -t, -nrk2 \
| head -10 \
| sed 's/,/ /g'

# # get most unique taste
mawk -f scripts/queries/get_unique_taste_users.awk db/activities.in db/users.in \
| sort -t, -nrk2 \
| head -10 \
| sed 's/,/ /g'

# # get most popular artist
mawk -f scripts/queries/get_most_popular_artist.awk db/songs.in db/activities.in \
| sort -t, -nrk2 \
| head -1 \
| sed 's/,/ /g'

# # get number of activities in each month
mawk -f scripts/queries/get_most_monthly_activities.awk db/activities.in \
| sort -t, -nk1 \
| sed 's/,/ /g'

# get queen fanboys (users that have listened to three of the most popular queen songs)
mawk -f scripts/queries/get_queen_fanboys.awk db/users.in db/songs.in db/activities.in \
| sort \
| head -10