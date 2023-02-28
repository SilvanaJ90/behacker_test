# BH PROFILE

## Table of Contents

- [General project requirements](https://github.com/SilvanaJ90/bh_profile#general-project-requirements)
- [General functionalities](https://github.com/SilvanaJ90/bh_profile#general-functionalities)
- [User roles](https://github.com/SilvanaJ90/bh_profile#user-roles)
- [Customer environment:](https://github.com/SilvanaJ90/bh_profile#customer-environment)
- [Administrator environment:](https://github.com/SilvanaJ90/bh_profile#administrator-environment)
- [Description of the Project](https://github.com/SilvanaJ90/bh_profile#description-of-the-project)
- [Description of the command interpreter](https://github.com/SilvanaJ90/bh_profile#description-of-the-command-interpreter).
- [How to Start It](https://github.com/SilvanaJ90/bh_profile#how-to-start-it)
- [How to Use It](https://github.com/SilvanaJ90/bh_profile#how-to-use-it)
- [Examples](https://github.com/SilvanaJ90/bh_profile#examples)
- [Authors](https://github.com/SilvanaJ90/bh_profile#authors)


## General project requirements

The development of a tool to profile professional interests and create well-defined job roles and profiles is desired. 


- [For this project you must install the following software ](https://github.com/SilvanaJ90/bh_profile/blob/main/requirements/install.txt)
- [Clone the repository ](https://github.com/SilvanaJ90/bh_profile.git)
- [Import the following database ](https://github.com/SilvanaJ90/bh_profile/blob/main/requirements/dump_bh_profile_db.sql)
command: ```cat dump_bh_profile_db.sql | sudo mysql -uroot -p```


## General functionalities

The platform will allow general users to create a profile that will allow them to enter the platform by means of a username and password, this profile will provide the possibility to access a series of views in which the system will allow the user to select several phrases or words.

Each of the phrases or words will be associated to a specific category as the user answers the questions, the system will validate the category with which the user has the greatest affinity.

The system will also have an administrative environment through which a user with administrator role will be able to view the responses of each of the people, the categories with which they have greater affinity, in this panel you can also view general reports associated with the answers provided by users.

During the development of the tool, the following must be taken into account:

- The user will enter the system by means of a username and password, he/she will have to create his/her respective profile
- The administrator will have the possibility to assign as many categories as he/she wishes.
- A series of phrases or words will be associated with each category and will be used as selection options in each view.
- The system will offer the user a maximum number of views defined by the administrator user.
- Each view will display a maximum number of words defined by the user administrator.
- As the general user selects words from the list, the system will assign a higher weight to the words related to the category in which the user shows a greater tendency.
- At the end of the exercise, the general user will receive an e-mail with a pdf document in which the characteristics of the category with which he/she had the greatest affinity are explained in greater detail.
- A user may take the test several times [HISTORY MUST BE KEPT PER USER WHEN THE TEST IS TAKEN SEVERAL TIMES].

## User roles

- General user: in charge of answering the questions
- Administrator, in charge of creating categories, words, managing users, managing system configuration and generating reports.

## Customer environment: 

System access module: through this module the user will be able to register, enter the system, remember his/her password in case he/she has forgotten it.

Profiling views: When entering the system the user will be able to visualize a series of views, which will simulate a questionnaire, in each of these views phrases and words will be displayed, which must be selected by the user. The phrases or words will be taken randomly from the different categories.

## Administrator environment:

Categories: the administrator user can manage the different categories of the system.

Words by categories: the module will allow the management of the different words.

User: each of the registered users can be displayed with their respective information and the tests developed.

Reports: a report module can be accessed, in which role trends are displayed.
## Description of the Project

**First step: Write a command interpreter to manage your bh_profileAirBnB objects.**

The development of a tool to profile professional interests and create well-defined job roles and profiles is desired. 

Each task is linked and will help you to:

    - put in place a parent class (called BaseModel) to take care of the initialization, serialization and          deserialization of your future instances
    - create a simple flow of serialization/deserialization:
        - Instance <-> Dictionary <-> JSON string <-> file
    - create all classes used for AirBnB that inherit from BaseModel
        - User
        - Test
        - Word
        - Category ..
    - create the first abstracted storage engine of the project: 
        - File storage.
    - create all unittests to validate all our classes and storage engine

## Description of the command interpreter

The console will be used for access of the functionalities offered by our components.
In our case, we want to be able to manage the objects of our project:

    - Create a new object (ex: a new User or a new Place)
    - Retrieve an object from a file, a database etc…
    - Do operations on objects (count, compute stats, etc…)
    - Update attributes of an object
    - Destroy an object

## How to Start It
Execution
- Start the flask server
```
HBNB_MYSQL_USER=bh_profile_dev HBNB_MYSQL_PWD=bh_profile_pwd HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=bh_profile_db HBNB_TYPE_STORAGE=db python3 -m app.app_profile
```
- Start api rest
```
HBNB_MYSQL_USER=bh_profile_dev HBNB_MYSQL_PWD=bh_profile_pwd HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=bh_profile_db HBNB_TYPE_STORAGE=db HBNB_TYPE_STORAGE=db HBNB_API_HOST=0.0.0.0 HBNB_API_PORT=5001 python3 -m api.v1.app
```

## BH profile - development of the project

### The console


    - create your data model
    - manage (create, update, destroy, etc) objects via a console / command interpreter
    - store and persist objects to a file (JSON file)

The first piece is to manipulate a powerful storage system. This storage engine will give us an abstraction between “My object” and “How they are stored and persisted”. This means: from your console code (the command interpreter itself) and from the front-end and RestAPI you will build later, you won’t have to pay attention (take care) of how your objects are stored.

This abstraction will also allow you to change the type of storage easily without updating all of your codebase.

The console will be a tool to validate this storage engine

![This is an image](https://github.com/SilvanaJ90/bh_profile/blob/main/img/console.png)

This project has a console that allows you to create, update, delete, insert data into 
- [The database using the following commands ](https://github.com/SilvanaJ90/bh_profile/blob/main/requirements/console_mysql.txt)
- [Learn more about the console here ](https://github.com/SilvanaJ90/bh_profile/blob/main/requirements/console.txt)


### Web static


    - learn HTML/CSS
    - create the HTML of your application
    - create template of each object


![This is an image](https://github.com/SilvanaJ90/bh_profile/blob/main/img/web-static.png)

### MySQL storage

![This is an image](https://github.com/SilvanaJ90/bh_profile/blob/main/img/db.png)

    - replace the file storage by a Database storage
    - map your models to a table in database by using an O.R.M.

![This is an image](https://github.com/SilvanaJ90/bh_profile/blob/main/img/mysql.png)

### Web framework - templating

    - create your first web server in Python
    - make your static HTML file dynamic by using objects stored in a file or database

![This is an image](https://github.com/SilvanaJ90/bh_profile/blob/main/img/framework.png)

### RESTful API

    - expose all your objects stored via a JSON web interface
    - manipulate your objects via a RESTful API
    
    The api is documented, you can access it through the following link http://127.0.0.1:5001/apidocs/

![This is an image](https://github.com/SilvanaJ90/bh_profile/blob/main/img/api.png)

### BH Profile - Web dynamic
    - learn JQuery
    - load objects from the client side by using your own RESTful API

![This is an image](https://github.com/SilvanaJ90/bh_profile/blob/main/img/dynamic.png)


## Authors
### This file lists all individuals having contributed content to the repository.
- Giovanni Pérez <5187@holbertonstudents.com>
- Silvana Jaramillo <5211@holbertonstudents.com>
- Jhonatan Ramos <5202@holbertonstudents.com>
