//
//  ViewController.swift
//  test_Firebase
//
//  Created by 荒川陸 on 2016/03/21.
//  Copyright © 2016年 riku_arakawa. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref = Firebase(url:"https://hem-tutorial-0318.firebaseio.com")
    @IBOutlet var label : UILabel!
    var num = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ref.queryLimitedToLast(25).observeEventType(FEventType.ChildAdded, withBlock: { (snapshot) in
            print(snapshot.value!)
            self.num = snapshot.value["num"] as! Int
            self.label.text = String(self.num)
        })
        

        
    }

    @IBAction func plus(){
        num++
        let post = ["num":num]
        let post1Ref = ref.childByAutoId()
        post1Ref.setValue(post)
        label.text = String(num)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

