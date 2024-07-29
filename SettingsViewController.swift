//  Created by Компьютер on 22.07.2024.
import Foundation
import UIKit

class SettingsViewController: UIViewController {    
    @IBOutlet var background: UIView!
    @IBOutlet weak var BGLabel: UILabel!
    @IBOutlet var backgroundColorText: UILabel!
    @IBOutlet var buttonColor: UIButton!
    @IBOutlet weak var accentColor: UIView!
    @IBOutlet weak var sliderBGRobj: UISlider!{
        didSet{
            sliderBGRobj.value = Float((background.backgroundColor?.cgColor.components?.first)!)
        }
    }
    @IBOutlet weak var sliderBGGobj: UISlider!{
        didSet{
                sliderBGGobj.value = Float((background.backgroundColor?.cgColor.components?.dropFirst().first)!)
        }
    }
    @IBOutlet weak var sliderBGBobj: UISlider!{
        didSet{
            sliderBGBobj.value = Float((background.backgroundColor?.cgColor.components?.dropLast().last)!)
        }
    }
    @IBOutlet weak var sliderBRobj: UISlider!{
        didSet{
            sliderBRobj.value = Float((buttonColor.tintColor?.cgColor.components?.first)!)
        }
    }
    @IBOutlet weak var sliderBGobj: UISlider!{
        didSet{
            sliderBGobj.value = Float((buttonColor.tintColor?.cgColor.components?.dropFirst().first)!)
        }
    }
    @IBOutlet weak var sliderBBobj: UISlider!{
        didSet{
            sliderBBobj.value = Float((buttonColor.tintColor?.cgColor.components?.dropLast().last)!)
        }
    }
    @IBOutlet weak var sliderARobj: UISlider!{
        didSet{
            sliderARobj.value = Float((accentColor.backgroundColor?.cgColor.components?.first)!)
        }
    }
    @IBOutlet weak var sliderAGobj: UISlider!{
        didSet{
            sliderAGobj.value = Float((accentColor.backgroundColor?.cgColor.components?.dropFirst().first)!)
        }
    }
    @IBOutlet weak var sliderABobj: UISlider!{
        didSet{
            sliderABobj.value = Float((accentColor.backgroundColor?.cgColor.components?.dropLast().last)!)
        }
    }
    
    var Acolor = UIColor.red
    var BGcolor = UIColor.red
    var Bcolor = UIColor.red
    var BGRSliderVal : Float = 0.0
    var BGGSliderVal : Float = 0.0
    var BGBSliderVal : Float = 0.0
    var BRSliderVal : Float = 0.0
    var BGSliderVal : Float = 0.0
    var BBSliderVal : Float = 0.0
    var ARSliderVal : Float = 0.0
    var AGSliderVal : Float = 0.0
    var ABSliderVal : Float = 0.0
    var delegate: VCDelegate!
    
    func changeBGcolor(r: Float , g: Float , b : Float){
        background.backgroundColor = UIColor.init(_colorLiteralRed: r, green: g, blue: b, alpha: 1)
    }
    func changeBcolor(r: Float , g: Float , b : Float){
        buttonColor.tintColor = UIColor.init(_colorLiteralRed: r, green: g, blue: b, alpha: 1)
    }
    func changeAcolor(r: Float , g: Float , b : Float){
        accentColor.backgroundColor = UIColor.init(_colorLiteralRed: r, green: g, blue: b, alpha: 1)
    }
    @IBAction func toCalc(_ sender: UIButton) {
        delegate.changeBCcolor(r: sliderBRobj.value, g: sliderBGobj.value, b: sliderBBobj.value)
        delegate.changeBGcolor(r: sliderBGRobj.value, g: sliderBGGobj.value, b: sliderBGBobj.value)
        delegate.changeACcolor(r: sliderARobj.value, g: sliderAGobj.value, b: sliderABobj.value)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func sliderBGR(_ sender: UISlider) {
        changeBGcolor(r: sliderBGRobj.value, g: sliderBGGobj.value, b: sliderBGBobj.value)
    }
    @IBAction func sliderBGG(_ sender: UISlider) {
        changeBGcolor(r: sliderBGRobj.value, g: sliderBGGobj.value, b: sliderBGBobj.value)
    }
    @IBAction func sliderBGB(_ sender: UISlider) {
        changeBGcolor(r: sliderBGRobj.value, g: sliderBGGobj.value, b: sliderBGBobj.value)
    }
    @IBAction func sliderBR(_ sender: UISlider) {
        changeBcolor(r: sliderBRobj.value, g: sliderBGobj.value, b: sliderBBobj.value)
    }
    @IBAction func sliderBG(_ sender: UISlider) {
        changeBcolor(r: sliderBRobj.value, g: sliderBGobj.value, b: sliderBBobj.value)
    }
    @IBAction func sliderBB(_ sender: UISlider) {
        changeBcolor(r: sliderBRobj.value, g: sliderBGobj.value, b: sliderBBobj.value)
    }
    @IBAction func sliderAR(_ sender: UISlider) {
        changeAcolor(r: sliderARobj.value, g: sliderAGobj.value, b: sliderABobj.value)
    }
    @IBAction func sliderAG(_ sender: UISlider) {
        changeAcolor(r: sliderARobj.value, g: sliderAGobj.value, b: sliderABobj.value)
    }
    @IBAction func sliderAB(_ sender: UISlider) {
        changeAcolor(r: sliderARobj.value, g: sliderAGobj.value, b: sliderABobj.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        background.backgroundColor = BGcolor
        accentColor.backgroundColor = Acolor
        buttonColor.tintColor = Bcolor
        sliderBGRobj.value = BGRSliderVal
        sliderBGGobj.value = BGGSliderVal
        sliderBGBobj.value = BGBSliderVal
        sliderBRobj.value = BRSliderVal
        sliderBGobj.value = BGSliderVal
        sliderBBobj.value = BBSliderVal
        sliderARobj.value = ARSliderVal
        sliderAGobj.value = AGSliderVal
        sliderABobj.value = ABSliderVal
    }
}
