//
//  DetailViewController.swift
//  S6_MisAutos
//
//  Created by MAC06 on 4/11/21.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var txtDescripcion: UILabel!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var imgAuto: UIImageView!
    
    var data : Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtTitle.text = data.name
        txtDescripcion.text = data.details
        imgAuto.image = UIImage(named: data.image)
    }
}
