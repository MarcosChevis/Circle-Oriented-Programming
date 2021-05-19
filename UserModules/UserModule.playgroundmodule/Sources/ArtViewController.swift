import UIKit
import SpriteKit

public class ArtViewController: UIViewController{

    public let scene: ArtScene
    
    public init(config: ParticleSystemConfig) {
        scene = ArtScene(config: config)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        
        super.viewDidLoad()
        let view = SKView()
        scene.scaleMode = .resizeFill
        view.presentScene(scene)
        self.view = view
        view.showsFPS = true
        view.showsNodeCount = true
        
    }
}

