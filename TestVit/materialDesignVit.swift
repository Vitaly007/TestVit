//
//  materialDesignVit.swift
//  TestVit
//
//  Created by Vitaly Asadullin on 16.10.17.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation
import UIKit
import Material
extension ViewController {
    func formButtons (){
        postButton.titleColor = UIColor.white
        postButton.pulseColor = .white
        postButton.backgroundColor = Color.blue.base
        
        commentsButton.titleColor = UIColor.white
        commentsButton.pulseColor = .white
        commentsButton.backgroundColor = Color.blue.base

        usersButton.titleColor = UIColor.white
        usersButton.pulseColor = .white
        usersButton.backgroundColor = Color.blue.base

        photosButton.titleColor = UIColor.white
        photosButton.pulseColor = .white
        photosButton.backgroundColor = Color.blue.base

        todosButton.titleColor = UIColor.white
        todosButton.pulseColor = .white
        todosButton.backgroundColor = Color.blue.base
    }
    
    func formView(){
        viewC.backgroundColor = UIColor(red:254.0/255.0, green: 254.0/255.0, blue: 254.0/255.0, alpha: 1)
        postView.backgroundColor = UIColor(red:232.0/255.0, green: 234.0/255.0, blue: 246.0/255.0, alpha: 1)
        commentsView.backgroundColor = UIColor(red:197.0/255.0, green: 202.0/255.0, blue: 233.0/255.0, alpha: 1)
        usersView.backgroundColor = UIColor(red:159.0/255.0, green: 168.0/255.0, blue: 218.0/255.0, alpha: 1)
        photosView.backgroundColor = UIColor(red:121.0/255.0, green: 134.0/255.0, blue: 203.0/255.0, alpha: 1)
        todosView.backgroundColor = UIColor(red:92.0/255.0, green: 107.0/255.0, blue: 192.0/255.0, alpha: 1)
        
        postView.layer.shadowColor = UIColor.black.cgColor
        postView.layer.shadowOffset = CGSize(width: 0, height: 0)
        postView.layer.shadowOpacity = 0.3
        postView.layer.shadowRadius = 2
        postView.layer.cornerRadius = 2.0
        
        commentsView.layer.shadowColor = UIColor.black.cgColor
        commentsView.layer.shadowOffset = CGSize(width: 0, height: 0)
        commentsView.layer.shadowOpacity = 0.3
        commentsView.layer.shadowRadius = 2
        commentsView.layer.cornerRadius = 2.0
        
        usersView.layer.shadowColor = UIColor.black.cgColor
        usersView.layer.shadowOffset = CGSize(width: 0, height: 0)
        usersView.layer.shadowOpacity = 0.3
        usersView.layer.shadowRadius = 2
        usersView.layer.cornerRadius = 2.0
        
        photosView.layer.shadowColor = UIColor.black.cgColor
        photosView.layer.shadowOffset = CGSize(width: 0, height: 0)
        photosView.layer.shadowOpacity = 0.3
        photosView.layer.shadowRadius = 2
        photosView.layer.cornerRadius = 2.0
        
        todosView.layer.shadowColor = UIColor.black.cgColor
        todosView.layer.shadowOffset = CGSize(width: 0, height: 0)
        todosView.layer.shadowOpacity = 0.3
        todosView.layer.shadowRadius = 2
        todosView.layer.cornerRadius = 2.0
        
        textPosts.backgroundColor = UIColor(red:252.0/255.0, green: 252.0/255.0, blue: 252.0/255.0, alpha: 1)
        textComments.backgroundColor = UIColor(red:252.0/255.0, green: 252.0/255.0, blue: 252.0/255.0, alpha: 1)
        textUsers.backgroundColor = UIColor(red:252.0/255.0, green: 252.0/255.0, blue: 252.0/255.0, alpha: 1)
        textPhotos.backgroundColor = UIColor(red:252.0/255.0, green: 252.0/255.0, blue: 252.0/255.0, alpha: 1)
        textTodos.backgroundColor = UIColor(red:252.0/255.0, green: 252.0/255.0, blue: 252.0/255.0, alpha: 1)
        
        todosSwitch.tintColor = UIColor(red:121.0/255.0, green: 134.0/255.0, blue: 203.0/255.0, alpha: 1)
        todosSwitch.onTintColor = UIColor(red:159.0/255.0, green: 168.0/255.0, blue: 218.0/255.0, alpha: 1)
        
        self.usersTable.backgroundColor = UIColor(red:159.0/255.0, green: 168.0/255.0, blue: 218.0/255.0, alpha: 1)
    }
}
