FILE=.ci/vendor/bin/phpstan
if [ ! -f "$FILE" ]; then
FILE=vendor/bin/phpstan
fi

"$FILE" analyse -c phpstan.neon