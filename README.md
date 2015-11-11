# Oxwall

Oxwall® is unbelievably flexible and easy to use PHP/MySQL social networking software platform.

Its flexibility is an extremely easy way to change the way it works using Oxwall plugins. These plugins are complete units of functionality that can be used for various purposes.

We take special care about core and plugins compatibility so any updates are easy like a breeze. Just click that button in the admin area.

Oxwall offers unseen level of efficiency when you need a full-featured, working site.

The project is operated by Oxwall Foundation - a non-profit that oversees the platform development and coordinates third party efforts.

Oxwall has been around since 2010 and never stopped active development. Join the movement!
![logo](https://rawgit.com/indiehosters/oxwall/master/logo.png)

# How to use this image

The easiest is to use our `docker-compose.yml`.

Make sure you have [docker-compose](http://docs.docker.com/compose/install/) installed. And then:

```
git clone https://github.com/indiehosters/oxwall.git
cd oxwall
# edit variables:
vi .env
docker-compose up
```

You can now access your instance on the port 80 of the IP of the container.

## Accees it from Internet

We recommend the usage of SSL, so the easiest is to modify the `nginx.conf` file.

Once it is done, you can connect to the port of the host by adding this line to `docker-compose.yml`:
```
web:
...
  - ports:
    - "443:443"
    - "80:80"
...
```

## Installation

Once started, you'll arrive at the configuration wizzard.
At the `Database Setup` step, please enter the following:
  -  Database Server: `db`
  -  Login: `root`
  -  Password: MYSQL_ROOT_PASSWORD (from your `.env` file)
  -  Database Name: oxwall (or you can choose)

And leave the rest as default.

Then you can continue the installation with the super user.

## Backup

In order to backup, just run the `./BACKUP` script. And copy all the data to a safe place.
