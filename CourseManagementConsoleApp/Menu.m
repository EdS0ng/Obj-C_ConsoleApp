//
//  Menu.m
//  CourseManagementConsoleApp
//
//  Created by Edward Song on 1/16/16.
//  Copyright © 2016 Edward Song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>
#import "Menu.h"
#import "Menu+Submenu_students.h"

@implementation Menu:NSObject

@synthesize studentMenu, menuOptions;


int option;
char str[4];

- (void)menuLoop
{
    while (option!=99) {
        NSLog(@"%@", self.menuOptions);
        NSLog(@"Choose an Option by entering menu number");
        fgets(str, sizeof str, stdin);
        option = atoi(str);
        switch (option) {
            case 1:
                NSLog(@"option 1");
                
                [self studentMenuLoop];
                break;
            case 99:
                break;
            default:
                break;
        }
    }
}

-(id)init
{
    self = [super init];
    return self;
}

@end








