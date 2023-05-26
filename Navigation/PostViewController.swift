//
//  PostViewController.swift
//  Navigation
//
//  Created by Alex Chumakov on 20.05.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post = Post(title: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        title = post.title
        
        let myButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(newInfoController(_: )))
        
        navigationItem.rightBarButtonItem = myButton
        
    }
    
    @objc func newInfoController(_ sender: UIButton) {
        let infoViewController = InfoViewController()
        
        infoViewController.modalTransitionStyle = .coverVertical
        infoViewController.modalPresentationStyle = .fullScreen
        
        navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}

