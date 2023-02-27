# BH 

## Table of Contents

- [Description of the Project](https://github.com/Giogap/holbertonschool-AirBnB_clone/blob/main/README.md#description-of-the-project/)
- [Description of the command interpreter](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4#description-of-the-project).
- [How to Start It](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4#how-to-start-it)
- [How to Use It](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4#how-to-use-it)
- [Examples](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4#examples)
- [Authors](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4#authors)


## Requisitos generales del proyecto

La empresa X es un ecosistema digital que permite a las personas y a las organizaciones adquirir conocimientos, habilidades, estrategias y desarrollar capacidades para enfrentar los retos de ciberseguridad que se tienen en la sociedad actual y futura.

La empresa desea llevar a cabo el desarrollo de una herramienta que permita perfilar los intereses profesionales, y formar roles y perfiles laborales bien definidos. 


## Funcionalidades generales

La plataforma permitirá a los usuarios generales crear un perfil que le permita ingresar a la plataforma por medio de usuario y contraseña, este perfíl le brindará la posibilidad de acceder a una serie de vistas en las cuales el sistema le permitirá al usuario seleccionar varias frases o palabras.

Cada una de las frases o palabras estará asociada a un categoría específica a medida que el usuario vaya contestando las preguntas, el sistema deberá ir validando la categoría con la cual el usuario tenga mayor afinidad.

El sistema también contará con un entorno administrativo por medio del cual un usuario con rol administrador podrá visualizar las respuestas de cada una de las personas, las categorías con las cuales tiene mayor afinidad, en este panel también podrá visualizar informes generales asociados a las respuestas proporcionadas por los usuarios. 

Durante el desarrollo de la herramienta se debe tener en cuenta: 

-	El usuario ingresará al sistema por medio de usuario y contraseña, este deberá crear su respectivo perfil
-	El administrador tendrá la posibilidad de asignar tantas categorías como desee
-	A cada categoría se asociarán una serie de frases o palabras que serán posteriormente utilizadas como opciones de selección en cada vista. 
-	El sistema ofrecerá al usuario un número máximo de vistas definido por el usuario administrador. 
-	Cada vista mostrará un número máximo de palabras definidas por el usuario administrador
-	A medida que el usuario general va seleccionando palabras de la lista, el sistema irá asignando un mayor peso a las palabras relacionadas a la categoría en la cual se vaya evidenciando una mayor tendencia por parte del usuario.
-	Al finalizar el ejercicio, el usuario general recibirá en su correo electrónico un documento pdf en el cual se da a conocer con mayor detalle las características de la categoría con la cual tuvo mayor afinidad. 
-	Un usuario podrá realizar varias veces el test [SE DEBE CONSERVAR EL HISTÓRICO POR USUARIO CUANDO REALICE VARIAS VECES EL TEST]

## Roles de usuario

-	Usuario general: encargado de dar respuesta a las preguntas
-	Administrador, encargado de crear las categorías, palabras, gestionar usuario, gestionar la configuración del sistema y generar informes. 

# Módulos del sistema

## Entorno cliente: 

Módulo de acceso al sistema: por medio de este módulo el usuario podrá registrarse, ingresar al sistema, recordar su contraseña en caso de haberlo olvidado.  [VALIDAR SI REALMENTE SE REQUIERE EL REGISTRO DEL USUARIO]

Vistas de perfilamiento: Al ingresar al sistema el usuario podrá visualizar una serie de vistas, las cuales simularán un cuestionario, en cada una de estas vistas se podrá visualizar frases y palabras las cuales deberán ser seleccionadas por el usuario. Las frases o palabras serán tomadas de las diferentes categorías de forma aleatoria. 

## Entorno administrador: 

Categorías: el usuario administrador podrá gestionar las diferentes categorías del sistema.

Palabras por categorías: el módulo permitirá la gestión de las diferentes palabras. 

Usuario: se podrá visualizar cada uno de los usuarios registrados con su respectiva información y los test desarrollados. 

Informes: se podrá acceder a un módulos de informes, en el cual se visualizan las tendencias de roles. 

## Description of the Project

**First step: Write a command interpreter to manage your AirBnB objects.**

This is the first step towards building your first full web application: the **AirBnB clone.** This first step is very important because you will use what you build during this project with all other following projects: HTML/CSS templating, database storage, API, front-end integration… 

Each task is linked and will help you to:

    - put in place a parent class (called BaseModel) to take care of the initialization, serialization and          deserialization of your future instances
    - create a simple flow of serialization/deserialization:
        - Instance <-> Dictionary <-> JSON string <-> file
    - create all classes used for AirBnB that inherit from BaseModel
        - User
        - State
        -City
        - Place ..
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
```
Your shell should work like this in interactive mode:
$ ./console.py
(hbnb) help

Documented commands (type help <topic>):
========================================
EOF  help  quit

(hbnb) 
(hbnb) 
(hbnb) quit
$
```

But also in non-interactive mode: (like the Shell project in C)
```
$ echo "help" | ./console.py
(hbnb)

Documented commands (type help <topic>):
========================================
EOF  help  quit
(hbnb) 
$
$ cat test_help
help
$
$ cat test_help | ./console.py
(hbnb)

Documented commands (type help <topic>):
========================================
EOF  help  quit
(hbnb) 
$
```
All tests should also pass in non-interactive mode: $ echo "python3 -m unittest discover tests" | bash

### Steps

You won’t build this application all at once, but step by step.

Each step will link to a concept:
The console

    create your data model
    manage (create, update, destroy, etc) objects via a console / command interpreter
    store and persist objects to a file (JSON file)

The first piece is to manipulate a powerful storage system. This storage engine will give us an abstraction between “My object” and “How they are stored and persisted”. This means: from your console code (the command interpreter itself) and from the front-end and RestAPI you will build later, you won’t have to pay attention (take care) of how your objects are stored.

This abstraction will also allow you to change the type of storage easily without updating all of your codebase.

The console will be a tool to validate this storage engine
## AirBnB clone - development of the project

### The console


    - create your data model
    - manage (create, update, destroy, etc) objects via a console / command interpreter
    - store and persist objects to a file (JSON file)

The first piece is to manipulate a powerful storage system. This storage engine will give us an abstraction between “My object” and “How they are stored and persisted”. This means: from your console code (the command interpreter itself) and from the front-end and RestAPI you will build later, you won’t have to pay attention (take care) of how your objects are stored.

This abstraction will also allow you to change the type of storage easily without updating all of your codebase.

The console will be a tool to validate this storage engine

![This is an image](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4/blob/main/img/console.png)

### Web static


    - learn HTML/CSS
    - create the HTML of your application
    - create template of each object


![This is an image](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4/blob/main/img/web-static.png)

### MySQL storage

    - replace the file storage by a Database storage
    - map your models to a table in database by using an O.R.M.

![This is an image](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4/blob/main/img/mysql.png)

### Web framework - templating

    - create your first web server in Python
    - make your static HTML file dynamic by using objects stored in a file or database

![This is an image](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4/blob/main/img/framework.png)

### RESTful API

    - expose all your objects stored via a JSON web interface
    - manipulate your objects via a RESTful API

![This is an image](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4/blob/main/img/api.png)

### AirBnB clone - Web dynamic
    - learn JQuery
    - load objects from the client side by using your own RESTful API

![This is an image](https://github.com/Giogap/holbertonschool-AirBnB_clone_v4/blob/main/img/dynamic.png)

## How to Use It

| Command | Description |
| --- | --- |
| help | The help command is a command prompt,  command that's used to provide more information on another command. |
| EOF | Exit the program. |
| quit | Exit the program. |
| create | Creates a new instance of BaseModel, saves it (to the JSON file) and prints the id. Ex: $ create BaseModel. |
| show | Prints the string representation of an instance based on the class name and id. Ex: $ show BaseModel 1234-1234-1234. |
| destroy | Deletes an instance based on the class name and id (save the change into the JSON file). Ex: $ destroy BaseModel 1234-1234-1234. |
| all | Prints all string representation of all instances based or not on the class name. Ex: $ all BaseModel or $ all. |
| update | Updates an instance based on the class name and id by adding or updating attribute (save the change into the JSON file). Ex: $ update BaseModel 1234-1234-1234 email "aibnb@mail.com". |


## Examples

Commad:

help:
```
./console.py 
(hbnb) help

Documented commands (type help <topic>):
========================================
EOF  all  create  destroy  help  quit  show  update
```


quit and EOF:
```
./console.py 
(hbnb) help quit
Quit command to exit the program
(hbnb) help EOF
Quit command to exit the program
(hbnb) quit
```

create:
```
./console.py 
(hbnb) create BaseModel
bb711919-2e80-4ce2-85aa-454484f89013
(hbnb) 
```

show:
```
./console.py 
(hbnb) show BaseModel bb711919-2e80-4ce2-85aa-454484f89013
[BaseModel] (bb711919-2e80-4ce2-85aa-454484f89013) {'id': 'bb711919-2e80-4ce2-85aa-454484f89013', 'created_at': datetime.datetime(2022, 10, 29, 18, 31, 52, 943770), 'updated_at': datetime.datetime(2022, 10, 29, 18, 31, 52, 943843)}
(hbnb)
```

destroy:
```
./console.py 
(hbnb) destroy BaseModel bb711919-2e80-4ce2-85aa-454484f89013
(hbnb)
```

all:
```
./console.py 
(hbnb) all BaseModel
["[BaseModel] (24a40c4d-d6b9-4d48-999e-033a3dcf3e59) {'id': '24a40c4d-d6b9-4d48-999e-033a3dcf3e59', 'created_at': datetime.datetime(2022, 10, 28, 15, 42, 50, 756172), 'updated_at': datetime.datetime(2022, 10, 28, 15, 42, 50, 756225)}", "[BaseModel] (5acb1f7f-386a-473a-9b45-b68a01a33fb9) {'id': '5acb1f7f-386a-473a-9b45-b68a01a33fb9', 'created_at': datetime.datetime(2022, 10, 28, 16, 8, 56, 496681), 'updated_at': datetime.datetime(2022, 10, 28, 16, 8, 56, 496725)}", "[BaseModel] (0079d3d4-9527-44ba-92be-2f15061964ad) {'id': '0079d3d4-9527-44ba-92be-2f15061964ad', 'created_at': datetime.datetime(2022, 10, 29, 18, 31, 30, 922270), 'updated_at': datetime.datetime(2022, 10, 29, 18, 31, 30, 922286)}"]
(hbnb) 
```

update:
```
./console.py 
(hbnb) create BaseModel
683382c7-0351-4249-8987-ce2c42c0f1df
(hbnb) update BaseModel 683382c7-0351-4249-8987-ce2c42c0f1df first_name "Betty"
(hbnb) show BaseModel 683382c7-0351-4249-8987-ce2c42c0f1df
[BaseModel] (683382c7-0351-4249-8987-ce2c42c0f1df) {'id': '683382c7-0351-4249-8987-ce2c42c0f1df', 'created_at': datetime.datetime(2022, 10, 29, 18, 39, 5, 144900), 'updated_at': datetime.datetime(2022, 10, 29, 18, 39, 5, 144949), 'first_name': '"Betty"'}
```

## Authors
### This file lists all individuals having contributed content to the repository.
- Giovanni Pérez <5187@holbertonstudents.com>
- Silvana Jaramillo <5211@holbertonstudents.com>
- Jhonatan Ramos <5202@holbertonstudents.com>
