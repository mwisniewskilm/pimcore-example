./bin/console pimcore:deployment:classes-rebuild -c
echo "Classes Rebuild - done"
./bin/console cache:clear
./bin/console pimcore:cache:clear