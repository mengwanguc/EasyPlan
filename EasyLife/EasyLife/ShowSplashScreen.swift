//
//  ShowSplashScreen.swift
//  EasyLife
//
//  Created by 王昊泽 on 17/3/14.
//  Copyright © 2017年 Haoze Wang. All rights reserved.
//

import UIKit

class ShowSplashScreen: UIViewController {
    
    
    @IBOutlet weak var appNameLable: UILabel!
    
    @IBOutlet weak var developerLabel1: UILabel!
    
    @IBOutlet weak var developLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appNameLable.layer.cornerRadius = 10
        appNameLable.layer.masksToBounds = true
        developerLabel1.layer.cornerRadius = 8
        developerLabel1.layer.masksToBounds  = true
        developLabel2.layer.cornerRadius = 8
        developLabel2.layer.masksToBounds = true
        
        // register for notifications about setting changes
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ShowSplashScreen.defaultsChanged),
                                               name: UserDefaults.didChangeNotification,
                                               object: nil)
        
        
        perform(#selector(self.showsplashscreen), with: nil, afterDelay: 4)
        // Do any additional setup after loading the view.
    }
    
    // stop listening for notifications
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        developerLabel1.text = UserDefaults.standard.string(forKey: "developer1_name")
        developLabel2.text = UserDefaults.standard.string(forKey: "developer2_name")
    }
    
    
    
    
    func defaultsChanged() {
        let name1prefer = UserDefaults.standard.string(forKey: "developer1_name")
        let name2prefer = UserDefaults.standard.string(forKey: "developer2_name")
        developerLabel1.text = name1prefer
        developLabel2.text = name2prefer
    }
    
    
    
    
    
    func showsplashscreen(){
        performSegue(withIdentifier: "showsplashscreen", sender: UIView())
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
