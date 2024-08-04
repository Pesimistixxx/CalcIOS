//  Created by Компьютер on 08.04.2024.

import UIKit
import Foundation

protocol VCDelegate{
    func changeBGcolor(r: Float , g: Float , b : Float)
    func changeACcolor(r: Float , g: Float , b : Float)
    func changeBCcolor(r : Float, g : Float, b : Float)
}

class ViewController: UIViewController {
    @IBOutlet var nums: [UIButton]!
    @IBOutlet var BGcolor: UIView!
    @IBOutlet var Acolor: UIView!
    @IBOutlet var numDivide: UIButton!
    @IBOutlet var numPercent: UIButton!
    @IBOutlet var numPlusMinus: UIButton!
    @IBOutlet var numClear: UIButton!
    @IBOutlet var numMulti: UIButton!
    @IBOutlet var numNine: UIButton!
    @IBOutlet var numEight: UIButton!
    @IBOutlet var numSix: UIButton!
    @IBOutlet var numFour: UIButton!
    @IBOutlet var numMinus: UIButton!
    @IBOutlet var numFive: UIButton!
    @IBOutlet var numPlus: UIButton!
    @IBOutlet var numThree: UIButton!
    @IBOutlet var numTwo: UIButton!
    @IBOutlet var numOne: UIButton!
    @IBOutlet var numEqual: UIButton!
    @IBOutlet var numZero: UIButton!
    @IBOutlet var numComma: UIButton!
    @IBOutlet var numSeven: UIButton!
    @IBOutlet weak var displayResult: UILabel!
    
