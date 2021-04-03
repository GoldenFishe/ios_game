import SpriteKit

class Enemy: SKSpriteNode {
    public static let categoryBitMask: UInt32 = 1;
    init() {
        let texture = SKTexture(imageNamed: "alien");
        let size = CGSize(width: 100, height: 100);
        let color = UIColor.white;
        super.init(texture: texture, color: color, size: size);
        self.position = CGPoint(x: 0, y: 200);
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size);
        self.physicsBody?.isDynamic = true;
        self.physicsBody?.categoryBitMask = Enemy.categoryBitMask;
        self.physicsBody?.contactTestBitMask = Laser.categoryBitMask;
        self.physicsBody?.collisionBitMask = Laser.categoryBitMask;
    }
    
    public func destroy() {
        let expliosion = SKEmitterNode(fileNamed: "exploision");
        expliosion?.position = self.position;
        let destroyAction = SKAction.removeFromParent();
        
        self.scene?.addChild(expliosion!);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
