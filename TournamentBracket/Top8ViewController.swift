//
//  Top8ViewController.swift
//  TournamentBracket
//
//  Created by Omar on 24/10/1439 AH.
//  Copyright © 1439 Omar. All rights reserved.
//

import UIKit

class Top8ViewController: UIViewController {
    //--------Outlets------------
    @IBOutlet weak var player1L: UILabel!
    @IBOutlet weak var player2L: UILabel!
    @IBOutlet weak var player3L: UILabel!
    @IBOutlet weak var player4L: UILabel!
    @IBOutlet weak var player5L: UILabel!
    @IBOutlet weak var player6L: UILabel!
    @IBOutlet weak var player7L: UILabel!
    @IBOutlet weak var player8L: UILabel!
    
    
    //--------Variables----------
    var players = [String]()
    var firstMatches = [UILabel]()
    var stillInTheGame = [UILabel]()
    var winners = [String]()
    var losers = [String]()
    
    //--------Funcs--------------
    override func viewDidLoad() {
        firstMatches = [player1L, player2L, player3L, player4L, player5L, player6L, player7L, player8L]
        stillInTheGame = firstMatches
        
        //clears the label names
        let labels = firstMatches
        for label in labels{
            label.text = ""
        }
        //assigns each player name to a label
        for i in 0..<players.count{
            firstMatches[i].text = players[i]
        }
        //checks if the last player has an apponent if not then he's automatically a winner
//        if firstMatches[firstMatches.count-1].text == ""{
//            firstMatches[firstMatches.count-1].text = "N/A"
//            stillInTheGame.remove(at: firstMatches.count-1)
//            winners.append(firstMatches[firstMatches.count-2].text!)
//        }
        for spot in 0...firstMatches.count-1{
            if firstMatches[spot].text == "" {
                if spot%2 == 0{
                    if firstMatches[spot+1].text == ""{
                        losers.append(firstMatches[spot].text!)
                        losers.append(firstMatches[spot+1].text!)
                        firstMatches[spot].text = "N/A"
                        firstMatches[spot+1].text = "N/A"
                    }
                }
                if spot%2 == 1{
                    if firstMatches[spot-1].text != ""{
                        winners.append(firstMatches[spot-1].text!)
                        losers.append(firstMatches[spot].text!)
                        firstMatches[spot].text = "N/A"
                        
                    }
                }
            }
        }
        updateBracket()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTappedLabel(_ sender: UITapGestureRecognizer) {
        for label in firstMatches{
            
            if label.frame.contains(sender.location(in: view)){
                if stillInTheGame.contains(label) && !winners.contains(label.text!) && !losers.contains(label.text!) && label.text != "N/A"{
                    // if the winner label is at an even index it means that the odd index has the loser and vice versa
                    if players.index(of: label.text!)! % 2 == 0{
                        let indexOfWinner = players.index(of: label.text!)!
                        let indexOfLoser = indexOfWinner + 1
                        results(winner: indexOfWinner, loser: indexOfLoser)
                        
                    }
                    else if players.index(of: label.text!)! % 2 == 1{
                        let indexOfWinner = players.index(of: label.text!)!
                        let indexOfLoser = indexOfWinner - 1
                        results(winner: indexOfWinner, loser: indexOfLoser)
                    }
                }
                updateBracket()
            }
            
        }
    }
    
    func results(winner : Int , loser : Int){
        //adds the winner to the winners' array and does the same for the loser
        winners.append(players[winner])
        losers.append(players[loser])
    }
    
    func updateBracket(){
        for i in 0..<winners.count{
            for label in firstMatches{
                if winners[i] == label.text{
                    label.textColor = .green
                }
            }
        }
        
        for i in 0..<losers.count{
            for label in firstMatches{
                if losers[i] == label.text{
                    label.textColor = .red
                }
            }
        }
        
        if winners.count+losers.count+1 >= firstMatches.count{
            performSegue(withIdentifier: "segue8P4P", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dataTunnel = segue.destination as! BracketsViewController
        dataTunnel.players = winners
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
