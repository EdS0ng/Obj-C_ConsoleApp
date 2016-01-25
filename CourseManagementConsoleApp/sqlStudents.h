//
//  sqlStudents.h
//  CourseManagementConsoleApp
//
//  Created by Edward Song on 1/24/16.
//  Copyright © 2016 Edward Song. All rights reserved.
//

#ifndef sqlStudents_h
#define sqlStudents_h

#import "SQL.h"


@interface sqlStudents : SQL

-(void) addStudentGivenLastname:(char *)lastname Firstname:(char *)firstname Gender:(char *)gender AndMajor:(char *)major;

-(void) editStudentNum:(int) num WithLastname: (char *)lastname Firstname: (char *)firstname Gender:(char *)gender Major:(char*)major;

-(instancetype) init;

@end



#endif /* sqlStudents_h */
