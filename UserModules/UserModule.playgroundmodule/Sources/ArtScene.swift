import UIKit
import SpriteKit
import AVFoundation

public class ArtScene: SKScene {
    
    public var config: ParticleSystemConfig = ParticleSystemConfig()
    public var particleSystem: ParticleSystem = ParticleSystem()
    
    var firstSize = true
    public var circleCount = 10
    
    public init(config: ParticleSystemConfig) {
        self.config = config
        self.particleSystem = ParticleSystem(config: config)
        super.init(size: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func didChangeSize(_ oldSize: CGSize) {
        if firstSize && self.frame.width > particleSystem.maxRadius {
            for i in 0..<circleCount {
                var x = CGFloat.random(in: particleSystem.maxRadius..<self.frame.width)
                var y = CGFloat.random(in: particleSystem.maxRadius..<self.frame.height)
                particleSystem.createRandomParticle(at: CGPoint(x: x,y: y))
            }
            self.addChild(particleSystem)
            particleSystem.addAllChildren()
            firstSize = false
        }
    }
    
    public override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        
    }
    
    
    public override func update(_ currentTime: TimeInterval) {
        particleSystem.updateSystem()  
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touches.forEach {
            touch in
            if particleSystem.touchActive {
                var point = touch.location(in: self)
                particleSystem.createRandomParticle(at: point)
                }
        }
    }
}
