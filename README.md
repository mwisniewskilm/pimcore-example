# Pimcore Example Pack

Project components:
- [x] Pimcore 11
- [x] Separate NPM container 
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






