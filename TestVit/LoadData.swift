//
//  LoadData.swift
//  TestVit
//
//  Created by Vitaly Asadullin on 11.10.17.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation
import Alamofire
extension ViewController {
    
    func postLoad(parametr : String){
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/" + parametr).responseJSON
            { response in
                if let resultA = response.result.value as? NSDictionary {
                    var postLabel1text : String = ""
                    var postLabel2text : String = ""
                    
                    if let titleObject = resultA["title"] as? String {
                        postLabel1text = titleObject
                        
                    }
                    if let bodyObject = resultA["body"] as? String {
                        postLabel2text = bodyObject
                    }
                    
                    UIView.transition(with: self.postView, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                        self.postLabel1.text = postLabel1text
                        self.postLabel2.text = postLabel2text
                    }, completion: { (Bool) in
                    })
                }
                self.updateHeight()
        }
    }
    
    func commentsLoad(parametr : String){
        Alamofire.request("https://jsonplaceholder.typicode.com/comments/" + parametr).responseJSON
            { response in
                if let resultA = response.result.value as? NSDictionary {
                    var commentsLabel1text : String = ""
                    var commentsLabel2text : String = ""
                    var commentsLabel3text : String = ""
                    
                    if let nameObject = resultA["name"] as? String {
                        commentsLabel1text = nameObject
                    }
                    if let bodyObject = resultA["body"] as? String {
                        commentsLabel2text = bodyObject
                    }
                    if let emailObject = resultA["email"] as? String {
                        commentsLabel3text = emailObject
                    }
                    
                    UIView.transition(with: self.commentsView, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                        self.commentsLabel1.text = commentsLabel1text
                        self.commentsLabel2.text = commentsLabel2text
                        self.commentsLabel3.text = commentsLabel3text
                    }, completion: { (Bool) in
                    })
                }
                self.updateHeight()
        }
    }
    
    func users1Load(parametr : String){
        self.usersDataTable.removeAll()
        Alamofire.request("https://jsonplaceholder.typicode.com/users/" + parametr).responseJSON
            { response in
                
                let usersDataTemp = usersData()
                
                if let resultA = response.result.value as? NSDictionary {
                    if let nameObject = resultA["name"] as? String {
                        usersDataTemp.name = nameObject
                    }
                    if let usernameObject = resultA["username"] as? String {
                        usersDataTemp.username = usernameObject
                    }
                    if let emailObject = resultA["email"] as? String {
                        usersDataTemp.email = emailObject
                    }
                    if let resultAddress = resultA["address"] as? NSDictionary {
                        if let streetObject = resultAddress["street"] as? String {
                            usersDataTemp.street = streetObject
                        }
                        if let suiteObject = resultAddress["suite"] as? String {
                            usersDataTemp.suite = suiteObject
                        }
                        if let cityObject = resultAddress["city"] as? String {
                            usersDataTemp.city = cityObject
                        }
                        if let zipcodeObject = resultAddress["zipcode"] as? String {
                            usersDataTemp.zipcode = zipcodeObject
                        }
                    }
                    if let phoneObject = resultA["phone"] as? String {
                        usersDataTemp.phone = phoneObject
                    }
                    if let websiteObject = resultA["website"] as? String {
                        usersDataTemp.website = websiteObject
                    }
                    if let resultCompany = resultA["company"] as? NSDictionary {
                        if let nameObject = resultCompany["name"] as? String {
                            usersDataTemp.companyName = nameObject
                        }
                        if let catchPhraseObject = resultCompany["catchPhrase"] as? String {
                            usersDataTemp.catchPhrase = catchPhraseObject
                        }
                        if let bsObject = resultCompany["bs"] as? String {
                            usersDataTemp.bs = bsObject
                        }
                    }
                }
                usersDataTemp.address = usersDataTemp.street + ", " + usersDataTemp.suite  + ", " + usersDataTemp.city  + ", " + usersDataTemp.zipcode
                
                self.usersDataTable.append(usersDataTemp)
                self.usersTable.reloadData()
                
                self.updateHeight()
        }
    }
    
    func users5Load(){
        self.usersDataTable.removeAll()
        Alamofire.request("https://jsonplaceholder.typicode.com/users" ).responseJSON
            { response in
                if let resultArray = response.result.value as? [[String: Any]] {
                    if resultArray.count>1 {
                        for index in 0...resultArray.count-1 {
                            let usersDataTemp = usersData()
                            if let nameObject = resultArray[index]["name"] as? String {
                                usersDataTemp.name = nameObject
                            }
                            if let usernameObject = resultArray[index]["username"] as? String {
                                usersDataTemp.username = usernameObject
                            }
                            if let emailObject = resultArray[index]["email"] as? String {
                                usersDataTemp.email = emailObject
                            }
                            if let resultAddress = resultArray[index]["address"] as? NSDictionary {
                                if let streetObject = resultAddress["street"] as? String {
                                    usersDataTemp.street = streetObject
                                }
                                if let suiteObject = resultAddress["suite"] as? String {
                                    usersDataTemp.suite = suiteObject
                                }
                                if let cityObject = resultAddress["city"] as? String {
                                    usersDataTemp.city = cityObject
                                }
                                if let zipcodeObject = resultAddress["zipcode"] as? String {
                                    usersDataTemp.zipcode = zipcodeObject
                                }
                            }
                            if let phoneObject = resultArray[index]["phone"] as? String {
                                usersDataTemp.phone = phoneObject
                            }
                            if let websiteObject = resultArray[index]["website"] as? String {
                                usersDataTemp.website = websiteObject
                            }
                            if let resultCompany = resultArray[index]["company"] as? NSDictionary {
                                if let nameObject = resultCompany["name"] as? String {
                                    usersDataTemp.companyName = nameObject
                                }
                                if let catchPhraseObject = resultCompany["catchPhrase"] as? String {
                                    usersDataTemp.catchPhrase = catchPhraseObject
                                }
                                if let bsObject = resultCompany["bs"] as? String {
                                    usersDataTemp.bs = bsObject
                                }
                            }
                            usersDataTemp.address = usersDataTemp.street + ", " + usersDataTemp.suite  + ", " + usersDataTemp.city  + ", " + usersDataTemp.zipcode
                            self.usersDataTable.append(usersDataTemp)
                            
                            if index == 4 { break }
                        }
                    }
                }
                self.usersTable.reloadData()
                
                self.updateHeight()
        }
    }
    
    func photosLoad(parametr : String){
        Alamofire.request("https://jsonplaceholder.typicode.com/photos/" + parametr).responseJSON
            { response in
                if let resultA = response.result.value as? NSDictionary {
                    
                    if let titleObject = resultA["title"] as? String {
                        self.photosLabel.text = titleObject
                    }
                    if let urlObject = resultA["url"] as? String {
                        self.photosUrl = urlObject
                    }
                    if let thumbnailUrlObject = resultA["thumbnailUrl"] as? String {
                        self.photosThumbnailUrl = thumbnailUrlObject
                        
                        //https://codedump.io/share/ICwCA7UUrGYI/1/loading-image-from-url
                        self.getDataFromUrl(url: NSURL(string: thumbnailUrlObject)! as NSURL) { (data, response, error)  in
                            DispatchQueue.main.async() { () -> Void in
                                guard let data = data, error == nil else { return }
                                //print(response?.suggestedFilename ?? "")
                                
                                //self.photosImage.image = UIImage(data: data as Data)
                                //Плавно изменим рисунок
                                UIView.transition(with: self.photosImageParentView, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                                    self.photosImage.image = UIImage(data: data as Data)
                                }, completion: { (Bool) in
                                })
                            }
                        }
                        //
                        self.getDataFromUrl(url: NSURL(string: self.photosUrl)! as NSURL) { (data, response, error)  in
                            DispatchQueue.main.async() { () -> Void in
                                guard let data = data, error == nil else { return }
                                //print(response?.suggestedFilename ?? "")
                                
                                //self.photosImage.image = UIImage(data: data as Data)
                                //Плавно изменим рисунок
                                UIView.transition(with: self.photos2View, duration: 0.3, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                                    self.image2View.image = UIImage(data: data as Data)
                                }, completion: { (Bool) in
                                })
                            }
                        }
                        //
                    }
                }
                self.updateHeight()
        }
    }
    
    func todosLoad(parametr : String){
        Alamofire.request("https://jsonplaceholder.typicode.com/todos/" + parametr).responseJSON
            { response in
                if let resultA = response.result.value as? NSDictionary {
                    if let titleObject = resultA["title"] as? String {
                        self.todosLabel.text = titleObject
                    }
                    if let completedObject = resultA["completed"] as? Bool {
                        self.todosSwitch.setOn(completedObject, animated: true)
                    }
                }
                self.updateHeight()
        }
    }
    
        
}
