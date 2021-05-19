import SpriteKit
import AVFoundation

public class ParticleSystem: SKNode {
    //system vars
    public var particles: [Particle]
    
    var bops: [AVAudioPlayer?] = []
    var soundPaths: [String] = ["First Bop", "Second Bop", "Third Bop", "Fourth Bop"]
    
    //Behaviour vars
    var worldGravityVector: PVector
    var dragCoefficient: CGFloat
    var soundActive: Bool
    var touchActive: Bool
    var willBounce: Bool
    var willEat: Bool
    
    //Circle Attributes vars
    var colors: [UIColor]
    
    var minRadius: CGFloat
    var maxRadius: CGFloat
    
    var minVelocity: CGFloat
    var maxVelocity: CGFloat
    
    
    //Initializers
    public override init() {
        particles = []
        
        worldGravityVector = PVector(x: 0, y: 0)
        dragCoefficient = 0
        soundActive = false
        touchActive = false
        willBounce = false
        willEat = false
        
        colors = [#colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)]
        
        minRadius = 5
        maxRadius = 10
        
        minVelocity = 0
        maxVelocity = 0
        
        super.init()
        soundPaths.forEach {
            self.bops.append(try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: $0, withExtension: "wav")!))
        }
    }
    
    public init(particles: [Particle], worldGravityVector: PVector, dragCoefficient: CGFloat, soundActive: Bool, touchActive: Bool, colors: [UIColor], minRadius: CGFloat, maxRadius: CGFloat, minVelocity: CGFloat, maxVelocity: CGFloat, willBounce: Bool, willEat: Bool) {
        
        self.particles = particles
        self.worldGravityVector = -1 * worldGravityVector
        self.dragCoefficient = dragCoefficient
        self.soundActive = soundActive
        self.touchActive = touchActive
        self.willBounce = willBounce
        self.willEat = willEat
        
        self.colors = colors
        
        self.minRadius = minRadius
        self.maxRadius = maxRadius
        
        self.minVelocity = minVelocity
        self.maxVelocity = maxVelocity
        
        
        super.init()
        soundPaths.forEach {
            self.bops.append(try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: $0, withExtension: "wav")!))
        }
    }
    
    public init(config: ParticleSystemConfig) {
        
        self.particles = config.particles
        self.worldGravityVector = -1 * config.worldGravityVector
        self.dragCoefficient = config.dragCoefficient
        self.soundActive = config.soundActive
        self.touchActive = config.touchActive
        self.willBounce = config.willBounce
        self.willEat = config.willEat
        
        self.colors = config.colors
        
        self.minRadius = config.minRadius
        self.maxRadius = config.maxRadius
        
        self.minVelocity = config.minVelocity
        self.maxVelocity = config.maxVelocity
        
        
        super.init()
        soundPaths.forEach {
            self.bops.append(try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: $0, withExtension: "wav")!))
        }
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Structural of ParticleSystem
    public func addParticle(particle: Particle) {
        particles.append(particle)
        }
    
    public func createParticleInSystem(radius: CGFloat, color: UIColor, acceleration: PVector, velocity: PVector, position: PVector) {
        var p = Particle(radius: radius, color: color, acceleration: acceleration, velocity: velocity, position: position)
        particles.append(p)
        guard let parent = parent else {return}
        parent.addChild(p.shape)
    }
    
    public func addAllChildren(){
        for particle in particles {
            guard let parent = parent else {return}
            parent.addChild(particle.shape)
        }
    }
    
    //behavior of ParticleSystem
    public func updateSystem() {
        for particle in particles {
            if willEat {
                verifyEat(particle)
            }
            if willBounce {
                borderBounce(particle)
            }
            
            var forceVector: PVector = PVector()
            forceVector = forceVector + worldGravity(particle)
            forceVector = forceVector + worldDrag(particle)
            particle.applyForce(force: forceVector)
            particle.accelerate()
            particle.move()
        }
        if willEat {
            particles = particles.filter {
                $0.eaten != true
            }
        }
    }
    
    public func worldGravity(_ particle: Particle) -> PVector {
        guard let parent = parent else{return PVector()}
        var apply = PVector()
        if  particle.position.x >= particle.radius && particle.position.x <= (parent.frame.size.width - particle.radius) {
            apply.x = worldGravityVector.x
        }
        if particle.position.y >= particle.radius && particle.position.y <= (parent.frame.size.height - particle.radius) {
            apply.y = worldGravityVector.y
        }
        return particle.mass*apply
    }
    
    public func worldDrag(_ particle: Particle) -> PVector {
        
        var speed: CGFloat = particle.velocity.magnitude()
        var magnitude: CGFloat = dragCoefficient * speed * speed
        var drag: PVector = -1 * particle.velocity
        drag.normalize()
        drag = magnitude * drag
        
        return drag
    }
    
    public func borderBounce(_ particle: Particle) {
        guard let parent = parent else{return}
        
        if particle.position.x >= parent.frame.size.width - particle.radius {
            particle.velocity.x = -1 * abs(particle.velocity.x)
        } else if particle.position.x <= particle.radius {
            particle.velocity.x = abs(particle.velocity.x)
        }
            
        if particle.position.y >= parent.frame.size.height - particle.radius {
            particle.velocity.y = -1 * abs(particle.velocity.y)
        } else if particle.position.y <= particle.radius {
            particle.velocity.y = abs(particle.velocity.y)
        }
    }
    
    func verifyEat(_ particleA: Particle) {
        
        for particleB in particles where particleA != particleB && !particleB.eaten {
            
            var distance: CGFloat = (particleA.position - particleB.position).magnitude()
            
            if distance < particleA.radius && particleA.radius >= particleB.radius {
                if soundActive {
                    tocarSom()
                }
                createSon(particleA: particleA, particleB: particleB)
            } else if distance < particleA.radius && particleB.radius > particleA.radius {
                if soundActive {
                    tocarSom()
                }
                createSon(particleA: particleB, particleB: particleA)
            }
        }
    }
    
    func createSon(particleA: Particle, particleB: Particle) {
        let fatherColor = particleA.color.cgColor.components!
        let motherColor = particleB.color.cgColor.components!
    
        let red = (fatherColor[0] + motherColor[0]) / 2
        let green = (fatherColor[1] + motherColor[1]) / 2
        let blue = (fatherColor[2] + motherColor[2]) / 2
    
        let childColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    
        var childParticle = Particle(radius:  (particleA.radius) + (particleB.radius/2),
                                     color: childColor,
                                     acceleration: PVector(),
                                     velocity: (1/(particleA.radius + particleB.radius)) * (particleA.radius * particleA.velocity + particleB.radius * particleB.velocity),
                                     position:  particleA.position)
        
        particleA.eaten = true
        particleB.eaten = true
    
        particles.append(childParticle)
        parent!.removeChildren(in: [particleA.shape, particleB.shape])
        parent!.addChild(childParticle.shape)
    }
    
    public func createRandomParticle(at position: CGPoint) {
        createParticleInSystem(radius: .random(in: minRadius...maxRadius),
                               color: colors[Int.random(in: 0..<colors.count)],
                               acceleration: PVector(),
                               velocity: .random(byMagnitude: .random(in: minVelocity...maxVelocity)),
                               position: PVector(point: position))
        
    }
    
    @objc
    func tocarSom() {
        guard let bop = bops[Int.random(in: 0..<soundPaths.count)] else {return}
        bop.play()
    }
    
}
