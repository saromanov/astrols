#Немного формул из космологии

#Реликтовое излучение
#http://www.glesp.nbi.dk/list2.0.html
#http://en.wikipedia.org/wiki/Cosmic_microwave_background

#http://pdg.lbl.gov/2013/reviews/rpp2013-rev-cosmic-microwave-background.pdf

T_0 = 2.726
G = 6.67
H_0_s = 2.26 * Math.pow 10,-18
H_0 = 71
H_0_gyr = 14Gyr
c = 299792458m_s

scale_factor = (redshift)->  1/(1 + redshift)

#spherical harmonic expansion of the CMB sky
CMB_sky = (theta, phi, func) ->
	sum func(theta, phi) * scale_factor(123)

p_c = (H) ->
	return (3 * Math.pow H, 2)/(8 * Math.PI * G)

dopplerShift = (lambda0, v) ->
	lambda0 * (1 - v/c)

#Compute z(t)
redShift = (x) ->
	if x.a_t != undefined
		return (1/x.a_t) - 1
	else if x.t != undefined && x.t0 != undefined
		return Math.pow x.t0/x.t,2/3

D_z = (t0, z) ->
	return 3 * c * t0 * (1 - (Math.pow 1 + z, -1/2))

#The distance/redshift relation for a dust-dominated universe
#D - is coordinate now
#t0 - time at t0
#a - scale factor
D = (t0, a) ->
	return 3 * c * t0 * (1 - Math.pow a, 1/2)


#Angular distance 
#For example
#R = 5 * (Math.pow 10,4) * 3.26
#D_0 = 1.7 * Math.pow 10,10
#z = 5.34
r_ad = (R, z, D_0) ->
	return (R * (1 + z)/D_0) * 206625


#Scale factor for Dust-dominated flat universe
a_t_dd  = (t) ->
	return Math.pow (3 * H_0 * t/2),2/3

S = (P,R,k, omega) ->
	return (P/(4 * Math.PI * (Math.pow R,2) * Math.sin(Math.sqrt(k) * omega))/Math.sqrt(k))

#Time scale
ts = (t0, t1) -> 
	return 1 - t1/t0
value = 
	a_t:undefined,
	t:5,
	t0: 6

redShift(value)
console.log a_t_dd(5)
