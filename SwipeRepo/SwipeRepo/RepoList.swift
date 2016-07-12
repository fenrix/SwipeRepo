//
//  RepoList.swift
//  SwipeRepo
//
//  Created by Fenrir on 7/9/2559 BE.
//  Copyright © 2559 Fenrir. All rights reserved.
//

import UIKit

class RepoList: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var descriptionTxtView: UITextView!
    let userInst = UserData.sharedInstance
    
    override func viewDidLoad() {
        
                //for test
        
        var count: Int = 0
        scrollView.delegate = self
        for (index,temTest) in userInst.ns.enumerate() {
            let tmpObj: RepoData = temTest as! RepoData
//            print("Index\(index) name\(tmpObj.name)")
            
            let vc = RepoNameViewcontroller(nibName: "RepoNameViewcontroller", bundle: nil)
            vc.repoNameText = tmpObj.name
            
            var framevc = vc.view.frame
            framevc.origin.x = self.view.frame.size.width * CGFloat(index)
            vc.view.frame = framevc
            
            self.addChildViewController(vc)
            self.scrollView.addSubview(vc.view)
            vc.didMoveToParentViewController(self)
            count += 1
        }
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * CGFloat(count), self.scrollView.frame.size.height)
        setTextForIndex(0)
        
    }
    
    func setTextForIndex(index:Int)  {
        
        let test: RepoData = userInst.ns[index] as! RepoData
        let testText:String! = "Description: \(test.description)\n" +
            "Language: \(test.language)\n" +
            "Git Url: \(test.gitlink)\n" +
            "Download Url: \(test.link)\n" +
            "HTML Url: \(test.url)"
        
        self.descriptionTxtView.text = testText
    }
    

}


extension RepoList: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let page = scrollView.contentOffset.x / scrollView.frame.size.width;
        setTextForIndex(Int(page))
        
    }

}