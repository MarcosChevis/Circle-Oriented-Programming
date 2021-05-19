import SpriteKit

public class Particle: Equatable {
    var position: PVector {
        set {
            shape.position.x = newValue.x
            shape.position.y = newValue.y
        }
        get {
            return PVector(x: shape.position.x, y: shape.position.y)
        }
    }
    var acceleration: PVector
    var velocity: PVector
    
    var mass: CGFloat
    var radius: CGFloat
    var color: UIColor
    var eaten: Bool
    
    public lazy var shape: SKNode = getShape()
    
    
    init() {
        radius = 2
        mass = CGFloat.pi * radius*radius
        color = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        eaten = false
        
        acceleration = PVector(x: 0, y: 0)
        velocity = PVector(x: 0, y: 0)
        position = PVector(x: 0, y: 0)
    }
    
    public init(radius: CGFloat, color: UIColor, acceleration: PVector, velocity: PVector, position: PVector) {
        
        self.radius = radius
        self.mass = CGFloat.pi * radius*radius
        self.color = color
        self.eaten = false
        
        self.acceleration = acceleration
        self.velocity = velocity
        self.position = position
    }
    
    func applyForce(force: PVector) {
        if force != PVector() {
            acceleration = (1/mass) * force}
        }
    func accelerate() {
        velocity = velocity + acceleration
    }
    func move() {
        position = position + velocity
    }
    
    private func getShape() -> SKShapeNode {
        var node: SKShapeNode = SKShapeNode(circleOfRadius: self.radius)
        node.lineWidth = 0
        node.fillColor = self.color
        node.blendMode = .alpha
        return node
    }
    
    public static func == (rhs: Particle, lhs: Particle) -> Bool {
        return (rhs.position == lhs.position) && (rhs.position == lhs.position)
    }
}
