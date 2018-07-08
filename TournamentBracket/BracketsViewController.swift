//
//  BracketsViewController.swift
//  TournamentBracket
//
//  Created by Omar on 22/10/1439 AH.
//  Copyright © 1439 Omar. All rights reserved.
//

import UIKit

class BracketsViewController: UIViewController {
    //--------Outlets------------
    @IBOutlet weak var player1L: UILabel!
    @IBOutlet weak var player2L: UILabel!
    @IBOutlet weak var player3L: UILabel!
    @IBOutlet weak var player4L: UILabel!
    @IBOutlet weak var Splayer1L: UILabel!
    @IBOutlet weak var Splayer2L: UILabel!
    @IBOutlet weak var winnerL: UILabel!
    
    //--------Variables----------
    var players = [String]()
    var firstMatches = [UILabel]()
    var stillInTheGame = [UILabel]()
    var winners = [String]()
    var losers = [String]()
    
    //--------Funcs--------------
    override func viewDidLoad() {
        firstMatches = [player1L, player2L, player3L, player4L]
        stillInTheGame = firstMatches
        let labels = [player1L, player2L, player3L, player4L, Splayer1L, Splayer2L]
        for label in labels{
            label?.text = ""
        }
        for i in 0..<players.count{
            firstMatches[i].text = players[i]
        }
        if firstMatches[firstMatches.count-1].text == ""{
            
        }
        startTournament()
        super.viewDidLoad()
    }

    
    func startTournament(){
        
    }
    
    @IBAction func onTappedLabel(_ sender: UITapGestureRecognizer) {
        for label in firstMatches{
            
            if label.frame.contains(sender.location(in: view)){
                if stillInTheGame.contains(label) && !winners.contains(label.text!) && !losers.contains(label.text!){
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
            
        }
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
