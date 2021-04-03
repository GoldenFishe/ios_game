import SpriteKit

class Player: SKSpriteNode {
    public static let categoryBitMask: UInt32 = 0;
    init() {
        let texture = SKTexture(imageNamed: "spaceship");
        let size = CGSize(width: 100, height: 100);
        let color = UIColor.white;
        super.init(texture: texture, color: color, size: size);
        self.position = CGPoint(x: 0, y: -200);
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size);
        self.physicsBody?.isDynamic = true;
        self.physicsBody?.categoryBitMask = Player.categoryBitMask;
    }
    
    public func attack() {
        let laser = Laser();
        self.scene?.addChild(laser);
        laser.animate();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
