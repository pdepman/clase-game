import Solucion.example.*

object puenteBrooklyn {
  method image() = "./brooklyn.png"
  
  method position() = game.center()
  
  method dejaPasar(mensajero) = mensajero.peso() < 1000
  
  method proximoDestino() = matrix
}

object matrix {
  var property position = game.center()
  
  method image() = "./matrix.png"
  
  method dejaPasar(mensajero) = mensajero.puedeLlamar()
  
  method proximoDestino() = puenteBrooklyn
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
  
  method image() = "./neo.png"
  
  method peso() = 0
  
  method puedeLlamar() = tieneCredito
}

object chuckNorris {
  method peso() = 900
  
  method puedeLlamar() = true
}

object mensajeria {
  var mensajeros = []
  var paquetesPendientes = []
  
  method puedeEntregar(paquete) = mensajeros.any(
    { mensajero => mensajero.puedeEntregar(paquete) }
  )
  
  method quienesPuedenLlevar(paquete) = mensajeros.filter(
    { mensajero => mensajero.puedeEntregar(paquete) }
  )
  
  method tieneSobrepeso() = self.promedioPeso() > 500
  
  method promedioPeso() = mensajeros.sum(
    { mensajero => mensajero.peso() }
  ) / mensajeros.size()
  
  method enviarPaquete(paquete) {
    const mensajerosDisponibles = self.quienesPuedenLlevar(paquete)
    
    if (mensajerosDisponibles.size() === 0) paquetesPendientes.add(paquete)
    
    const mensajero = mensajerosDisponibles.anyOne()
    // mensajero.enviar(paquete)
  }
  
  method enviarTodos(paquetes) {
    paquetes.forEach({ paquete => self.enviarPaquete(paquete) })
  }
  
  method enviarMasCaro() {
    const paqueteMasCaro = paquetesPendientes.max({ paquete => paquete.precio() })
    /* esto devuelve un numero, queremos un objeto paquete     
    const paqueteMasCaro = paquetesPendientes.map(
      { paquete => paquete.precio() }
    ).max() */

    

    self.enviarPaquete(paqueteMasCaro)
  }
  
  // Mensajeros
  method mensajeros() = mensajeros
  
  method contratar(unMensajero) {
    mensajeros.add(unMensajero)
  }
  
  method despedir(unMensajero) {
    mensajeros.remove(unMensajero)
  }
  
  method despedirTodos() {
    mensajeros.clear()
  }
  
  method esMensajeriaGrande() = mensajeros.size() > 2
  
  method puedeEntregarPrimero(unPaquete, unDestino) = unPaquete.puedeEntregarse(
    mensajeros.head(),
    unDestino
  )
  
  method pesoUltimo() = mensajeros.last().peso()
}

object paquetito {
  const estaPago = true
  
  method puedeEntregarse(mensajero) = true
  
  method pagar() {
    
  }
}

object paquetonViajero {
  var destinos = []
  var valorPagado = 0
  
  method pagar(monto) {
    valorPagado += monto
  }
  
  method puedeEntregarse(mensajero) = self.estaPagado() && destinos.all(
    { destino => destino.dejaPasar(mensajero) }
  )
  
  method precio() = 100 * destinos.size()
  
  method estaPagado() = valorPagado >= self.precio()
}