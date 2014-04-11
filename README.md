#Overview
The VM setup by this vagrantfile and puppet provisioning config was created for a project that required PHP 5.2 and Symfony 1.1.6. I started with a Debian squeeze box provided by [puphpet (Thanks puphpet!)](https://puphpet.com/), then added an install.sh script inside the /puphpet/files/exec-once folder that handles downgrading PHP, installing symfony, and running project specific files.

##Installation
1. Clone this repo
2. Edit puphpet/files/exec-once/install.sh to install symfony or not.
  * If you only need PHP 5.2, you may want to comment out everything after ```sudo bash installphp52.sh```
3. Type vagrant up in the directory you installed this repo into.

##Tips?

###Git Submodule
If you want to add this vagrant setup to an existing project, I would recommend setting it up as a submodule. However, in order to do so you will need to edit puphpet's config.yaml (/puphpet/config.yaml) from
```yaml
synced_folder:
  4I266QFkRLKU:
    source: ./
    target: /var/www
```
to
```yaml
synced_folder:
  4I266QFkRLKU:
    source: ../
    target: /var/www
```

After changing the source of the synced folder (your project files) to look at the parent directory, try the below commands:
```bash
git submodule add git@github.com:SgtPooki/Debian-Squeeze-PHP5.2.git vagrant
cd vagrant
vagrant up
```

You will probably also need to edit the aliases and apache settings in the puphpet/config.yaml file.

###Database import

You can edit the puphpet/config.yaml file to automatically import an sql file into your databases as well. Edit the sql_file option to point to the .sql file to import.
```yaml
mysql:
    databases:
        dbIdentifier1:
            sql_file:
```
