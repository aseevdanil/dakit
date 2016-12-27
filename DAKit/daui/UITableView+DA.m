//
//  UITableView+DA.m
//  dakit
//
//  Created by da on 16.10.14.
//  Copyright (c) 2014 Aseev Danil. All rights reserved.
//

#import "UITableView+DA.h"



@implementation UITableView (DA)


- (NSIndexPath*)previousCellIndexPathForCellWithIndexPath:(NSIndexPath*)indexPath
{
	NSIndexPath *previousCellIndexPath = nil;
	if (indexPath.row > 0)
	{
		previousCellIndexPath = [NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section];
	}
	else
	{
		NSInteger nonEmptySection = indexPath.section;
		NSUInteger numberOfRows = 0;
		while (numberOfRows == 0)
		{
			if (--nonEmptySection < 0)
				break;
			numberOfRows = [self numberOfRowsInSection:nonEmptySection];
		}
		if (numberOfRows > 0)
			previousCellIndexPath = [NSIndexPath indexPathForRow:numberOfRows - 1 inSection:nonEmptySection];
	}
	return previousCellIndexPath;
}


- (NSIndexPath*)nextCellIndexPathForCellWithIndexPath:(NSIndexPath*)indexPath
{
	NSIndexPath *nextCellIndexPath = nil;
	if (indexPath.row < [self numberOfRowsInSection:indexPath.section] - 1)
	{
		nextCellIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
	}
	else
	{
		NSInteger nonEmptySection = indexPath.section;
		NSUInteger numberOfRows = 0;
		while (numberOfRows == 0)
		{
			if (++nonEmptySection >= [self numberOfSections])
				break;
			numberOfRows = [self numberOfRowsInSection:nonEmptySection];
		}
		if (numberOfRows > 0)
			nextCellIndexPath = [NSIndexPath indexPathForRow:0 inSection:nonEmptySection];
	}
	return nextCellIndexPath;
}


@end



inline CGFloat UITableViewSeparatorHeight()
{
	return UIScreenPixel();
}
