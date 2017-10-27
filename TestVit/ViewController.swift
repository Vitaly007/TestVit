//
//  ViewController.swift
//  TestVit
//
//  Created by Vitaly Asadullin on 09.10.17.
//  Copyright © 2017 home. All rights reserved.
//

import UIKit
import Material
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    // В настройках проекта на вкладке Info в позиции Custom IOS Target Properties добавлена вершинка App Transport Security Settings со значением Allow Arbitrary Loads = YES   -- для загрузки картинок
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.usersTable.isScrollEnabled = false
        self.usersTable.estimatedRowHeight = self.usersTable.rowHeight
        self.usersTable.rowHeight = UITableViewAutomaticDimension
        self.usersTable.showsHorizontalScrollIndicator = false
        self.usersTable.showsVerticalScrollIndicator = false
        self.usersTable.separatorStyle = UITableViewCellSeparatorStyle.none
        self.todosSwitch.setOn(false, animated: false)
        self.todosSwitch.isUserInteractionEnabled = false
        
        self.textPosts.delegate = self
        self.textComments.delegate = self
        self.textUsers.delegate = self
        self.textPhotos.delegate = self
        self.textTodos.delegate = self
        
        formButtons()
        formView()
        
        //Поймать момент завершения поворота экрана
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTap))
        photosImage.addGestureRecognizer(tapGestureRecognizer)
        photosImage.isUserInteractionEnabled = true
        
        photos2View.alpha = 0
        image2View.alpha = 0
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTap2))
        image2View.addGestureRecognizer(tapGestureRecognizer2)
        image2View.isUserInteractionEnabled = true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //При Landscape не пропадать статус бару
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !self.priznakDidLoad {
            users5Load()
            
            self.photosLoad(parametr: "3")
            
            let randomNumber = Int(arc4random_uniform(UInt32(200))) + 1
            self.todosLoad(parametr: randomNumber.description)
            
            self.priznakDidLoad = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var priznakDidLoad : Bool = false
    
    @IBOutlet weak var viewL: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewC: UIView!
    
    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var postViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var postLabel1: UILabel!
    @IBOutlet weak var postLabel2: UILabel!
    @IBOutlet weak var postButton: RaisedButton!
    
    @IBOutlet weak var commentsView: UIView!
    @IBOutlet weak var commentsViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var commentsLabel1: UILabel!
    @IBOutlet weak var commentsLabel2: UILabel!
    @IBOutlet weak var commentsLabel3: UILabel!
    @IBOutlet weak var commentsButton: RaisedButton!
    
    @IBOutlet weak var usersView: UIView!
    @IBOutlet weak var usersViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var usersTable: UITableView!
    @IBOutlet weak var usersTableHeightConstraint: NSLayoutConstraint!
    var usersDataTable : [usersData] = []
    @IBOutlet weak var usersButton: RaisedButton!
    
    @IBOutlet weak var photosView: UIView!    
    @IBOutlet weak var photosLabel: UILabel!
    @IBOutlet weak var photosImageParentView: UIView!
    @IBOutlet weak var photosImage: UIImageView!
    var photosUrl : String = ""
    var photosThumbnailUrl : String = ""
    @IBOutlet weak var photosButton: RaisedButton!
    
    @IBOutlet weak var photos2View: UIView!
    @IBOutlet weak var image2View: UIImageView!
    
    @IBOutlet weak var todosView: UIView!
    @IBOutlet weak var todosLabel: UILabel!
    @IBOutlet weak var todosSwitch: UISwitch!
    @IBOutlet weak var todosButton: RaisedButton!
    
    @IBOutlet weak var textPosts: UITextField!
    @IBOutlet weak var textComments: UITextField!
    @IBOutlet weak var textUsers: UITextField!
    @IBOutlet weak var textPhotos: UITextField!
    @IBOutlet weak var textTodos: UITextField!
    
    @IBAction func buttonPosts(_ sender: UIButton) {
        var parametr : String
        
        parametr = textPosts.text!
        if parametr != "" {
            if  Int(parametr)! > 100 {
                ShowAlertError(text: "Для Posts Максимальный n = 100")
            }
            else {
                postLoad(parametr: parametr)
            }
        }
    }
    @IBAction func buttonComments(_ sender: UIButton) {
        var parametr : String
        parametr = textComments.text!
        if parametr != "" {
            if  Int(parametr)! > 500 {
                ShowAlertError(text: "Для comments Максимальный n = 500")
            }
            else {
                commentsLoad(parametr: parametr)
            }
        }
    }
    @IBAction func buttonUsers(_ sender: UIButton) {
        if textUsers.text != "" {
            var parametr : String
            parametr = textUsers.text!
            if  Int(parametr)! > 10 {
                ShowAlertError(text: "Для users Максимальный n = 10")
            }
            else {
                users1Load(parametr: parametr)
            }
        } else  {
            users5Load()
        }
    }
    @IBAction func buttonPhotos(_ sender: UIButton) {
        if textPhotos.text != "" {
            var parametr : String
            parametr = textPhotos.text!
            if  Int(parametr)! > 5000 {
                ShowAlertError(text: "Для photos Максимальный n = 5000")
            }
            else {
                photosLoad(parametr: parametr)
                
            }
        } else  {
            photosLoad(parametr: "3")
        }
        
    }
    @IBAction func buttonTodos(_ sender: UIButton) {
        if textTodos.text != "" {
            var parametr : String
            parametr = textTodos.text!
            if  Int(parametr)! > 200 {
                ShowAlertError(text: "Для todos Максимальный n = 200")
            }
            else {
                self.todosLoad(parametr: parametr)
            }
        } else  {
            let randomNumber = Int(arc4random_uniform(UInt32(200))) + 1
            self.todosLoad(parametr: randomNumber.description)
        }
    }
}

//https://ufa.hh.ru/vacancy/22960294
//https://jsonplaceholder.typicode.com/
//https://stackoverflow.com/questions/10335747/how-to-download-xcode-dmg-or-xip-file
//https://www.appcoda.com/view-animation-in-swift/
