//
//  UIImageCell.swift
//  PrimeiroProjetoViewCode
//
//  Created by Raina Rodrigues de Lima on 24/10/22.
//

import UIKit

extension UIImageView {
    func imageFromServerURL(_ URLString: String) {
        self.image = UIImage(named: "ImageError")
        let imageServerUrl = URLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                if let setUrl = URL(string: imageServerUrl) {
                    URLSession.shared.dataTask(with: setUrl, completionHandler: { (data, _ , error) in
                        if error != nil {
                            print("ERROR LOADING IMAGES FROM URL: (String(describing: error))")
                            return
                        }
                        DispatchQueue.main.async {
                            if let data = data {
                                if UIImage(data: data) != nil {
                                    self.image = UIImage(data: data)
                                }
                            }
                        }
                    }).resume()
                }
        
    }
}
