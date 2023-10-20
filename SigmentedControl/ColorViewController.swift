//
//  ColorViewController.swift
//  SigmentedControl
//
//  Created by Дмитрий Лебедев on 20.10.2023.
//

import UIKit

final class ColorViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ViewController else { return }
        viewController.color = view.backgroundColor
        viewController.delegate = self
    }
}


extension ColorViewController: ViewControllerDelegate {
    func sendColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}








