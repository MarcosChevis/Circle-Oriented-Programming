import SpriteKit

public struct PVector: Equatable{
    public var x: CGFloat
    public var y: CGFloat
    
    public init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    public init(point: CGPoint) {
        self.x = point.x
        self.y = point.y
    }
    public init() {
        self.x = 0
        self.y = 0
    }
    
    public func get() -> PVector {
        return PVector(x: self.x, y: self.y)
    }
    
    
    public func magnitude() -> CGFloat {
        if x == CGFloat.zero && y == CGFloat.zero {
            return CGFloat.zero
        }
        return sqrt((pow(x, 2) + pow(y, 2)))
    }
    
    public mutating func normalize() {
        var magnitude = self.magnitude()
        guard magnitude > 0 else {return}
        self.x = self.x / magnitude
        self.y = self.y / magnitude
    }
    
    
    //Classical operation with vectors
    public static func * (rhs: CGFloat, lhs: PVector) -> PVector {
        return PVector(x: (rhs * lhs.x), y: (rhs * lhs.y))
    }
    public static func * (rhs: PVector, lhs: PVector) -> PVector {
        return PVector(x: (rhs.x * lhs.x), y: (rhs.y * lhs.y))
    }
    public static func - (rhs: PVector, lhs: PVector) -> PVector {
        return PVector(x: (rhs.x - lhs.x), y: (rhs.y - lhs.y))
    }
    public static func + (rhs: PVector, lhs: PVector) -> PVector {
        return PVector(x: (rhs.x + lhs.x), y: (rhs.y + lhs.y))
    }
}

public extension PVector {
    static func random(byMagnitude magnitude: CGFloat) -> PVector {
        var angle: CGFloat = .random(in: 0..<360)
        
        var vy: CGFloat = magnitude * sin((angle * CGFloat.pi / 180))
        var vx: CGFloat = magnitude * cos((angle * CGFloat.pi / 180))
        
        return PVector(x: vx, y: vy)
    }
}
