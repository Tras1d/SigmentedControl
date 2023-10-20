//
//  ViewController.swift
//  SigmentedControl
//
//  Created by Дмитрий Лебедев on 28.09.2023.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
   func sendColor()
}

final class ViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var mainSliderRed: UISlider!
    @IBOutlet weak var mainSliderGreen: UISlider!
    @IBOutlet weak var mainSliderBlue: UISlider!
    
    @IBOutlet weak var mainLabelRed: UILabel!
    @IBOutlet weak var mainLabelGreen: UILabel!
    @IBOutlet weak var mainLableBlue: UILabel!
    
    weak var delegate: ViewControllerDelegate!
    weak var backgroundColor: UIColor?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.layer.cornerRadius = mainView.frame.width / 18
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMineSliderRed()
        setupMineSliderGreen()
        setupMainSliderBlue()
        setupMineLableRed()
        setupMainLableGreen()
        setupMainLableBlue()
        setupViewColor()
        if let backgroundColor = backgroundColor {
               view.backgroundColor = backgroundColor
           }

    }
    
    @IBAction func mainSliderActionRed() {
        mainLabelRed.text = String(format: "%.2f", mainSliderRed.value)
        setupViewColor()
        delegate.sendColor()
    }
    
    @IBAction func mainSliderActionGreen() {
        mainLabelGreen.text = String(format: "%.2f", mainSliderGreen.value)
        setupViewColor()
        delegate.sendColor()
    }
    
    @IBAction func mainSliderActionBlue() {
        mainLableBlue.text = String(format: "%.2f", mainSliderBlue.value)
        setupViewColor()
        delegate.sendColor()
    }
    
    @IBAction func Done() {
        dismiss(animated: true)
    }
    
    private func setupMineSliderRed() {
        mainSliderRed.value = 0
        mainSliderRed.minimumValue = 0
        mainSliderRed.maximumValue = 1
        mainSliderRed.minimumTrackTintColor = .red
        mainSliderRed.maximumTrackTintColor = .black
        mainSliderRed.thumbTintColor = .white
    }
    
    private func setupMineSliderGreen() {
        mainSliderGreen.value = 0
        mainSliderGreen.minimumValue = 0
        mainSliderGreen.maximumValue = 1
        mainSliderGreen.minimumTrackTintColor = .green
        mainSliderGreen.maximumTrackTintColor = .black
        mainSliderGreen.thumbTintColor = .white
    }
    
    private func setupMainSliderBlue() {
        mainSliderBlue.value = 0
        mainSliderBlue.minimumValue = 0
        mainSliderBlue.maximumValue = 1
        mainSliderBlue.minimumTrackTintColor = .blue
        mainSliderBlue.maximumTrackTintColor = .black
        mainSliderBlue.thumbTintColor = .white
    }
    
    private func setupMineLableRed() {
        mainLabelRed.text = mainSliderRed.value.formatted()
        mainLabelRed.font = mainLabelRed.font.withSize(18)
        mainLabelRed.textColor = .white
    }
    
    private func setupMainLableGreen() {
        mainLabelGreen.text = mainSliderGreen.value.formatted()
        mainLabelGreen.font = mainLabelGreen.font.withSize(18)
        mainLabelGreen.textColor = .white
    }
    
    private func setupMainLableBlue() {
        mainLableBlue.text = mainSliderBlue.value.formatted()
        mainLableBlue.font = mainLableBlue.font.withSize(18)
        mainLableBlue.textColor = .white
    }
    
    private func setupViewColor() {
        mainView.backgroundColor = UIColor(red: CGFloat(mainSliderRed.value), green: CGFloat(mainSliderGreen.value), blue: CGFloat(mainSliderBlue.value), alpha: 1)
    }
    
}

