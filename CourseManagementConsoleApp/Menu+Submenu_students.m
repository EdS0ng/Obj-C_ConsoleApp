//
//  Menu+Submenu_students.m
//  CourseManagementConsoleApp
//
//  Created by Edward Song on 1/20/16.
//  Copyright © 2016 Edward Song. All rights reserved.
//

#import "Menu+Submenu_students.h"
#import "SQL.h"
#import "sqlStudents.h"

@implementation Menu (Submenu_students)

char lastName[20];
char firstName[20];
char Gender[7];
char Major[30];

- (void) studentMenuLoop
{   char str[4];
    char studentNum[10];
    int studentID;
    int option;
    sqlStudents *sql = [[sqlStudents alloc]init];
    while (option!=99) {
        [sql getAll];
        NSLog(@"%@", self.studentMenu);
        fgets(str,sizeof str, stdin);
        option = atoi(str);
        switch (option) {
            case 1:
                [self getStudentInfo];
                [sql addStudentGivenLastname:lastName Firstname:firstName Gender:Gender AndMajor:Major];
                break;
            case 2:
                NSLog(@"Enter a Student ID: ");
                fgets(studentNum, sizeof(studentNum), stdin);
                studentID=atoi(studentNum);
                [self getStudentInfo];
                [sql editStudentNum:studentID WithLastname:lastName Firstname:firstName Gender:Gender Major:Major];
                break;
            case 3:
                NSLog(@"Enter a Student ID: ");
                fgets(studentNum, sizeof(studentNum), stdin);
                studentID=atoi(studentNum);
                [sql deleteOne:studentID];
                break;
            case 99:
                break;
            default:
                break;
        }
    }

    
}

- (void) getStudentInfo
{
    
    NSLog(@"\n\n\n\n");
    NSLog(@"Enter Student Last Name: ");
    fgets(lastName, 20, stdin);
    NSLog(@"Enter Student First Name: ");
    fgets(firstName, 20, stdin);
    NSLog(@"Enter Student Gender: ");
    fgets(Gender, 7, stdin);
    NSLog(@"Enter Student Major");
    fgets(Major, 30, stdin);
}

@end
