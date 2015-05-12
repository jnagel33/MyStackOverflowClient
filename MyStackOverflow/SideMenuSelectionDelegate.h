//
//  SideMenuSelectionDelegate.h
//  MyStackOverflow
//
//  Created by Josh Nagel on 5/11/15.
//  Copyright (c) 2015 jnagel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SideMenuSelectionDelegate <NSObject>

-(void)userDidSelectOption:(NSInteger)selection;

@end
