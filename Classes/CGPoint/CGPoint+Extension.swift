//
//  CGPoint+Extension.swift
//  lwWallet
//
//  Created by zyn on 2019/7/25.
//  Copyright © 2019 乐为金融. All rights reserved.
//

import UIKit

extension CGPoint {
    func translate(_ dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: self.x+dx, y: self.y+dy)
    }
    
    func transform(_ t: CGAffineTransform) -> CGPoint {
        return self.applying(t)
    }
    
    ///两点距离
    func distance(_ b: CGPoint) -> CGFloat {
        return sqrt(pow(self.x-b.x, 2)+pow(self.y-b.y, 2))
    }
}
