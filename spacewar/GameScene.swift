import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate, SKSceneDelegate {
    
    private var player: Player = Player();
    private var enemy: Enemy = Enemy();
    private var background: SKEmitterNode?;
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.black;
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0);
        self.physicsWorld.contactDelegate = self;
        
        self.addPlayer();
        self.addEnemy();
        self.addBackground();
    }
    
    internal func didBegin(_ contact: SKPhysicsContact) {
//        var laser: Laser;
        var enemy: Enemy;
        if contact.bodyA.categoryBitMask == Enemy.categoryBitMask {
            print("its laser");
            enemy = contact.bodyA.node as! Enemy;
            enemy.destroy();
        }
        print(contact.bodyA);
    }
    
    private func addPlayer() {
        self.addChild(player as SKSpriteNode);
    }
    
    private func addEnemy() {
        self.addChild(enemy as SKSpriteNode);
    }
    
    private func addBackground() {
        background = SKEmitterNode(fileNamed: "stars")!;
        background?.advanceSimulationTime(10);
        background?.position = CGPoint(x: 0, y: 1000);
        background?.zPosition = -1;
        self.addChild(background!);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.attack();
    }
}
