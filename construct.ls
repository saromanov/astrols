
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
class Dwarf
	() ->
		@numstars = 2e9

	getData(x,y,z) ->
		for i from 1 to @x by 1
			for j from 1 to @y by 1
				for z from 1 to @z by 1
					star = Star(Math.random()/1000) + 0.001)



class Star
	(R)->
		@R = R

