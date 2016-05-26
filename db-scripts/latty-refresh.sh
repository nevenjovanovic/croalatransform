#!/usr/bin/env bash
# latty-refresh.sh, 2015-10-26
# create new latty database, backup it, rsync backup
# to solr, croala, and basex/data
# usage: ./rad/croala-r/local-scripts/latty-refresh.sh

set -o errexit
set -o pipefail
set -o nounset

echo "LatTy-refresh: ažuriram bazu latty..."
./basex/bin/basex -c /home/neven/rad/croala-r/local-scripts/create-latty.bxs
echo "Provjeravam datum ažuriranja..."
INF=`./basex/bin/basex -c /home/neven/rad/croala-r/local-scripts/check-latty.bxs`
echo -e "Baza latty posljednji je put ažurirana ${INF}.\n"

echo "Radim sigurnosnu kopiju..."
./basex/bin/basex -c /home/neven/rad/croala-r/local-scripts/latty-backup.bxs

BACKUP=`ls /home/neven/BaseXData/*.zip -t | head -1`
echo "Sigurnosna kopija: ${BACKUP}."

echo "Presnimavam s adrese ${BACKUP} u /home/neven/basex/data..."
rsync -avzP ${BACKUP} /home/neven/basex/data/
echo -e "Presnimavam s adrese ${BACKUP} \nna solr.ffzg.hr..."
rsync -avzP -e 'ssh -p 12122' ${BACKUP} njovanov@pluton.ffzg.hr:/home/njovanov/b/basex/data/
echo -e "Presnimavam s adrese ${BACKUP} \nna croala.ffzg.hr..."
rsync -avzP -e 'ssh -p 13322' ${BACKUP} njovanov@pluton.ffzg.hr:/home/njovanov/
echo -e "Baza latty ažurirana ${INF}\nSigurnosna kopija ${BACKUP} \npresnimljena u basex/data, na solr i croala."


