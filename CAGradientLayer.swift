//
//  CAGradientLayer.swift
//  scrabbleTwoLetter
//
//  Created by Chris Hovey on 4/27/16.
//  Copyright © 2016 Chris Hovey. All rights reserved.
//

import UIKit

extension CAGradientLayer {

    func redColor() -> CAGradientLayer{
        let topColor = UIColor(red: 204.0/255.0, green: 30.0/255.0, blue: 35.0/255.0, alpha: 1.0)
        let bottomColor = UIColor(red: 229.0/255.0, green: 81.0/255.0, blue: 86.0/255.0, alpha: 1.0)

        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
    
    func redColor2() -> CAGradientLayer{
        let topColor = UIColor(red: 204.0/255.0, green: 30.0/255.0, blue: 35.0/255.0, alpha: 1.0)
        let bottomColor = UIColor(red: 229.0/255.0, green: 81.0/255.0, blue: 86.0/255.0, alpha: 1.0)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor, topColor.CGColor]
        let gradientLocations: [Float] = [0.0, 0.65, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func whiteToRedColor() -> CAGradientLayer{
        let topColor = UIColor(red: 108.0/255.0, green: 147.0/255.0, blue: 209.0/255.0, alpha: 1.0)
        let bottomColor = UIColor(red: 57.0/255.0, green: 106.0/255.0, blue: 184.0/255.0, alpha: 1.0)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
    
    func collectionButtonBlue() -> CAGradientLayer{
        let leftColor = UIColor(red: 108.0/255.0, green: 147.0/255.0, blue: 209.0/255.0, alpha: 1.0)
        let rightColor = UIColor(red: 57.0/255.0, green: 106.0/255.0, blue: 184.0/255.0, alpha: 1.0)
        
        let gradientColors: [CGColor] = [leftColor.CGColor, rightColor.CGColor]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPointMake(0.0, 0.0)
        gradientLayer.endPoint = CGPointMake(1.0, 1.0)
        
        return gradientLayer
    }
    
    func hotColors() -> CAGradientLayer{
        let leftColor = UIColor(red: 102.0/255.0, green: 255.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        let rightColor = UIColor(red: 57/255.0, green: 230/255.0, blue: 0.0/255.0, alpha: 1.0)
        
        let gradientColors: [CGColor] = [leftColor.CGColor, rightColor.CGColor]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPointMake(0.0, 0.0)
        gradientLayer.endPoint = CGPointMake(1.0, 1.0)
        
        return gradientLayer
    }
    
    func greenToBlue() -> CAGradientLayer{
        let leftColor = UIColor(red: 102.0/255.0, green: 255.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        let rightColor = UIColor(red: 108.0/255.0, green: 147.0/255.0, blue: 209.0/255.0, alpha: 1.0)
        
        let gradientColors: [CGColor] = [leftColor.CGColor, rightColor.CGColor]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPointMake(0.0, 0.5)
        
        gradientLayer.endPoint = CGPointMake(0.35, 0.5)

        return gradientLayer
    }
    
    
    
    
}