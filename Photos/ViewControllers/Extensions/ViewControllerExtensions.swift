//
//  ViewControllerExtensions.swift
//  Photos
//
//  Created by Casandra Grullon on 9/8/21.
//

import UIKit

extension UIViewController {
    func showActivityIndicator(loadingView: UIView, spinner: UIActivityIndicatorView ) {
        DispatchQueue.main.async {
            loadingView.addSubview(spinner)
            self.view.addSubview(loadingView)
            spinner.startAnimating()
        }
    }

    func hideActivityIndicator(loadingView: UIView, spinner: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            spinner.stopAnimating()
            loadingView.removeFromSuperview()
        }
    }
    
    func showAlert(title: String, message: String, spinner: UIActivityIndicatorView?, view: UIView?, completion: ((UIAlertAction) -> Void)? = nil) {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
      let okAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
      alertController.addAction(okAction)
        
        if let view = view, let spinner = spinner {
            present(alertController, animated: true) {
                self.hideActivityIndicator(loadingView: view, spinner: spinner)
            }
        } else {
            present(alertController, animated: true, completion: nil)
        }
    }
}
