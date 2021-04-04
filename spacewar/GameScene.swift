import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate, SKSceneDelegate {
    private var player: Player = Player();
    
    override func didMove(to view: SKView) {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.createEnemy), userInfo: nil, repeats: true);
        self.backgroundColor = UIColor.black;
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0);
        self.physicsWorld.contactDelegate = self;
        
        self.addPlayer();
        self.addBackground();
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player.attack();
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.changePlayerPositionOnTouch(event: event!);
    }
    
    internal func didBegin(_ contact: SKPhysicsContact) {
        var laser: Laser;
        var enemy: Enemy;
        if contact.bodyA.categoryBitMask == Enemy.categoryBitMask {
            enemy = contact.bodyA.node as! Enemy;
            laser = contact.bodyB.node as! Laser;
            enemy.destroy();
            laser.removeFromParent();
        }
    }
    
    @objc func createEnemy() {
        self.addEnemy();
    }
    
    private func addPlayer() {
        self.addChild(player as SKSpriteNode);
    }
    
    private func addEnemy() {
        let xPosition = GKRandomDistribution(lowestValue: 0, highestValue: 300).nextInt();
        let yPosition = GKRandomDistribution(lowestValue: 1000, highestValue: 1200).nextInt();
        let enemy = Enemy(position: CGPoint(x: xPosition, y: yPosition));
        enemy.move();
        self.addChild(enemy as SKSpriteNode);
    }
    
    private func addBackground() {
        let background = SKEmitterNode(fileNamed: "stars")!;
        background.advanceSimulationTime(10);
        background.position = CGPoint(x: 0, y: 1000);
        background.zPosition = -1;
        self.addChild(background);
    }
    
    private func changePlayerPositionOnTouch(event: UIEvent) {
        let firstTouch = event.touches(for: self.view!)?.first;
        let previousLocation = firstTouch?.previousLocation(in: self.view);
        let currentLocation = firstTouch?.location(in: self.view);
        let deltaLocation = CGPoint(x: currentLocation!.x - previousLocation!.x, y: previousLocation!.y - currentLocation!.y);
        player.changePosition(newPosition: deltaLocation);
    }
}
