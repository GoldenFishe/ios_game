import SpriteKit

class Laser: SKSpriteNode {
    public static let categoryBitMask: UInt32 = 2;
    init(position: CGPoint) {
        let texture = SKTexture(imageNamed: "laser");
        let size = CGSize(width: 10, height: 20);
        let color = UIColor.white;
        super.init(texture: texture, color: color, size: size);
        self.position = position;
        self.size = CGSize(width: 10, height: 20);
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size);
        self.physicsBody?.isDynamic = true;
        self.physicsBody?.categoryBitMask = Laser.categoryBitMask;
    }
    
    public func animate() {
        let moveAction = SKAction.moveTo(y: 1000, duration: 0.75);
        let soundAction = SKAction.playSoundFileNamed("laserSound", waitForCompletion: false);
        let destroyAction = SKAction.removeFromParent();
        let actions = SKAction.sequence([soundAction, moveAction, destroyAction]);
        self.run(actions);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
