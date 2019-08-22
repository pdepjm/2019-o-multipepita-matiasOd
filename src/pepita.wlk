object pepita {
	var energia = 0

	var deposito = 5
	
	method energia(){
		return energia	
	}
	
	method estaCansada() {
		return energia < 50
	}

	method vola(kms) {
		energia -= 10 + kms
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}
	
	method estaFeliz(){
		return energia.between(500,1000)
	}
	
	method cuantoQuiereVolar(){
		var quiereVolar = energia / 5
		
		if(energia.between(300,400))
			quiereVolar+=10
			
		if(energia % 20 == 0)
			quiereVolar+=15
			
		return quiereVolar
	}
	
	method salirAComer(){
		self.vola(deposito)
		self.come(alpiste)
		self.vola(deposito)
	}
	
	method haceLoQueQuieras(){
		
		if(self.estaCansada())
			self.come(alpiste)
		
		if(self.estaFeliz())
			self.vola(8)
		
	}
	
	method visitar(destino){
		energia += destino.energiaRevitalizadora()
	}
	method visitar(noroesteArgentino){
		energia += destino.energiaRevitalizadora(energia)
	}
	
	
}


object alpiste {
	var gramos = 10
	
	method energiaQueOtorga() { 
		return 4 * gramos
	}
	
	method gramos(nuevosGramos) {
		gramos = nuevosGramos
	}	
}

object manzana {
	method energiaQueOtorga() { 
		return 50
	}	
}

object mijo {
	
	var mojado = false
	
	method mojarse(){
		mojado = true
	}
	
	method secarse(){
		mojado = false
	}
	
	method energiaQueOtorga() { 
		if(mojado)
			return 15
		return 20
	}
	
}

object canelones {
	var salsa = false
	var queso = false
	
	method ponerSalsa() {
		salsa = true
	}	
	
	method ponerQueso() {
		salsa = false
	}
	
	method energiaQueOtorga() { 
		var energia = 20
		
		if(queso)
			energia += 7
			
		if(salsa)
			energia += 5
			
		return energia
	}	
}

object roque {
	var pupilo = pepita
	
	method tuPupiloEs(nuevoPupilo){
		pupilo = nuevoPupilo
	} 
	
	method entrenar(){
		pupilo.vola(10)
		pupilo.come(alpiste)
		pupilo.vola(5)
		pupilo.haceLoQueQuieras()
	}
	
	method pupiloActual (){
		return pupilo
	}
}

object pepon {
	var energia = 0

	var deposito = 5
	
	method energia(){
		return energia	
	}

	method vola(kms) {
		energia -= 1 + kms / 2
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga() / 2
	}
	
	method haceLoQueQuieras(){
		self.vola(1)
	}
}

object pipa {
	var kmsRecorridos = 0 
	var cantComidas = 0
	
	method kmsRecorridos(){
		return kmsRecorridos
	} 
	
	method cantComidas(){
		return cantComidas
	}
	
	method vola(kms){
		kmsRecorridos += kms
	}
	
	method come(_){
		cantComidas++
	}
	
	method haceLoQueQuieras(){
		
	}
}

object patagonia {
	method energiaRevitalizadora(){
		return 30
	} 
}

object sierrasCordobesas {
	method energiaRevitalizadora(){
		return 70
	} 
}

object marDelPlata{
	var temporadaAlta = true
	
	method cambiarDeTemporada(){
		temporadaAlta = temporadaAlta.negate()
	}
	
	method energiaRevitalizadora(){
		if(temporadaAlta)
			return 80
		return -20
	} 
}

/* 
 * ¿Quién tiene la responsabilidad de saber si Mar del Plata está en temporada alta o baja? ¿Cómo se cambia de temporada?
 * La responsabilidad seria de quien use la consola, se puede cambiar con el metodo cambiarDeTemporada.
 */
 
 
 object noroesteArgentino {
 	method energiaRevitalizadora(energia){
		return energia*0.1
	} 
 }
 
 object susana {
	var pupilo = pepita
	
	method tuPupiloEs(nuevoPupilo){
		pupilo = nuevoPupilo
	} 
	
	method entrenar(){
		pupilo.come(alpiste)
		pupilo.vola(20)
	}
	
	method pupiloActual (){
		return pupilo
	}
}
