FILE=./config/local/database.yaml
if test -f "$FILE"; then
    echo "$FILE exists. Pimcore is already installed"
else
    echo "$FILE not exists. Pimcore is not installed, proceeding to installation"
    cp .env.local.ddev-example .env.local
    COMPOSER_MEMORY_LIMIT=-1 composer install
    ./vendor/bin/pimcore-install --mysql-host-socket=db --mysql-username=db --mysql-password=db --mysql-database=db 
fi