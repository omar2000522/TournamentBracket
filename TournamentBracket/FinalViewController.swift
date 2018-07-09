//
//  FinalViewController.swift
//  TournamentBracket
//
//  Created by Omar on 24/10/1439 AH.
//  Copyright © 1439 Omar. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    //--------VARIABLES------------
    var players = [String]()
    var playerLabels = [UILabel]()
    var tourneyWinner = String()
    
    //--------OUTLETS--------------
    @IBOutlet weak var player1L: UILabel!
    @IBOutlet weak var player2L: UILabel!
    
    
    //--------FUNCS----------------
    @IBAction func onTappedLabel(_ sender: UITapGestureRecognizer) {
        for label in playerLabels{
            if label.frame.contains(sender.location(in: view)){
                tourneyWinner = label.text!
                performSegue(withIdentifier: "winner", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        playerLabels = [player1L, player2L]
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for i in 0...players.count-1{
            playerLabels[i].text = players[i]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dataTunnel = segue.destination as! WinnerViewController
        dataTunnel.winner = tourneyWinner
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
