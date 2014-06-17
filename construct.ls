
pow = (s, t) -> Math.pow s, t

c = 299792458ms
G = (6.67384 * pow 10,-11)

#Construct basic galaxy
#http://www.astro.cornell.edu/academics/courses/astro201/galaxies/types.htm
class Galaxy
	(t, numstars) ->
		@t = t
		@numstars = numstars

	addPlanets:(typep, num) ->
		@num = num


#M32, N105
class Elliptical
	(like) ->
		@like = like
		@coordx = 100
		@coordy = 100
		@coordz = 100

	construct: ->
		obj = []


#http://en.wikipedia.org/wiki/Dwarf_galaxy
#Dwarf galaxy
class Dwarf
	#Wavelength and rest wavelength
	(wavelength, restwl) ->
		@numstars = 2e9
		#in ly
		@Radius = Math.random()*(40 - 20)+20
		#Hubble law
		@Velocity = ((wavelength - restwl)/wavelength) * c
		@Mass = (@Radius * pow @Velocity,2)/G

	getData:(x,y,z) ->
		for i from 1 to x by 1
			for j from 1 to y by 1
				for z from 1 to z by 1
					star = Star((Math.random()/1000) + 0.001)
	
	getInfo:->
		'radius': @Radius
		'mass': @Mass



class Star
	(R)->
		@R = R


