//
//  UITableView+DA.h
//  dakit
//
//  Created by da on 16.10.14.
//  Copyright (c) 2014 Aseev Danil. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UITableView (DA)

- (NSIndexPath*)previousCellIndexPathForCellWithIndexPath:(NSIndexPath*)indexPath;
- (NSIndexPath*)nextCellIndexPathForCellWithIndexPath:(NSIndexPath*)indexPath;

@end


CGFloat UITableViewSeparatorHeight();
