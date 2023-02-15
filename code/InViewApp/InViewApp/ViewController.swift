import UIKit
import Invest
import CGWInvest

public protocol DeepDropManagerProtocol: NSObject {
     var destinationVC: String { get }
    func launch()
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let destination = "CGInvest.CGWDeepDropManager"
        let destination = "Invest.InvestDeepDropManager"
        launch(destinationVC: destination)
    }
    
    func launch(destinationVC: String) {
        
        if let managerClass = NSClassFromString(destinationVC) as? NSObject.Type {
            let manager = managerClass.init()

            let methodName = "launch"
            let methodSelector: Selector = NSSelectorFromString(methodName)
            guard manager.responds(to: methodSelector) else {
                return
         }
            let _ =  manager.perform(methodSelector)

        } else {
            print("specified class does not exist")
        }
    }
}

// Extension to Invest module
extension InvestDeepDropManager: DeepDropManagerProtocol {
    public  var destinationVC: String {
        return "Invest.InvestDeepDropManager"
    }
    
      @objc public func launch() {
        print("InvestDeepDropManager belongs to Invest module)")
    }
}

// Extension to CGWInvest module
extension CGWDeepDropManager: DeepDropManagerProtocol {
    public  var destinationVC: String {
        return "CGWInvest.CGWDeepDropManager"
    }
    
    @objc public func launch() {
        print("CGWDeepDropManager belongs to CGInvest module)")
    }
}


