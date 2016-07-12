//
//  ViewController.swift
//  SwipeRepo
//
//  Created by Fenrir on 7/9/2559 BE.
//  Copyright © 2559 Fenrir. All rights reserved.
//

import UIKit
import Alamofire




class ViewController: UIViewController {

    
    let userInst = UserData.sharedInstance
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var showBtn: UIButton!
    @IBOutlet weak var activityIndicate: UIActivityIndicatorView!
    
    @IBAction func showBtn(sender: UIButton) {
        
        self.startActivityIndicator()
        let username: String?
        let text = usernameTextField.text
        
        if (text!.characters.count > 0) {
            username = usernameTextField.text
            
        }else{
            //if text field empty
            self.alertPopUp("Warning", msg: "Text field cannot be empty", buttonName: "Ok")
            return
        }
        
        let url = String(format: "%@%@%@", "https://api.github.com/users/", username!, "/repos")
        
        
//        https://api.github.com/users/fenrix/repos
        
        Alamofire.request(.GET, url, parameters: nil)// parameter ?
            .responseJSON { response in

//                print(response.response?.statusCode)
                
                if(response.response?.statusCode == 200){
                    let jSonArray =  (response.result.value as! NSArray) as Array
                    for element in jSonArray {
                        //                    print("Index\(index) is \(element)")
                        //                    print(element["name"]! as? String)
                        let repData = RepoData()
                        repData.name = element["name"] as? String
                        repData.gitlink = element["git_url"] as? String
                        repData.language = element["language"] as? String
                        repData.url = element["html_url"] as? String
                        repData.link = element["downloads_url"] as? String
                        repData.description = element["description"] as? String
                        
                        self.userInst.ns.addObject(repData)
                    }
                    //handle error if no response or out of response code range??
                    self.stopActivityIndicator()
                    let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("RepoListId") as UIViewController
                    self.presentViewController(viewController, animated: true, completion: nil)
                    
                }else{
                    
                    if(response.response?.statusCode == 404){
                        self.alertPopUp("Warning", msg: "Repo not found", buttonName: "Ok")
                    }else{
                        self.alertPopUp("Error", msg: "Something wrong", buttonName: "Ok")
                    }
                    
                    self.stopActivityIndicator()

                }
                
        }
        
        
    }
    
    
    func alertPopUp(title: String, msg: String, buttonName: String) {// handler ?
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: buttonName, style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func startActivityIndicator() {
        self.activityIndicate.startAnimating()
        self.activityIndicate.hidden = false;
    }
    
    func stopActivityIndicator() {
        self.activityIndicate.stopAnimating()
        self.activityIndicate.hidden = true;
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
//        print(text)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

