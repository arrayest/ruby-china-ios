import UIKit
import WebKit

class NewTopicViewController: PopupWebViewController {
    var doneButton: UIBarButtonItem?
    var closeButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        if path == "/topics/new" {
            title = "创建新话题"
        }
        else {
            title = "修改话题"
        }
        
        
        doneButton = UIBarButtonItem.init(title: "提交", style: .Plain, target: self, action: #selector(actionDone))
        closeButton = UIBarButtonItem.init(barButtonSystemItem: .Cancel, target: self, action: #selector(actionClose))
        
        navigationController?.navigationBar.tintColor = UIColor.blackColor()
        navigationItem.leftBarButtonItem = closeButton
        navigationItem.rightBarButtonItem = doneButton
        
        super.viewDidLoad()
    }
    
    func actionDone() {
        webView.evaluateJavaScript("$('form[tb=\"edit-topic\"]').submit()", completionHandler: nil)
    }
}
