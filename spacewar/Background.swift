import SpriteKit

class Background: SKEmitterNode {
    
    override init() {
        super.init(imageNamed: "stars");
        self.particleTexture = SKTexture(fileNamed: "stars");
        self.advanceSimulationTime(10);
        self.position = CGPoint(x: 0, y: 1000);
        self.zPosition = -1;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
