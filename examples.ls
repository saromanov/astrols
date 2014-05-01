require! './astro.ls'

c = new CartesianCoordinates(10,4,0)
console.log(c.toPolar())

c = new PolarCoordinates(10, 85)
console.log(c.toCartesian())
#console.log(c.fun(8,5,2))

s = new Standard()
console.log(s.convert(9,14,55.8, Math.tan))

b = new Body(10)
console.log b.mass(10,20)
console.log(b.luminosity2(10000000,5000))

c = new Convert
console.log(sun.mass)