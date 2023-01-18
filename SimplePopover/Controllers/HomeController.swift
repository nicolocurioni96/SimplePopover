//
//  HomeController.swift
//  SimplePopover
//
//  Created by Nicolò Curioni on 18/01/23.
//

import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemTeal
        
    }
    
    // MARK: Actions
    
    @IBAction func showPopover(_ sender: UIBarButtonItem) {
        guard let popoverController = self.storyboard?.instantiateViewController(withIdentifier: "Popover") as? UIViewController else { return }
        
        popoverController.modalPresentationStyle = .popover
        
        if let popover = popoverController.popoverPresentationController {
            popover.permittedArrowDirections = .any
            popover.barButtonItem = sender
            
            // The size you want to display
            popoverController.preferredContentSize = .init(width: 300, height: 100)
            
            popover.delegate = self
        }
        
        self.present(popoverController, animated: true)
    }
}

extension HomeController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}
