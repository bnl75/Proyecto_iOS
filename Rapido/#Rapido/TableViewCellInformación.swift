//
//  TableViewCellInformación.swift
//  #Rapido
//
//  Created by Laboratorio UNAM-Apple 01 on 10/10/19.
//  Copyright © 2019 ari. All rights reserved.
//

import UIKit

class TableViewCellInformacio_n: UITableViewCell {
    
    
    @IBOutlet weak var labelNombre: UILabel!
    
    
    @IBOutlet weak var labelNumero: UILabel!
    
    @IBOutlet weak var labelDireccion: UILabel!
    
    
    @IBOutlet weak var imageFoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
