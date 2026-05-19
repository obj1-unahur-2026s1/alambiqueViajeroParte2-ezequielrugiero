import elAlambiqueViajero.*
object carrera {
    var aceptados = []
    var rechazados = [convertible,moto]
    var sedeActual = paris
   
   
   // sin estos dos metodos no podes visulizar, ni interatuar con las listas.-
    method aceptado() = aceptados
    method rechazados () = rechazados
    
    method puedeConpetir(elVehiculo) {
        sedeActual.puedeLlegar(elVehiculo)

    }
     
    method sedeActual(){
         return sedeActual

    }
    method unaSede(nueva){
        sedeActual = nueva
    }

    method inscricionesDe (unVehiculo){
        if (sedeActual.puedeLlegar(unVehiculo)){
            aceptados.add(unVehiculo)
        }else {rechazados.add(unVehiculo)}
    }
    // primera solucion la cual todabia no funciona
    method replanificacionDeSede(unaSede) {
       self.unaSede(unaSede)
       const listaUnida = aceptados + rechazados
       aceptados.clear()
       rechazados.clear()
       listaUnida.forEach({c=> self.inscricionesDe(c)})
    } 
   // segunda solucion propuesta por un compañero la cual tampoc funciona 
    method cambioDeSede(unaSede){
        self.unaSede(unaSede)
        const listaUnidad = aceptados + rechazados
        aceptados = listaUnidad.filter({c =>  self.puedeConpetir(c)})
        rechazados = listaUnidad.filter({c => !self.puedeConpetir(c)})
        

     }
    // esto trafoma una lista en un conjuto y de nuevo a una lista, sirver para eliminar los duplicado.    
    method limpiarDuplicadoDe(unaLista){
        aceptados = unaLista.asSet().asList()
    }

}