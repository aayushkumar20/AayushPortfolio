//
//  ConstraintsManager.swift
//  AayushPortfolio
//
//  Created by Aayush kumar on 15/12/23.
//

import UIKit


class ConstraintsManager {
    
    // Dictionary that maps iPhone models to their PPI values
    class var width: CGFloat {
        ///Returns the main screen width size in points.
        return UIScreen.main.bounds.width
    }
    
    class var height: CGFloat {
        ///Returns the main screen height size in points.
        return UIScreen.main.bounds.height
    }

}
