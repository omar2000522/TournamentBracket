//
//  WinnerViewController.swift
//  TournamentBracket
//
//  Created by Omar on 24/10/1439 AH.
//  Copyright © 1439 Omar. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {
    //-------VARIABLES------------
    var winner = String()
    
    //-------OUTLETS--------------
    @IBOutlet weak var winnerLabel: UILabel!
    
    
    //-------FUNCS----------------
    override func viewDidLoad() {
        winnerLabel.text = winner
        super.viewDidLoad()

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
