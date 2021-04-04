import SpriteKit

class Menu: SKScene {
    
    private var startBtn: SKLabelNode?;
    
    override func didMove(to view: SKView) {
        startBtn = self.childNode(withName: "startBtn") as? SKLabelNode;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first;
        print(touch)
        if let location = touch?.location(in: self) {
            let nodes = self.nodes(at: location);
            
            if nodes.first?.name == "startBtn" {
                let transition = SKTransition.fade(withDuration: 3);
                let scene = GameScene(size: self.size);
                self.view?.presentScene(scene, transition: transition);
            }
        }
    }
}
