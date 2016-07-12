//
//  RepoNameViewcontroller.swift
//  SwipeRepo
//
//  Created by Fenrir on 7/10/2559 BE.
//  Copyright © 2559 Fenrir. All rights reserved.
//

import UIKit

class RepoNameViewcontroller: UIViewController {

    @IBOutlet weak var rapoName: UILabel!
    
    var repoNameText: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rapoName.text = repoNameText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
