(defrule regla-43-b
		(not
			(or
				(perdida de potencia)
				(fallo de arranque en frio)
			)
		)
=>
		(printout t "Sintoma no contemplado por el sistema" crlf)
		(halt)
)

(defrule regla-43
		(not
			(or
				(test (eq ?*codigo* P0400))
				(test (eq ?*codigo* P0401))
				(test (eq ?*codigo* P0235))
				(test (eq ?*codigo* P0190))
			)
		)
=>
		(printout t "Codigo de averia no contemplado por el sistema" crlf)
		(halt)
)

(defrule regla-42
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0401))
		(instalacion_electrica correcta)
=>
		(printout t "Sustituya la valvula E.G.R." crlf)
		(halt)
)

(defrule regla-41
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0401))
		(instalacion_electrica deficiente)
=>
		(printout t "Sustituya el componente deficiente" crlf)
		(halt)
)

(defrule regla-40
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0401))
		(egr electrica)
=>
		(printout t "Compruebe la instalacion electrica de la valvula.¿Hay algun componente estropeado?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (instalacion_electrica deficiente))
			else
				(assert (instalacion_electrica correcta))
		)
)

(defrule regla-39
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0401))
		(depresion_tubos_de_vacio correcta)
=>
		(printout t "Sustituya la valvula E.G.R." crlf)
		(halt)
)

(defrule regla-38
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0401))
		(depresion_tubos_de_vacio deficiente)
=>
		(printout t "Sustituya el tubo de vacio deficiente" crlf)
		(halt)
)

(defrule regla-37
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0401))
		(egr mecanica)
=>
		(printout t "Compruebe la depresion en los tubos de vacio.¿Es mayor que la que deberia?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (depresion_tubos_de_vacio deficiente))
			else
				(assert (depresion_tubos_de_vacio correcta))
		)
)

(defrule regla-36
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0401))
=>
		(printout t "Introduzca el tipo de valvula E.G.R. que tiene el auto(mecanica-electrica): ")
		(bind ?input (readline))
		(if (eq ?input "mecanica")
			then
				(assert (egr mecanica))
			else
				(if (eq ?input "electrica")
					then
						(assert (egr electrica))
					else
						(printout t "No existe esa clase de valvula E.G.R." crlf)
						(halt)
				)
		)
)

(defrule regla-35
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0190))
		(sensor_de_presion correcta)
=>
		(printout t "El sistema no es capaz de deducir un fallo en el sistema common-rail" crlf)
		(halt)
)

(defrule regla-34
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0190))
		(sensor_de_presion defectuosa)
=>
		(printout t "Sustituya el sensor de presion" crlf)
		(halt)
)

(defrule regla-33
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0190))
		(bomba_alta correcta)
=>
		(printout t "Compruebe el sensor de presion.¿Funciona correctamente?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (sensor_de_presion correcta))
			else
				(assert (sensor_de_presion defectuosa))
		)
)

(defrule regla-32
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0190))
		(bomba_alta defectuosa)
=>
		(printout t "Sustituya la bomba de alta" crlf)
		(halt)
)

(defrule regla-31
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0190))
		(fuga_rampa no encontrada)
=>
		(printout t "Compruebe la bomba de alta.¿Funciona correctamente?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (bomba_alta correcta))
			else
				(assert (bomba_alta defectuosa))
		)
)

(defrule regla-30
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0190))
		(fuga_rampa encontrada)
=>
		(printout t "Repare la fuga" crlf)
		(halt)
)

(defrule regla-29
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0190))
=>
		(printout t "Intente encontrar alguna fuga en la rampa de inyeccion del sistema common-rail.¿Hay alguna?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (fuga_rampa encontrada))
			else
				(assert (fuga_rampa no encontrada))
		)
)

(defrule regla-27
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0235))
		(corona_sifonica correcta)
=>
		(printout t "Sustituya el sensor de revoluciones" crlf)
		(halt)
)

(defrule regla-27
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0235))
		(corona_sifonica deficiente)
=>
		(printout t "Sustituya la corona sifonica" crlf)
		(halt)
)

(defrule regla-26
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0235))
		(instalacion_electrica correcta)
=>
		(printout t "Compruebe la integridad de la corona sifonica.¿Esta en buen estado?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (corona_sifonica correcta))
			else
				(assert (corona_sifonica deficiente))
		)
)

(defrule regla-25
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0235))
		(instalacion_electrica deficiente)
=>
		(printout t "Sustituya el componente deficiente" crlf)
		(halt)
)

(defrule regla-24
		(fallo de arranque en frio)
		(test (eq ?*codigo* P0235))
=>
		(printout t "Compruebe la instalacion electrica del sensor de revoluciones.¿Hay algun componente estropeado?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (instalacion_electrica deficiente))
			else
				(assert (instalacion_electrica correcta))
		)
)

(defrule regla-23
		(perdida de potencia)
		(test (eq ?*codigo* P0401))
		(instalacion_electrica correcta)
=>
		(printout t "Sustituya la valvula E.G.R." crlf)
		(halt)
)

(defrule regla-22
		(perdida de potencia)
		(test (eq ?*codigo* P0401))
		(instalacion_electrica deficiente)
=>
		(printout t "Sustituya el componente deficiente" crlf)
		(halt)
)