    var prevValue = "0"
    var nowValue = "0"
    var firstravn = false
    var plusOp = false
    var minusOp = false
    var umnOp = false
    var delOp = false
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "VCS", let vc = segue.destination as? SettingsViewController{
            vc.BGcolor = BGcolor.backgroundColor!
            vc.Acolor = Acolor.backgroundColor!
            for val in nums{
                vc.Bcolor = val.tintColor!
            }
            vc.BGRSliderVal = Float((BGcolor.backgroundColor?.cgColor.components?.first)!)
            vc.BGGSliderVal = Float((BGcolor.backgroundColor?.cgColor.components?.dropFirst().first)!)
            vc.BGBSliderVal = Float((BGcolor.backgroundColor?.cgColor.components?.dropLast().last)!)
            vc.BRSliderVal = Float((numSeven.tintColor?.cgColor.components?.first)!)
            vc.BGSliderVal = Float((numSeven.tintColor?.cgColor.components?.dropFirst().first)!)
            vc.BBSliderVal = Float((numSeven.tintColor?.cgColor.components?.dropLast().last)!)
            vc.ARSliderVal = Float((Acolor.backgroundColor?.cgColor.components?.first)!)
            vc.AGSliderVal = Float((Acolor.backgroundColor?.cgColor.components?.dropFirst().first)!)
            vc.ABSliderVal = Float((Acolor.backgroundColor?.cgColor.components?.dropLast().last)!)
            vc.delegate = self
        }
    }
    
    @IBAction func settings(_ sender: Any) {
        performSegue(withIdentifier: "VCS", sender: self)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let buttonText = sender.titleLabel?.text
        if displayResult.text! == "ЯТЕБЯНАНОЛЬПОДЕЛЮ"{
            displayResult.text = "0"
        }
        if (displayResult.text!.count < 15){
            if displayResult.text != "0" && Int(buttonText!) != nil{
                displayResult.text = displayResult.text! + buttonText!
            }
        }
        if (displayResult.text == "0" || displayResult.text == "ЯТЕБЯНАНОЛЬПОДЕЛЮ") && Int(buttonText!) != nil{
            displayResult.text = buttonText!
        }
        if buttonText == ","{
            if displayResult.text!.contains("e"){
              displayResult.text = "0,"
            }
            if displayResult.text!.contains(","){
                displayResult.text = displayResult.text!
            }
            else{
                displayResult.text = displayResult.text! + ","
            }
        }
        else if buttonText == "C"{
            displayResult.text = "0"
            prevValue = "0"
        }
        else if buttonText == "+/-"{
            if displayResult.text!=="0"{
                displayResult.text = displayResult.text!
            }
            else if displayResult.text![displayResult.text!.startIndex] != "-"{
                displayResult.text = "-" + displayResult.text!
            }
            else if displayResult.text![displayResult.text!.startIndex] == "-"{
                displayResult.text!.remove(at: displayResult.text!.startIndex)
            }
        }
        else if buttonText == "%"{
            displayResult.text = displayResult.text?.replacingOccurrences(of: ",", with: ".")
            displayResult.text = String(Double(displayResult.text!)! / 100)
        }
        else if buttonText == "+" || buttonText == "-" || buttonText == "X" || buttonText == "/"{
            prevValue = displayResult.text!
            displayResult.text = "0"
            if buttonText == "+"{
                plusOp = true
                minusOp = false
                umnOp = false
                delOp = false
            }
            if buttonText == "-"{
                plusOp = false
                minusOp = true
                umnOp = false
                delOp = false
            }
            if buttonText == "X"{
                plusOp = false
                minusOp = false
                umnOp = true
                delOp = false
            }
            if buttonText == "/"{
                plusOp = false
                minusOp = false
                umnOp = false
                delOp = true
            }
        }
        else if buttonText == "="{
            nowValue = displayResult.text!
            if plusOp == true{
                plusOp = false
                prevValue = prevValue.replacingOccurrences(of: ",", with: ".")
                displayResult.text = displayResult.text!.replacingOccurrences(of: ",", with: ".")
                if displayResult.text!.contains(".") || prevValue.contains("."){
                    prevValue = prevValue.replacingOccurrences(of: ",", with: ".")
                    displayResult.text = String(Double(prevValue)! + Double(displayResult.text!)!)
                }
                else{
                    displayResult.text = String(Int(prevValue)! + Int(displayResult.text!)!)
                }
            }
            if minusOp == true{
                minusOp = false
                prevValue = prevValue.replacingOccurrences(of: ",", with: ".")
                displayResult.text = displayResult.text!.replacingOccurrences(of: ",", with: ".")
                prevValue = prevValue.replacingOccurrences(of: ",", with: ".")
                displayResult.text = String(Double(prevValue)! - Double(displayResult.text!)!)
            }
            else if umnOp == true{
                umnOp = false
                prevValue = prevValue.replacingOccurrences(of: ",", with: ".")
                displayResult.text = displayResult.text!.replacingOccurrences(of: ",", with: ".")
                    prevValue = prevValue.replacingOccurrences(of: ",", with: ".")
                    displayResult.text = String(Double(prevValue)! * Double(displayResult.text!)!)
            }
            else if delOp == true{
                delOp = false
                if displayResult.text! == "0"{
                    displayResult.text = "ЯТЕБЯНАНОЛЬПОДЕЛЮ"
                }
                else{
                    prevValue = prevValue.replacingOccurrences(of: ",", with: ".")
                    displayResult.text = displayResult.text!.replacingOccurrences(of: ",", with: ".")
                    prevValue = prevValue.replacingOccurrences(of: ",", with: ".")
                    displayResult.text = String(Double(prevValue)!/Double(displayResult.text!)!)
                }
            }
            if displayResult.text!.contains("e") == false{
                displayResult.text = displayResult.text!.replacingOccurrences(of: ",", with: ".")
            if displayResult.text![displayResult.text!.index(before: displayResult.text!.endIndex)] == "0" && displayResult.text![displayResult.text!.index( displayResult.text!.endIndex,offsetBy: -2)] == "."{
                displayResult.text = String(Int(Double(displayResult.text!)!))
            }
            }
        }
        displayResult.text = displayResult.text?.replacingOccurrences(of: ".", with: ",")
    }
}

extension ViewController: VCDelegate{
    func changeBCcolor(r : Float, g: Float, b:Float){
        for val in nums{
            val.tintColor = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
        }
    }
    func changeACcolor(r : Float, g: Float, b:Float){
        Acolor.backgroundColor = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
    }
    func changeBGcolor(r : Float, g: Float, b:Float){
        BGcolor.backgroundColor = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
    }
}
