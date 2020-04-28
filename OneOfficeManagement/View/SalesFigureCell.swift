//
//  SalesFigureCell.swift
//  OneOfficeManagement
//
//  Created by Attila I on 21/04/2020.
//  Copyright © 2020 Attila I. All rights reserved.
//

import UIKit

class SalesFigureCell: UITableViewCell {
    
     @IBOutlet weak var dateOfReportSales: UILabel!
     
     func updateSalesFigure(salesFigure: Figure ) {
        dateOfReportSales.text = salesFigure.reportDate
        
     }
}
