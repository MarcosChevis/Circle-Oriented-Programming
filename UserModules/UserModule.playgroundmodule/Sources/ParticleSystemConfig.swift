import SpriteKit

public struct ParticleSystemConfig {
    
    public var particles: [Particle]
    
    //Behaviour vars
    public var worldGravityVector: PVector
    public var dragCoefficient: CGFloat
    public var soundActive: Bool
    public var touchActive: Bool
    public var willBounce: Bool
    public var willEat: Bool
    
    //Circle Attributes vars
    public var colors: [UIColor]
    
    public var minRadius: CGFloat
    public var maxRadius: CGFloat
    
    public var minVelocity: CGFloat
    public var maxVelocity: CGFloat
    
    public init() {
        particles = []
        
        worldGravityVector = PVector()
        dragCoefficient = 0
        soundActive = false
        touchActive = false
        willBounce = false
        willEat = false
        
        colors = [#colorLiteral(red: 0.0, green: 0.6385222077, blue: 0.8448928595, alpha: 1.0)]
        
        minRadius = 5
        maxRadius = 10
        
        minVelocity = 0
        maxVelocity = 10
    }
}
