//
//  SettingsViewController.swift
//  FireFlight
//
//  Created by Kobe McKee on 9/18/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit
import UserNotifications

class SettingsViewController: UIViewController {

    var apiController: APIController?
    var notificationEnabled: Bool?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var defaultStyleSwitch: UISwitch!
    @IBOutlet weak var outdoorStyleSwitch: UISwitch!
    @IBOutlet weak var lightStyleSwitch: UISwitch!
    @IBOutlet weak var darkStyleSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradient = CAGradientLayer()
        gradient.colors = [AppearanceHelper.macAndCheese.cgColor, AppearanceHelper.begonia.cgColor, AppearanceHelper.turkishRose.cgColor, AppearanceHelper.oldLavender.cgColor, AppearanceHelper.ming.cgColor]
        gradient.frame = view.bounds
        view.layer.insertSublayer(gradient, at: 0)
        
        updateStyleSwitches()
    }
    
    
    func updateStyleSwitches() {
        
        if UserDefaults.standard.bool(forKey: "outdoorStyle") == true {
            defaultStyleSwitch.isOn = false
            outdoorStyleSwitch.isOn = true
            lightStyleSwitch.isOn = false
            darkStyleSwitch.isOn = false
        } else if UserDefaults.standard.bool(forKey: "lightStyle") == true {
            defaultStyleSwitch.isOn = false
            outdoorStyleSwitch.isOn = false
            lightStyleSwitch.isOn = true
            darkStyleSwitch.isOn = false
        } else if UserDefaults.standard.bool(forKey: "darkStyle") == true {
            defaultStyleSwitch.isOn = false
            outdoorStyleSwitch.isOn = false
            lightStyleSwitch.isOn = false
            darkStyleSwitch.isOn = true
        } else {
            defaultStyleSwitch.isOn = true
            outdoorStyleSwitch.isOn = false
            lightStyleSwitch.isOn = false
            darkStyleSwitch.isOn = false
        }
    }

    
    
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: {
            NotificationCenter.default.post(Notification(name: UIApplication.didBecomeActiveNotification))
        })
    }
    

    
    @IBAction func defaultStylePressed(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(false, forKey: "outdoorStyle")
        userDefaults.set(false, forKey: "lightStyle")
        userDefaults.set(false, forKey: "darkStyle")
        updateStyleSwitches()
    }
    
    
    @IBAction func outdoorStylePressed(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "outdoorStyle")
        userDefaults.set(false, forKey: "lightStyle")
        userDefaults.set(false, forKey: "darkStyle")
        updateStyleSwitches()
    }
    
    @IBAction func lightStylePressed(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(false, forKey: "outdoorStyle")
        userDefaults.set(true, forKey: "lightStyle")
        userDefaults.set(false, forKey: "darkStyle")
        updateStyleSwitches()
    }
    
    @IBAction func darkStylePressed(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(false, forKey: "outdoorStyle")
        userDefaults.set(false, forKey: "lightStyle")
        userDefaults.set(true, forKey: "darkStyle")
        updateStyleSwitches()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