(defrule regla-21
		(perdida de potencia)
		(test (eq ?*codigo* P0401))
		(egr electrica)
=>
		(printout t "Compruebe la instalacion electrica de la valvula.¿Hay algun componente estropeado?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (instalacion_electrica deficiente))
			else
				(assert (instalacion_electrica correcta))
		)
)

(defrule regla-20
		(perdida de potencia)
		(test (eq ?*codigo* P0401))
		(depresion_tubos_de_vacio correcta)
=>
		(printout t "Sustituya la valvula E.G.R." crlf)
		(halt)
)

(defrule regla-19
		(perdida de potencia)
		(test (eq ?*codigo* P0401))
		(depresion_tubos_de_vacio deficiente)
=>
		(printout t "Sustituya el tubo de vacio deficiente" crlf)
		(halt)
)

(defrule regla-18
		(perdida de potencia)
		(test (eq ?*codigo* P0401))
		(egr mecanica)
=>
		(printout t "Compruebe la depresion en los tubos de vacio.¿Es mayor que la que deberia?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (depresion_tubos_de_vacio deficiente))
			else
				(assert (depresion_tubos_de_vacio correcta))
		)
)

(defrule regla-17
		(perdida de potencia)
		(test (eq ?*codigo* P0401))
=>
		(printout t "Introduzca el tipo de valvula E.G.R. que tiene el auto(mecanica-electrica): ")
		(bind ?input (readline))
		(if (eq ?input "mecanica")
			then
				(assert (egr mecanica))
			else
				(if (eq ?input "electrica")
					then
						(assert (egr electrica))
					else
						(printout t "No existe esa clase de valvula E.G.R." crlf)
						(halt)
				)
		)
)

(defrule regla-13
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(electrovalvula correcta)
=>
		(printout t "Sustituya el turbo" crlf)
		(halt)
)

(defrule regla-13
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(electrovalvula defectuosa)
=>
		(printout t "Sustituya la electrovalvula" crlf)
		(halt)
)

(defrule regla-14
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(movimiento_alabes correcto)
=>
		(printout t "Compruebe el funcionamiento de la electrovalvula.¿Es el que deberia?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (electrovalvula correcta))
			else
				(assert (electrovalvula defectuosa))
		)
)

(defrule regla-13
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(movimiento_alabes incorrecto)
=>
		(printout t "Sustituya el sistema de alabes" crlf)
		(halt)
)

(defrule regla-12
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(depresion_tubos_de_vacio correcta)
		(geometria fija)
=>
		(printout t "Compruebe el funcionamiento de la electrovalvula.¿Es el que deberia?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (electrovalvula correcta))
			else
				(assert (electrovalvula defectuosa))
		)
)

(defrule regla-11
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(depresion_tubos_de_vacio correcta)
		(geometria variable)
=>
		(printout t "Compruebe el movimiento del sistema de alabes.¿Es el que deberia?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (movimiento_alabes correcto))
			else
				(assert (movimiento_alabes incorrecto))
		)
)

(defrule regla-10
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(depresion_tubos_de_vacio deficiente)
=>
		(printout t "Sustituya el tubo de vacio deficiente" crlf)
		(halt)
)
		

(defrule regla-9
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(presion_sistema_sobrealimentacion correcta)
=>
		(printout t "Compruebe la depresion en los tubos de vacio.¿Es mayor que la que deberia?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (depresion_tubos_de_vacio deficiente))
			else
				(assert (depresion_tubos_de_vacio correcta))
		)
)
		

(defrule regla-8
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(presion_sistema_sobrealimentacion deficiente)
=>
		(printout t "Encuentre la fuga en el sistema de sobrealimentacion y reparela" crlf)
		(halt)
)
		

(defrule regla-7
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(manguitos correctos)
=>
		(printout t "Compruebe la presion en el sistema de sobrealimentacion mediante una prueba de estanquedad.¿Es menor que la que deberia?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (presion_sistema_sobrealimentacion deficiente))
			else
				(assert (presion_sistema_sobrealimentacion correcta))
		)
)
		

(defrule regla-6
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(manguito deficiente)
=>
		(printout t "Cambie el manguito deficiente" crlf)
		(halt)
)

(defrule regla-5
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
=>
		(printout t "Compruebe la integridad de los manguitos del Sistema de Sobrealimentacion.¿Hay alguno en mal estado?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (manguito deficiente))
			else
				(assert (manguitos correctos))
		)
)
	
(defrule regla-4
		(perdida de potencia)
		(test (eq ?*codigo* P0400))
		(eje deficiente)
=>
		(printout t "Debe cambiar el turbo" crlf)
		(halt)
)	

(defrule regla-3
		(perdida de potencia)
		(humo blanco)
		(test (eq ?*codigo* P0400))
=>
		(printout t "Compruebe la holgura del eje del turbo.¿Es dicha holgura demasiada?(Si, No): ")
		(bind ?input (readline))
		(if (eq ?input "Si")
			then
				(assert (eje deficiente))
		)
)

		
(defrule regla-2
		(test (eq ?*codigo* P0400))
=>
		(printout t "Introduzca el tipo de geometria que tiene el turbo del coche(fija-variable): ")
		(bind ?input (readline))
		(if (eq ?input "fija")
			then
				(assert (geometria fija))
			else
				(if (eq ?input "variable")
					then
						(assert (geometria variable))
					else
						(printout t "No existe esa clase de turbo" crlf)
						(halt)
				)
		)
)



