FILE=.ci/vendor/bin/php-cs-fixer
if [ ! -f "$FILE" ]; then
FILE=vendor/bin/php-cs-fixer
fi

"$FILE" fix --config=.php-cs -v --dry-run --using-cache=no --diff --allow-risky=yes