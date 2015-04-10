#! /usr/bin/ruby

	# Todo cambió, a leer errores! 

	# Utilizar el reto de HTTParty, el servicio cambió, ahora tiene dominio: hackapi.jgab.net
	# La data que existía en el servicio desapareció y el servicio sufrió modificaciones.
	# Registren su usuario de nuevo en el api.
	# Único cambio conocido del api: no se usa idenity, se filtra por username y debe ser el de slack.
	# NOTA: lean los errores que da el server.!!!, ahí estarán las respuestas que necesitan.
	# el resultado del reto saldrá por http://hackapi.jgab.net/api/users/hackers, para que puedan realizar
	# el siguiente reto HTTP al menos 8 tienen que haber culminado el reto.

require 'httparty'

class Todos
	include HTTParty
	base_uri 'http://hackapi.jgab.net/api/users/'

	def add(user)
		options = {body: user}
		self.class.post('', options)		
	end

	def edit(username, user)
		options = {body: user}
		self.class.put('/'+username, options)	
	end

	def list
		self.class.get('/'+"hackers")
	end

	def delete(username)
		self.class.delete('/'+username)		
	end
end

record = Todos.new

print record.add({
	"fullname": "Angelica Herrera",
	"username": "@angelicahr",
	"address": "Av andres bello, caracas, EEUU",
	"gender": "female",
	"email": "anggelica.virtlife.jt@gmail.com"
});