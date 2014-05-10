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
		return Math.pow (Math.pow(x.t0/x.t,2)),1/3

D_z = (t0, z) ->
	return 3 * c * t0 * (1 - (Math.pow 1 + z, -1/2))

value = 
	a_t:undefined,
	t:5,
	t0: 6

redShift(value)