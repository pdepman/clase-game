object puenteBrooklyn {
    var property position = game.center() 
    
    method dejaPasar(mensajero) = mensajero.peso() < 1000
    method image() = "brooklyn.png"
}

object matrix {
    var property position = game.center() 
    method dejaPasar(mensajero) = mensajero.puedeLlamar()
    method image() = "matrix.png"
    
}

object paquete {
    var estaPago = false
    
    method puedeEntregarse(mensajero, destino) = destino.dejaPasar(mensajero) && estaPago
    method pagar() {
        estaPago = true
    } 
}

object roberto {
    var pesoPropio = 100
    var vehiculo = bicicleta

    method puedeLlamar() = false
    method peso() = pesoPropio + vehiculo.peso()

    method vehiculo(unVehiculo) {
        vehiculo = unVehiculo
    }
}

object bicicleta {
    method peso() = 1
}
object camion {
    var cantidadAcoplados = 1
    var property position = game.center()
    method image() = "jugador.png"
    

    method peso() = cantidadAcoplados * 500
    method cantidadAcoplados(cantidad) {
        cantidadAcoplados = cantidad
    }
}

object neo {
    var tieneCredito = true
    var property position = game.origin()
    method image() = "neo.png"

    method peso() = 0
    method puedeLlamar() = tieneCredito
}

object chuckNorris {
    method peso() = 900
    method puedeLlamar() = true
    var property position = game.origin()
    method image() = "chuck_norris.png"

}