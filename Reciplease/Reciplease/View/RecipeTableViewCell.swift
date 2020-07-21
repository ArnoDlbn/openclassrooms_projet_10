//
//  RecipeTableViewCell.swift
//  Reciplease
//
//  Created by Arnaud Dalbin on 01/06/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeIngredients: UILabel!
    @IBOutlet weak var recipeYield: UILabel!
    @IBOutlet weak var recipeTime: UILabel!
    
    // MARK: - Methods
    

    
    // MARK: - View life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        recipeImage.removeAllGradientLayerInForeground()
    }

}
