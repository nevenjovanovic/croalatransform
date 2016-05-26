#!/usr/bin/env bash
# nlw-abc-get.sh, 2016-05-14
# download alphabetical lists of entries in the Neulateinische Wortliste
# put files in the present directory
# usage: ./nlw-abc-get.sh

set -o errexit
set -o pipefail
set -o nounset

# Declare array for the alphabet
lista=( a b c d e f g h i k l m n o p q r s t u x y z )

# make filename for each file, use wget

for slovo in "${lista[@]}"
do
    wget http://www.neulatein.de/lemmata/lem_"${slovo}".htm
done

