//
//  main.m
//  CourseManagementConsoleApp
//
//  Created by Edward Song on 1/16/16.
//  Copyright © 2016 Edward Song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Menu.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Menu * mainMenu = [[Menu alloc]init];
        mainMenu.menuOptions = @"(1.) See Student List (99.) Exit the Program";
        mainMenu.studentMenu = @"(1.) Add a Student (2.) Edit a Student (3.) Delete a Student (4.) See Student's Registered Courses (5.) Enroll for a Course (6.) Unenroll for a Course (99.) Previous Menu";
        [mainMenu menuLoop];
    }
    return 0;
}
