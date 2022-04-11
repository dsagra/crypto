### #03 Fav Crypto List

El challenge consiste en armar una app chica en flutter para llevar el listado del precio de tus cryptomonedas favoritas.

![](https://i.imgur.com/sUrxO15.png)

- Armar Pantalla con listado de las crypto favoritas y su valor actual en USD
- Consumir la siguiente Api https://cryptapi.io/docs para conseguir el valor actual en USD
- Agregar Boton de "+" para poder buscar y agregar una nueva cripto
- Armar pantalla buscador de Crypto ( el listado de las Crypto debe estar hardcodeado en una lista dentro de la app ) [BTC, ETH, LITECOIN, TRX]
- Al Clickear en una crypto previamente buscada, te redirecciona a una pantalla para poner el monto obtenido en dicha moneda
- Armar pantalla para cargar el monto actual en dicha moneda, y un boton guardar que te guarda el nuevo item como favorito y redireccionar a la primera pantalla

## +1

Los siguientes puntos no son necesarios en la entrega, pero sí suman:

- Que el listado de la cryptos a agregar sea dinamico consumiendolo desde otro endpoint
- Que puedas seleccionar la currency final, en vez de USD , poder mostrar otra
- Unificar UI en menos pantalla, Pop-up // Modals
- Guardar informacion al cerrar/apagar y prender la aplicacion

## Entrega

- El tiempo de resolución del challenge son 3 días contando desde el momento que se envió el mismo.
- Se debe enviar la desarrollado vía git.
- El código debe poder ejecutarse y ver la solución funcionando.
- Enviar las instrucciones que sean necesarias para ejecutar la solución, y en caso de que sea oportuno comentarios o consideraciones realizadas sobre la problemática o la forma en la que fue resuelta.

#### Antes de empezar

Todos los precios totales a mostrar son en USD
Inicialmente se debe dejar binance como exchange por defecto

### Ejemplo de endpoint call

`https://api.cryptapi.io/btc/info/`
