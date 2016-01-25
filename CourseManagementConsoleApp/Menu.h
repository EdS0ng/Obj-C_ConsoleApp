//
//  Menu.h
//  CourseManagementConsoleApp
//
//  Created by Edward Song on 1/18/16.
//  Copyright © 2016 Edward Song. All rights reserved.
//

#ifndef Menu_h
#define Menu_h

#import <Foundation/Foundation.h>

@interface Menu : NSObject

@property NSString * menuOptions;
@property NSString * studentMenu;


- (void)menuLoop;


@end


#endif /* Menu_h */
