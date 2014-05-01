#http://aplpy.github.io/install.html
#http://pythonhosted.org/Astropysics/

#Playing around livescript 


prelude = require 'prelude-ls'
fs = require 'fs'
pow = (s, t) -> Math.pow s, t

#speed of light on m/s
c = 299792458
#Wien's Constant
b = 4.87695145663
#Solar Luminosity
L_S = 3.83e26
#Stefan-Bolzmann constant
SB = 7.41347345191

T_0 = 13.8 * Math.pow(10,9)

masses = 
	solar: 1.9891 * pow 10,30
	electron: 9.10938291 * pow 10,-31
	NGC: 6.67384 * pow 10,-31
	slight: 299792458


#Some of sun constants
sun = 
	luminosity: 3.83e26
	mass: masses.solar
	radius: 6.95508e8 #in meters
	t: 5778 #Temperaturein K


#http://pythonhosted.org/Astropysics/coremods/coords.html
class CartesianCoordinates
	(x,y,z) ->
		@x = x
		@y = y
		@z = z

	op: (value, item ) ->
		e = 10

	add: (obj) ->
		if obj instanceof CartesianCoordinates
			@x = @x + obj.x
			@y = @y + obj.y
			@z = @z + obj.z
	sub: (obj) ->

		if obj instanceof CartesianCoordinates
			@x = @x - obj.x
			@y = @y - obj.y
			@z = @z - obj.z

	toPolar: -> coord = 
					r:((pow @x,2) + (pow @y, 2) + (pow @z, 2)) |> Math.sqrt
					angle: Math.atan (@y/@x)

	2d_circle: (x,y) -> pow x,2 + pow y,2


class PolarCoordinates
	(radius, angle) ->
		@radius = radius
		@angle =  angle * (Math.PI/180)

	toCartesian: -> coord = 
						x: @radius * Math.cos @angle
						y: @radius * Math.sin @angle


#Координаты с часами
#Часы, минуты, секунды
class Standard
	@anglehour = 15

	#f - Может принимать Косинус, Синус, Тангенс и Катангенс
	#1 час - это 15 градусов
	convert: (h,m,s,f) ->
		anglehour = 15
		result = (x, func, rad) -> rad(x,func);
		if h > 0
			return result((h + m/60 + s/3600) * anglehour,f, this.get_radians)
		else
			m = -abs(m)
			s = -abs(s)
			return result((h + m/60 + s/3600) * anglehour,f, this.get_radians)

	get_radians: (hourse, f) ->
		return f(hourse * (Math.PI/180))


class Convert
	#Arcseconds to parseconds
	arcsecToparsec:(arcsec)->
		return 1/arcsec
	#kilometers to astronomical unit
	kmToAU: (km) ->
		return km / 1.495978707e8
	#Kilometers to lightyear
	kmTolightyear: (km) ->
		return km/9.460536207e12

#http://www.usm.uni-muenchen.de/people/puls/lessons/numpraktnew/montecarlo/mc_manual.pdf
class Differential
	(x,y,z) ->
		@x = x
		@y = y
		@z = z

	#Runge-Kutta method
	RK:(k) ->
		result = 0
		for name in [start to finish] by step
			result += (system - step)/ length (k)

#Test create the planet body
class Body
	(v) ->
		@v = v

	#Temperature of body
	calc: (T) ->
		2 * h * Math.pow(3)

	#Calc body mass
	mass:(radius, dims) ->
		return 4 * Math.PI * (pow(radius, 3)/3) * dims

	#Radial velocity
	rad_velocity : (lambda0, lambda) ->
		return c * (lambda/lambda0 - 1)

	#Tangential velocity
	#https://d396qusza40orc.cloudfront.net/introastro/lecture_slides%2FW6%2FW6%20Clip%208.pdf
	#mu - arcseconds
	#D - parseconds
	tang_velocity : (mu, D) ->
		return 4.74 * mu * D

	#Luminosity of body
	#4 * pi * distance^2 * Wien's Constant
	luminosity: (D) ->
		return 4 * Math.PI * Math.pow(D,2) * b

	luminosity2: (R, T) ->
		return sun.luminosity/ Math.pow(R/sun.radius,2) * Math.pow(T/sun.t,4)

	radius: (L, T) ->
		return Math.sqrt(L/(4 * Math.PI * Math.pow(T,4) * SB))

	#гравитационный радиус Шварцшильда
	schwarzschild_radius:(M) ->
		return 2 * G * M/(Math.pow(c,2))
	brightness:(L, D) ->
		return L/(4 * Math.PI * Math.pow(D, 2))

	#Conservation of Angular Momentum
	cons_angular:(M,R,P) ->
		return (4 * Math.PI/5) * (M * Math.pow(R,2))/P


#Функция скорости звёздообразования(Солпитер) (пс^3/год)
#0.4 <= M/M_sun <= 10
speed_of_star_creation: (M) -> 2 * Math.pow(10,-12) * Math.pow(M/sun.mass, -2.35)

integration_mass_star_create: (M) -> 0.9 * Math.pow(M/sun.mass, -1.35)

class IO
	read:(path) ->
		return fs.readFile(path)


module.exports = {

}



