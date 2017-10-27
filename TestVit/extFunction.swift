//
//  extFunction.swift
//  TestVit
//
//  Created by Vitaly Asadullin on 16.10.17.
//  Copyright © 2017 home. All rights reserved.
//

import Foundation
import UIKit
extension ViewController {
    
    //сообщение об ошибке выбора n пользователю
    func ShowAlertError(text: String){
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: {
            alert in
        })
        alert.addAction(ok)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    //Для загрузки картинок
    //https://codedump.io/share/ICwCA7UUrGYI/1/loading-image-from-url
    func getDataFromUrl(url:NSURL, completion: @escaping ((_ data: NSData?, _ response: URLResponse?, _ error: NSError? ) -> Void)) {
        URLSession.shared.dataTask(with: url as URL) { (data, response, error) in
            completion(data! as NSData, response, error as NSError?)
            }.resume()
    }
    
    //Обновление высоты экрана
    func updateHeight(){
        self.usersTable.layoutIfNeeded()
        self.usersTable.setNeedsDisplay()
        self.usersTableHeightConstraint.constant = self.usersTable.contentSize.height
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.scrollView.layoutIfNeeded()
            self.viewC.layoutIfNeeded()
            //self.scrollView.layoutIfNeeded()
            self.postView.layoutIfNeeded()
            self.commentsView.layoutIfNeeded()
            self.usersView.layoutIfNeeded()
            //self.self.usersTable.layoutIfNeeded()
            //self.usersTable.setNeedsDisplay()
            self.photosView.layoutIfNeeded()
            self.todosView.layoutIfNeeded()
            self.photos2View.center = CGPoint(x:self.viewL.frame.size.width  / 2, y: self.viewL.frame.size.height / 2)
            self.image2View.center = CGPoint(x:self.photos2View.frame.size.width  / 2, y: self.photos2View.frame.size.height / 2)
        }) { (Bool) -> Void in
        }
    }
    
    //Момент поворота экрана
    @objc func rotated() {
        //        if UIDevice.current.orientation.isLandscape {
        //            print("Landscape")
        //        } else {
        //            print("Portrait")
        //        }
        updateHeight()
        
    }
    
    //Показать большой рисунок
    @objc func imageTap(_ sender:AnyObject){
        //print("you tap image number : \(sender.view.tag)")
        let h = min(UIScreen.main.bounds.height - 16 , UIScreen.main.bounds.width - 16 , 600)
        photos2View.frame.size.height = h
        photos2View.frame.size.width = h
        image2View.frame.size.height = h
        image2View.frame.size.width = h
        
        photos2View.center = CGPoint(x:viewL.frame.size.width  / 2, y: viewL.frame.size.height / 2)
        image2View.center = CGPoint(x:photos2View.frame.size.width  / 2, y: photos2View.frame.size.height / 2)
        
        
        //if photos2View.tag == 0 {
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.photos2View.alpha = 1
                self.image2View.alpha = 1
            }) { (Bool) -> Void in
            }
        //}
    }
    
    //Скрыть большой рисунок
    @objc func imageTap2(_ sender:AnyObject){
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.photos2View.alpha = 0
            self.image2View.alpha = 0
        }) { (Bool) -> Void in
        }
    }
}
