import elAlambiqueViajero.*
object carrera {
    var aceptados = []
    var rechazados = [convertible,moto]
    var sedeActual = paris
   
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

    method replanificacionDeSede(unaSede) {
       self.unaSede(unaSede)
       aceptados.forEach({c=> self.inscricionesDe(c)}) and rechazados.forEach({c=> self.inscricionesDe(c)})
    } 
    method cambioDeSede(unaSede){
        self.unaSede(unaSede)
        const listaUnidad = aceptados + rechazados
        aceptados = listaUnidad.filter({c =>  self.puedeConpetir(c)})
        rechazados = listaUnidad.filter({c => !self.puedeConpetir(c)})
        

     }   


}