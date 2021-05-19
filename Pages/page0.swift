//#-hidden-code
import PlaygroundSupport
import UIKit
var backGroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

var color: UIColor = #colorLiteral(red: 0.6028195024, green: 0.1405135095, blue: 0.3096810579, alpha: 1.0)

var radius: CGFloat = 10

var xPosition: CGFloat = 500
var yPosition: CGFloat = 1000


var xVelocity: CGFloat = 0
var yVelocity: CGFloat = 0
//#-end-hidden-code
/*:
 In this playground, our objective is to introduce the concept of Object Oriented Programing using some circles.
 We are going to familiarize ourselves with concepts like Objects, Attributes and Functions.
 I hope you like this experience as much as I did programing it.
 
 Let's start!
 First on our list, we have Attributes.
 They are the characteristics of an Object, 
 in our case they basically determine how our Circle (Object) looks.
 
 Now, we will create a Circle, 
 change the attributes of the Circle and then click on "Run My Code" to see how it looks.
 
 1. `color`: change the color of your Circle
 1. `radius`: change the radius
 1. `xPosition`: set were it will appear on the screen, from left to right.
                The left side is 0, and the maximum depends on your screen.
 1. `yPosition`: set were it will appear on the screen.
                The bottom is 0, and the maximum depends on your screen.
 1. `xVelocity`: make it move to the right with a positive velocity,
                and to the left with a negative
 1. `yVelocity`: make it move up with a positive velocity,
                and down with a negative
 
 If the Circle didn't appeared, it probably is out of your screen, try different Positions.
 See the result running it! When you are done experimenting, go to the next page.
 */

color =  /*#-editable-code*/ #colorLiteral(red: 0.0, green: 0.7790542245, blue: 0.9885957837, alpha: 1.0) /*#-end-editable-code*/

radius = /*#-editable-code*/100/*#-end-editable-code*/

xPosition = /*#-editable-code*/500/*#-end-editable-code*/
yPosition = /*#-editable-code*/500/*#-end-editable-code*/

xVelocity = /*#-editable-code*/0/*#-end-editable-code*/
yVelocity = /*#-editable-code*/0/*#-end-editable-code*/

//#-hidden-code
var particle: Particle = Particle(radius: radius, color: color, acceleration: PVector(), velocity: PVector(x: xVelocity, y: yVelocity), position: PVector(x: xPosition, y: yPosition))

var config = ParticleSystemConfig()

config.particles = [particle]
config.worldGravityVector = PVector()
config.dragCoefficient = 0
config.soundActive = false
config.touchActive = false
config.willBounce = false
config.willEat = false
config.colors = [color]
config.minRadius = radius
config.maxRadius = radius + 1
config.minVelocity = xVelocity
config.maxVelocity = xVelocity + 1

let art = ArtViewController(config: config)

art.scene.backgroundColor = backGroundColor
art.scene.circleCount = 0

PlaygroundPage.current.setLiveView(art)
//#-end-hidden-code
