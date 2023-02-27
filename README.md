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



## Authors
### This file lists all individuals having contributed content to the repository.
- Giovanni Pérez <5187@holbertonstudents.com>
- Silvana Jaramillo <5211@holbertonstudents.com>
- Jhonatan Ramos <5202@holbertonstudents.com>
