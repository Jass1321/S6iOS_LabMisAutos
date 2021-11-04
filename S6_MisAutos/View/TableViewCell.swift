//
//  TableViewCell.swift
//  S6_MisAutos
//
//  Created by MAC06 on 4/11/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var txtTitulo: UILabel!
    @IBOutlet weak var imagenVehiculo: UIImageView!
    
    func onBind(image:String, name:String){
        txtTitulo.text = name
        imagenVehiculo.image = UIImage(named: image)
    }
    
}

