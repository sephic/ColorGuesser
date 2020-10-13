//
//  ViewController.swift
//  colorGuess
//
//  Created by User on 7/10/20.
//

import UIKit
// converter from hex to rbga since it's how UIColor works
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

class ViewController: UIViewController {
// Generate a random hex color, display 6 buttons with those colors and names in the background. The idea is to guess what displayed color is the one showed only by code
    // Outlets to buttons so their content is dynamic
    @IBOutlet weak var picked: UILabel!
    @IBOutlet weak var colorToGuess: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var resultsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func randomColor() -> String {
      //generates a random color using hex characters stored on the string letters
        let letters = "abcdef0123456789"
      let color = String((0..<6).map{ _ in letters.randomElement()! })
        return "#\(color)ff"
    }
    
    var guessedColor = ""
    //Start game function
    @IBAction func startGame(_ sender: Any) {
        // Declare the color to guess
        guessedColor = randomColor()
        colorToGuess.setTitle("Reset", for: .normal)
        picked.text = guessedColor
        // random number to pick the random button to win
        let randomButton = Int.random(in: 0...6)
        // if and elses to make sure one of the buttons has the color to guess, and the rest are random colors
        if randomButton == 1 {
            let c1 = guessedColor
            b1.backgroundColor = UIColor(hex: c1)
            let c2 = randomColor()
            b2.backgroundColor = UIColor(hex: c2)
            let c3 = randomColor()
            b3.backgroundColor = UIColor(hex: c3)
            let c4 = randomColor()
            b4.backgroundColor = UIColor(hex: c4)
            let c5 = randomColor()
            b5.backgroundColor = UIColor(hex: c5)
            let c6 = randomColor()
            b6.backgroundColor = UIColor(hex: c6)
        } else if randomButton == 2 {
            let c1 = randomColor()
            b1.backgroundColor = UIColor(hex: c1)
            let c2 = guessedColor
            b2.backgroundColor = UIColor(hex: c2)
            let c3 = randomColor()
            b3.backgroundColor = UIColor(hex: c3)
            let c4 = randomColor()
            b4.backgroundColor = UIColor(hex: c4)
            let c5 = randomColor()
            b5.backgroundColor = UIColor(hex: c5)
            let c6 = randomColor()
            b6.backgroundColor = UIColor(hex: c6)
        } else if randomButton == 3 {
            let c1 = randomColor()
            b1.backgroundColor = UIColor(hex: c1)
            let c2 = randomColor()
            b2.backgroundColor = UIColor(hex: c2)
            let c3 = guessedColor
            b3.backgroundColor = UIColor(hex: c3)
            let c4 = randomColor()
            b4.backgroundColor = UIColor(hex: c4)
            let c5 = randomColor()
            b5.backgroundColor = UIColor(hex: c5)
            let c6 = randomColor()
            b6.backgroundColor = UIColor(hex: c6)
        } else if randomButton == 4 {
            let c1 = randomColor()
            b1.backgroundColor = UIColor(hex: c1)
            let c2 = randomColor()
            b2.backgroundColor = UIColor(hex: c2)
            let c3 = randomColor()
            b3.backgroundColor = UIColor(hex: c3)
            let c4 = guessedColor
            b4.backgroundColor = UIColor(hex: c4)
            let c5 = randomColor()
            b5.backgroundColor = UIColor(hex: c5)
            let c6 = randomColor()
            b6.backgroundColor = UIColor(hex: c6)
        } else if randomButton == 5 {
            let c1 = randomColor()
            b1.backgroundColor = UIColor(hex: c1)
            let c2 = randomColor()
            b2.backgroundColor = UIColor(hex: c2)
            let c3 = randomColor()
            b3.backgroundColor = UIColor(hex: c3)
            let c4 = randomColor()
            b4.backgroundColor = UIColor(hex: c4)
            let c5 = guessedColor
            b5.backgroundColor = UIColor(hex: c5)
            let c6 = randomColor()
            b6.backgroundColor = UIColor(hex: c6)
        } else if randomButton == 6 {
            let c1 = randomColor()
            b1.backgroundColor = UIColor(hex: c1)
            let c2 = randomColor()
            b2.backgroundColor = UIColor(hex: c2)
            let c3 = randomColor()
            b3.backgroundColor = UIColor(hex: c3)
            let c4 = randomColor()
            b4.backgroundColor = UIColor(hex: c4)
            let c5 = randomColor()
            b5.backgroundColor = UIColor(hex: c5)
            let c6 = guessedColor
            b6.backgroundColor = UIColor(hex: c6)
        }
                
    }
    // actions to compare the user guess with the colors, change the color to red if wrong
    @IBAction func b1A(_ sender: Any) {
        
        if b1.backgroundColor == UIColor(hex: guessedColor ) {
            resultsLabel.text = "You win"
            resultsLabel.backgroundColor = UIColor(hex: "#00ff00ff")
        } else {
            resultsLabel.text = "You lose"
            resultsLabel.backgroundColor = UIColor(hex: "#ff0000ff")
        }
    }
    
    @IBAction func b2A(_ sender: Any) {
        if b2.backgroundColor == UIColor(hex: guessedColor) {
            resultsLabel.text = "You win"
            resultsLabel.backgroundColor = UIColor(hex: "#00ff00ff")
        } else {
            resultsLabel.text = "You lose"
            resultsLabel.backgroundColor = UIColor(hex: "#ff0000ff")
        }
    }
    
    @IBAction func b3A(_ sender: Any) {
        if b3.backgroundColor == UIColor(hex: guessedColor ) {
            resultsLabel.text = "You win"
            resultsLabel.backgroundColor = UIColor(hex: "#00ff00ff")
        } else {
            resultsLabel.text = "You lose"
            resultsLabel.backgroundColor = UIColor(hex: "#ff0000ff")
        }
    }
    
    @IBAction func b4A(_ sender: Any) {
        if b4.backgroundColor == UIColor(hex: guessedColor ) {
            resultsLabel.text = "You win"
            resultsLabel.backgroundColor = UIColor(hex: "#00ff00ff")
        } else {
            resultsLabel.text = "You lose"
            resultsLabel.backgroundColor = UIColor(hex: "#ff0000ff")
        }
    }
    
    @IBAction func b5A(_ sender: Any) {
        if b5.backgroundColor == UIColor(hex: guessedColor ) {
            resultsLabel.text = "You win"
            resultsLabel.backgroundColor = UIColor(hex: "#00ff00ff")
        } else {
            resultsLabel.text = "You lose"
            resultsLabel.backgroundColor = UIColor(hex: "#ff0000ff")
        }
    }
    
    @IBAction func b6A(_ sender: Any) {
        if b6.backgroundColor == UIColor(hex: guessedColor ) {
            resultsLabel.text = "You win"
            resultsLabel.backgroundColor = UIColor(hex: "#00ff00ff")
        } else {
            resultsLabel.text = "You lose"
            resultsLabel.backgroundColor = UIColor(hex: "#ff0000ff")
        }
    }
    
}

