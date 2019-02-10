//
//  PostViewController.swift
//  DemoDatabase
//
//  Created by Pasut Kittiprapas on 2/7/2562 BE.
//  Copyright © 2562 Pasut Kittiprapas. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PostViewController: UIViewController {
    var ref: DatabaseReference?
    @IBOutlet weak var textTitle: UITextField!
    @IBOutlet weak var textDesc: UITextField!

    @IBAction func addPost(_ sender: Any) {
        //add to firebase
        if let newPost = ref?.child("Posts").childByAutoId(){
            let id = newPost.key
            ref?.child("Posts").child(id!).child("title").setValue(textTitle.text!)
            ref?.child("Posts").child(id!).child("desc").setValue(textDesc.text!)
            
        }
        else{
            print("error")
        }
        presentingViewController?.dismiss(animated: true, completion:nil)
    }
    @IBAction func cancelPost(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
