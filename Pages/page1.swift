//#-hidden-code
import PlaygroundSupport
import UIKit

var backGroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

var config = ParticleSystemConfig()
config.soundActive = false
config.touchActive = false
config.willBounce = false
config.willEat = false
//#-end-hidden-code
/*:
In addition to Attributes, Objects have ways it behaves or interacts with other things.
In the spirit of experimentation, let's use some Functions, and change our little circle that already has some Attributes preset

 1. `makeItBounce()`: the Circles will bounce on the walls
 1. `makeItConsume()`: the Circles will eat the smaller ones, mixing their Attributes
 1. `activateSound()`: when consuming another circle they will make a sound
 1. `createCircleWithTouch()`: create a Circle where you touch
 */

//#-code-completion(identifier, show, makeItBounce(), makeItConsume(), createCircleWithTouch(), activateSound())
/*#-editable-code*/makeItBounce()/*#-end-editable-code*/
/*#-editable-code*/makeItConsume()/*#-end-editable-code*/
/*#-editable-code*/activateSound()/*#-end-editable-code*/
/*#-editable-code*/createCircleWithTouch()/*#-end-editable-code*/
//#-hidden-code
var particles: [Particle] = []
particles.append(Particle(radius: 20, color: #colorLiteral(red: 0.0, green: 0.5494213104, blue: 0.7068910003, alpha: 1.0), acceleration: PVector(), velocity: PVector(x: 4, y: -3), position: PVector(x: 500, y: 500)))
particles.append(Particle(radius: 50, color: #colorLiteral(red: 1.0, green: 0.4171271324, blue: 0.0002565760224, alpha: 1.0), acceleration: PVector(), velocity: PVector(x: 3, y: -5), position: PVector(x: 350, y: 100)))
particles.append(Particle(radius: 100, color: #colorLiteral(red: 0.4653213024, green: 0.7332682014, blue: 0.2536376119, alpha: 1.0), acceleration: PVector(), velocity: PVector(x: -4, y: 10), position: PVector(x: 40, y: 100)))



func activateSound() {
    config.soundActive = true
}
func createCircleWithTouch() {
    config.touchActive = true
}
func makeItBounce() {
    config.willBounce = true
}

func makeItConsume() {
    config.willEat = true
}



config.particles = particles
config.worldGravityVector = PVector()
config.dragCoefficient = 0
config.colors = [#colorLiteral(red: 0.0, green: 0.6385222077, blue: 0.8448928595, alpha: 1.0), #colorLiteral(red: 1.0, green: 0.4171271324, blue: 0.0002565760224, alpha: 1.0), #colorLiteral(red: 0.4653213024, green: 0.7332682014, blue: 0.2536376119, alpha: 1.0)]
config.minRadius = 20
config.maxRadius = 100
config.minVelocity = 0
config.maxVelocity = 10

let art = ArtViewController(config: config)

art.scene.backgroundColor = backGroundColor
art.scene.circleCount = 0

PlaygroundPage.current.setLiveView(art)
//#-end-hidden-code
