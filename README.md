# CodeDeploy

  1. Lo primero que debemos hacer es crear una instancia de EC2 con los recursos necesarios para desplegar nuestra aplicación.
     
  3. Usando el servicio de CodeDeploy de AWS creamos una aplicación, asignándole un nombre y el tipo de plataforma a usar (Lambda, ECS o EC2 como es en nuestro caso).
     
  4. Creamos el grupo de implementación, asignandole nombre, rol, tipo de instancia junto a una etiqueta que la identifique y el tipo de implementación.
     
  5. En la raíz de nuestra aplicación, contaremos con el fichero **appspec.yml**, un archivo YAML en el que indicamos a CodeDeploy el sistema operativo de la instancia, la ruta de los ficheros de origen y la ruta de destino de la aplicación para la fase *Installation*, así como las rutas de los scripts, timeouts y de los hooks para las fases *ApplicationStop*, *BeforeInstall*, *AfterInstall* y *ApplicationStart*.
    
  6. También en la raíz de nuestra aplicación, debemos incluir los scripts mencionados anteriormente, que en nuestro caso consistirán en:
     - *ApplicationStop*: parar el servicio de Tomcat
     - *BeforeInstall*: compilar la aplicación
     - *AfterInstall*: renombrar el fichero war de la aplciación
     - *ApplicationStart*: reiniciar el servicio de Tomcat
       
  7. Creamos la implementación, asignándole un nombre, el tipo de revisión (GitHub en nuestro caso, indicando el repositorio del que queremos obtener la aplicación y el id de confirmación con el token del commit deseado) y establecemos el control de errores a sobreescribir el contenido.

---
## Workflows

Dentro de la carpeta .github/workflows se encuentran dos ficheros YAML, **test.yml** y **deploy.yml**.<br/>
En estos archivo se define el momento de ejecución de cada workflow y los trabajos que deben realizar, paso a paso.
<br/>

- **test.yml** compila y testea la aplicación. Se lanza al realizar un commit a la rama main.<br/>
- **deploy.yml** crea una implementación de nuestra aplicación en CodeDeploy en caso de que el workflow anterior se haya ejecutado correctamente.
