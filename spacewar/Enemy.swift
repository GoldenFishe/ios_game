import SpriteKit

class Enemy: SKSpriteNode {
    
    public static let categoryBitMask: UInt32 = 1;
    
    init(position: CGPoint) {
        let texture = SKTexture(imageNamed: "alien");
        let size = CGSize(width: 100, height: 100);
        let color = UIColor.white;
        super.init(texture: texture, color: color, size: size);
        self.position = position;
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size);
        self.physicsBody?.isDynamic = true;
        self.physicsBody?.categoryBitMask = Enemy.categoryBitMask;
        self.physicsBody?.contactTestBitMask = Laser.categoryBitMask;
        self.physicsBody?.collisionBitMask = Laser.categoryBitMask;
    }
    
    public func move() {
        let moveAction = SKAction.moveTo(y: -1000, duration: 5);
        let destroyAction = SKAction.removeFromParent();
        let actions = SKAction.sequence([moveAction, destroyAction]);
        self.run(actions);
    }
    
    public func destroy() {
        let expliosion = SKEmitterNode(fileNamed: "exploision");
        expliosion?.position = self.position;
        let exploisionSoundAction = SKAction.playSoundFileNamed("exploisionSound", waitForCompletion: false);
        let exploisionPauseAction = SKAction.wait(forDuration: 0.2);
        let exploisionDestroyAction = SKAction.removeFromParent();
        let exploisionActions = [exploisionSoundAction, exploisionPauseAction, exploisionDestroyAction]
        expliosion?.run(SKAction.sequence(exploisionActions));
        self.scene?.addChild(expliosion!);
        self.removeFromParent();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
