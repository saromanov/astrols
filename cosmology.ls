#Немного формул из космологии

#Реликтовое излучение
#http://www.glesp.nbi.dk/list2.0.html
#http://en.wikipedia.org/wiki/Cosmic_microwave_background

#http://pdg.lbl.gov/2013/reviews/rpp2013-rev-cosmic-microwave-background.pdf

T_0 = 2.726

scale_factor = (redshift)->  1/(1 + redshift)

#spherical harmonic expansion of the CMB sky
CMB_sky = (theta, phi, func) ->
	sum func(theta, phi) * scale_factor(123)