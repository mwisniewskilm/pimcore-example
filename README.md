# Pimcore DDEV Starter Pack

Project components:
- [x] Pimcore 11
- [x] DDEV Configuration
- [x] phpMyAdmin for DDEV configuration
- [x] Separate NPM container for DDEV & docker-compose configuration
- [x] docker-compose configuration for local dev env
- [x] docker-compose configuration for stage
- [x] docker-compose configuration for production
- [x] php-stan level 8 configuration
- [x] CS fixer configuration
- [x] Scripts for automatic installation
- [x] Pipelines configuration with static code analysis
- [x] Readme & installation guides
- [x] Optional configuration for elasticsearch & kibana for DDEV configuration
- [ ] Automatic deployment configuration

There are two ways of launching this project you can either launch with DDEV or traditional Docker Compose configuration

---

# Starting new project with DDEV using this pack

1. go to `.ddev/config.yaml`
2. Change the `name` value in that file
3. Save changes

---

# Setting up local environment using DDEV 

You can set up your local env using [DDEV](https://ddev.com/) tool

### Getting started with DDEV 

1. if you don't have DDEV on your system, install [**DDEV**](https://ddev.com/get-started/) and [**mkcert**](https://github.com/FiloSottile/mkcert) first

### Setting up project

1. If you have ddev and mkcert installed, start your project using 
```
ddev start
```

2. If pimcore is not installed, it will automatically start installation
- Script will check if pimcore is not installed 
- If not, it automatically creates **.env.local** file based on `.env.local.ddev-example`
- Also script will automatically start `composer install` and pimcore installation. 
- If pimcore is already installed and you want to install again, you need to remove `./config/local/database.yaml` in order launch installation at first start

3. Go through the pimcore installation

- enter desired login and password for admin panel
- When pimcore asks `Do you want to install bundles? We recommend PimcoreSimpleBackendSearchBundle, PimcoreTinymceBundle. (yes/no)` type **yes** and hit **enter**
- `Which bundle(s) do you want to install? You can choose multiple e.g. 0,1,2,3 or just hit enter to install recommended bundles [PimcoreSimpleBackendSearchBundle, PimcoreTinymceBundle]` hit **enter**
- Confirm that you want to install pimcore

4. Your project should be available under `https://pimcorestarter.ddev.site`. If you changed the project name in `.ddev/config.yaml` project should be available under `https://YOURPROJECTNAME.ddev.site` . If it is not available, or to get more info about project and check your available services, hosts, ports and adresses, use command
```
ddev describe
```

5. To access console use 
```
ddev ssh
```

6. You can have multiple projects running at same time. To stop project use
```
ddev stop
```
Configuration files for ddev and docker compose can be found in `/.ddev` directory

### .env files
All changes in **.env** file should by done by overriding .env file using **.env.local** file. There is also additional .env file in `/.ddev` directory. It's used to store variables for containers configuration

## Optional DDEV configurations

### ElasticSearch & Kibana

If you want to use Elasticsearch and Kibana in your project, copy relevant docker-compose files from `.ddev-optionals` to `.ddev` directory, and then use 
```
ddev start
```


# Starting new project with docker-compose using this pack

1. edit `docker-compose.yml`, `docker-compose-stage.yml` and `docker-compose-prod.yml`
2. Change ever `starterpack` value to name relevant according to your project f.ex. `superhiperduperproject`
3. Save changes


---

# Setting up local environment using docker-compose

Follow these steps if you don't want to use DDEV to set up local environment

### .env files
All changes in **.env** file should by done by overriding .env file using **.env.local** file. If you will use installation script, that file will be created automatically

### Setting up project

1. Run docker containers using 
``` 
./run_dev.sh 
```

If needed add execution permissions in your system using

```
sudo chmod +x ./run_dev
```
2. Enter the machine using
``` 
docker-compose exec php-fpm bash
```
3. Run installation script using, you can skip that step and do installation manually
``` 
./pimcore_install.sh 
```

If needed add execution permissions using
```
chmod +x ./pimcore_install.sh
```

- Script will check if pimcore is not installed 
- If not, it automatically creates **.env.local** file based on `.env.local.example`
- Also script will automatically start `composer install` and pimcore installation. 
- If pimcore is already installed you need to remove `./config/local/database.yaml` in order to use that script

4. Go through the pimcore installation

- enter desired login and password for admin panel
- When pimcore asks `Do you want to install bundles? We recommend PimcoreSimpleBackendSearchBundle, PimcoreTinymceBundle. (yes/no)` type **yes** and hit **enter**
- `Which bundle(s) do you want to install? You can choose multiple e.g. 0,1,2,3 or just hit enter to install recommended bundles [PimcoreSimpleBackendSearchBundle, PimcoreTinymceBundle]` hit **enter**
- Confirm that you want to install pimcore

5. Pimcore is now installed, you can access admin panel `localhost/admin`

# Static code analysis tools
PHPStan and CSfixer are used in this project, once project is installed you can access console of your machine and run one of two commands
```
composer analyse
```
Will only analyze your code with PHP Stan

```
composer fix
```
Will not only analyze your code, but also will do changes required for compliance with CS fixer configuration

# Additional shell scripts
There are few .sh files included 

### ./run_dev.sh
Script used to run local environment without using DDEV configuration 

### ./run_stage.sh
Script used to run stage environment, all commands that should be executed prior to, during, or after setting up environment have to be added here

### ./run_prod.sh
Script used to run stage environment, all commands that should be executed prior, during, or after setting up environment have to be added here

### ./pimcore_install.sh
Script used to install pimcore on local dev environment without using ddev, all actions related to installation have to be added here

### ./pimcore_install_ddev.sh
Script used to install pimcore on local dev environment using ddev, all actions related to installation have to be added here

### ./rebuild.sh
Script used to rebuild classes and clear caches

# Deployment & Pipelines
Currently there is configured pipeline running on merge request to stage and master branches. Pipeline is running phpStan and CS Fixer analysis tools and it must be successful in order to merge to these branches

Deployment: TBD 😉






