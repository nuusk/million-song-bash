# Million song dataset challenge
## in bash, using awk

http://www.cs.put.poznan.pl/kdembczynski/lectures/pmds/labs/05/lab-05.pdf

## Star schema

### db/activities.out

| col 1 | col 2 | col 3 |
|------ | ----- | ----- |
| User ID  | Song ID | Date (only month) |

### db

## Getting started

Instructions for how to get started with the project on your local machine.

### Prerequisites

You will need a bash shell in order to run it.

You will also need some data to import to the database. The files that I've been using are accessible through the laboratory website.

| File | Download link |
| ------------- | ------------- |
| Unique tracks  | [unique_tracks.zip](http://www.cs.put.poznan.pl/kdembczynski/lectures/data/unique_tracks.zip) |
| Listen activities (.zip)  | [triplets_sample_20p.zip](http://www.cs.put.poznan.pl/kdembczynski/lectures/data/triplets_sample_20p.zip) |

### Installing

Clone the repo.

```
git clone https://github.com/pietersweter/million-song-bash.git
```

Run the main script

```
sh app.sh
```

## Built With

* [Bash](https://www.gnu.org/software/bash/)
* [awk](https://www.gnu.org/software/gawk/manual/gawk.html)
