//#-hidden-code
import PlaygroundSupport
import UIKit

var backGroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
var colors: [UIColor] = [#colorLiteral(red: 0.0, green: 0.6385222077, blue: 0.8448928595, alpha: 1.0), #colorLiteral(red: 0.9023433924, green: 0.2320581675, blue: 0.4786583185, alpha: 1.0), #colorLiteral(red: 0.3997545242, green: 0.6133489013, blue: 0.2060141265, alpha: 1.0)]
var circleCount: Int = 10

var minRadius: CGFloat = 30
var maxRadius: CGFloat = 50

var minVelocity: CGFloat = 0
var maxVelocity: CGFloat = 0

var gravity: CGFloat = 5
var sidewaysGravity: CGFloat = 0

var dragCoefficient: CGFloat = 0.1

var config = ParticleSystemConfig()

config.soundActive = false
config.touchActive = false
config.willBounce = false
config.willEat = false
//#-end-hidden-code
/*:
Now it's time to make something a bit more complex, we will be using both attributes and Functions.
Explore all the options we have here, Change it, Test it, Break It. HAVE FUN while learning.
If something happens and you didn't expect it, DON'T PANIC. Try and figure out what happened.
Maybe the Circle is gigantic, too fast, or it is out of the screen, having unexpected results is part of learning.

On this page we will create various Circles randomly on the screen, so some of the Attributes previously used are a little bit defferent.

 1. `colors`: it is a colection of colors, you can choose as many as you want, but need at least one
 1. `circleCount`: choose how many circles will appear
 1. `minRadius/maxRadius`: the circles will choose a random radius between these values
 1. `minVelocity/maxVelocity`: the circles will choose a random velocity and go in a random direction.
 1. `gravity/sidewaysGravity`: gravity will accelerate the circle in whichever direction and intensity you choose
 2. `dragCoefficient`: the circle will deaccelerate more the higher this number is. The bigger the circle, less it will be affected by this. The faster it goes, the greater will be the deacceleration.
 */

backGroundColor = /*#-editable-code*/ #colorLiteral(red: 0.9999018311500549, green: 1.0000687837600708, blue: 0.9998798966407776, alpha: 1.0) /*#-end-editable-code*/
colors = /*#-editable-code*/[#colorLiteral(red: 1.0, green: 0.2527073622, blue: 0.07590860873, alpha: 1.0), #colorLiteral(red: 0.4653213024, green: 0.7332682014, blue: 0.2536376119, alpha: 1.0), #colorLiteral(red: 0.0, green: 0.6385222077, blue: 0.8448928595, alpha: 1.0)]/*#-end-editable-code*/

circleCount = /*#-editable-code*/20/*#-end-editable-code*/

minRadius = /*#-editable-code*/10/*#-end-editable-code*/
maxRadius = /*#-editable-code*/20/*#-end-editable-code*/

minVelocity = /*#-editable-code*/0/*#-end-editable-code*/
maxVelocity = /*#-editable-code*/0/*#-end-editable-code*/

gravity = /*#-editable-code*/1/*#-end-editable-code*/
sidewaysGravity = /*#-editable-code*/0/*#-end-editable-code*/

dragCoefficient = /*#-editable-code*/0/*#-end-editable-code*/


/*#-editable-code*/makeItBounce()/*#-end-editable-code*/

/*#-editable-code*/createCircleWithTouch()/*#-end-editable-code*/

/*#-editable-code*/makeItConsume()/*#-end-editable-code*/

/*#-editable-code*/activateSound()/*#-end-editable-code*/

//#-hidden-code
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

var particles: [Particle] = []

config.particles = particles
config.worldGravityVector = PVector(x: sidewaysGravity, y: gravity)
config.dragCoefficient = dragCoefficient
config.colors = colors
config.minRadius = minRadius
config.maxRadius = maxRadius
config.minVelocity = minVelocity
config.maxVelocity = maxVelocity


let art = ArtViewController(config: config)
art.scene.backgroundColor = backGroundColor
art.scene.circleCount = circleCount
PlaygroundPage.current.setLiveView(art)
//#-end-hidden-code
