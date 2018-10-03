# Bonnus SDK iOS V1.0

- Release 03 Octubre 2018. V1.0
    
Configuración del SDK de Bonnus para iOS.

- Incluir el archivo BonnusSDK.framework al proyecto:

Para agregar el SDK, lo arrastramos a nuestro proyecto desde el area de navegación de Xcode:

Nos aseguramos de que se agregue en la sub sección de Embedded Binaries, si no es así lo agregamos con el boton + y borramos cualquier duplicado generado en la sección Linked  Framewotks and Libraries.

- Importamos la libreria en el AppDelegate de nuesta aplicación:
```
import BonnusSDK
```

- Se manda llamar la función Setup en el AppDelegate, dentro de la funcion didFinishLaunchingWithOptions
```
Bonnus.instance.setupBonnus(UIApplication: application)
```

- Credenciales para inicio de sesión en la API de Bonnus:

Para usar el SDK, tenemos que instanciarlo una vez cada vez que la aplicación abra :
(userID es opcional, pero recomendado)
```
      Bonnus.instance.initWithCredentials(partnerID: "PartnerID - asignado",
                                            token: "token asignado",
                                            sdkId: "sdkId asignado",
                                            userID: "Identificado de usuario unico")
```

- Configuración del SDK.
La configuración del SDK vive dentro de la plataforma de Bonnus, al activar el SDK se guardaran los datos de configuración en el dispositivo. La configuración del SDK sólo puede ser modificada por Bonnus.


Mensaje de Abandono (opcional): Algunos Bonnus contienen una liga a sitios o apps externas, es posible enviar al usuario un mensaje de abandono antes de que deje la Aplicación.

Color Fondo: Establece el color a utilizar para el fondo de los Bonnus.
Color notificación: Establece el color de la notificación in-App cuando el usuario ha obtenido un Bonnus.
Color Botón: Establece el color de los botones.
Color Texto: Establece el color de los textos principales (Títulos)

Mensaje Aceptar: Establece el texto del botón para aceptar el Bonnus (Predeterminado: "Aceptar").
Mensaje Cerrar: Establece el texto del botón para cerrar el Pop-up del Bonnus (Predeterminado: "Guardar").

Estilo: Estable la plantilla a utilizar: Actualmente se cuentan con dos plantillas diferentes.
Mensaje de Soporte: Es posible establecer un mensaje personalizado para Dudas / Contacto / Soporte.

Momentos: Para configurar los momentos es necesario la siguiente información:
Trigger: Establece el texto o textos para establecer en la acción: (ej. "Momento1", "Mom1")
Logica de activación: Establece cuándo se va a dar un Bonnus, y consta de dos elementos, Logica (Igual, Mayor o Menor), Numero (1, 2, 100, 50.60).
Reusable: Establece si el usuario puede ganar un Bonnus cada vez que se cumpla la condición o sólo una vez.
Notificación: Establece si el bonnus mostrará una notificación in-App o directamente un Pop-up.


- Configuración opcional del SDK.
El SDK permite configuración opcional desde la aplicación y se debe incluir antes de la activación del SDK

- Activar el SDK.
La funcionalidad de Bonnus será transparente hasta que no se active el SDK, de esta forma la Aplicación puede decidir cuando inicializar, por ejemplo si se desea activar la funcionalidad sólo a usuario nuevos entones el SDK se deberá activar en el registro o en el proceso que se deseé.



- Registro de Actividad / Momento 

Para procesar una acción:

```
    @IBAction func ClickButtonOne(_ sender: Any) {
        Bonnus.instance.tryToRedeemPrice(momento: "La accion")
    }
```

- Listado de Bonnus obtenidos.

Para enseñar la lista de Bonnus obtenidos es necesario llamar a esta función, de esta forma la aplicación puede incluir dentro de se menú o con algún botón en especial.
```
        Bonnus.instance.showRewardsViewController(currentViewController: self)
```
Ahora la APP puede consultar si el SDK está activo.
 ```
 let result = UserSettings.isSDKStarted() 
 ``` 
