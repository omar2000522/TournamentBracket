//
//  ViewController.swift
//  TournamentBracket
//
//  Created by Omar on 19/10/1439 AH.
//  Copyright © 1439 Omar. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //------------Variables------------
    var players = [String]()
    var playerLabels = [UILabel]()
    var canAdvance = false
    
    
    //------------Outlet Parking-------
    @IBOutlet weak var PlayerEntryTextField: UITextField!
    @IBOutlet weak var player0: UILabel!
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var player3: UILabel!
    @IBOutlet weak var player4: UILabel!
    @IBOutlet weak var player5: UILabel!
    @IBOutlet weak var player6: UILabel!
    @IBOutlet weak var player7: UILabel!
    @IBOutlet weak var player8: UILabel!
    @IBOutlet weak var player9: UILabel!
    @IBOutlet weak var advanceBut: UIButton!
    
    
    
    //------------Funcs----------------
    @IBAction func addButton(_ sender: Any) {
        
        // Enters player in the players' array
        if PlayerEntryTextField.text != "" && !(players.contains(PlayerEntryTextField.text!)){
            players.append(PlayerEntryTextField.text!)
            PlayerEntryTextField.text = ""
            updateLabels()
        }
        
        if players.contains(PlayerEntryTextField.text!){
            let copyAlert = UIAlertController(title: "You can't input the same name twice!", message: nil, preferredStyle: .alert)
            let copyAlertAction = UIAlertAction(title: "OK", style: .default)
            copyAlert.addAction(copyAlertAction)
            present(copyAlert, animated: true, completion: nil)
        }
        
        if players.count > 1 {
            advanceBut.setTitleColor( .blue , for: .normal)
            canAdvance = true
        }
    }
    
    func updateLabels(){
        for i in 0..<players.count{
            if i < playerLabels.count{
            playerLabels[i].text = players[i]
            }
            else{ playerLabels[playerLabels.count - 1].text = "..." }
        }
    }
    
    @IBAction func advanceButton(_ sender: Any) {
        if canAdvance{
            if players.count <= 4{
            performSegue(withIdentifier: "segue4P", sender: self)
            }
            else if players.count <= 8{
                performSegue(withIdentifier: "segue8P", sender: self)
            }
        }
    }
    
    override func viewDidLoad() {
        playerLabels = [player0,player1,player2,player3,player4,player5,player6,player7,player8,player9]
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        for label in playerLabels{
            label.text = ""
        }
        players = [String]()
        PlayerEntryTextField.text = ""
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue4P"{
        let dataTunnel = segue.destination as! BracketsViewController
        dataTunnel.players = players
        }
        
        if segue.identifier == "segue8P"{
            let dataTunnel = segue.destination as! Top8ViewController
            dataTunnel.players = players
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

