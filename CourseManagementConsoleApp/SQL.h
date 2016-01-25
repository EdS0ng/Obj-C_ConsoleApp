//
//  SQL.h
//  CourseManagementConsoleApp
//
//  Created by Edward Song on 1/22/16.
//  Copyright © 2016 Edward Song. All rights reserved.
//

#ifndef SQL_h
#define SQL_h

#import <Foundation/Foundation.h>

@interface SQL : NSObject


-(void) getAll;

-(id) initWithGroupName:(char *) name;

-(void) deleteOne:(int) num;

-(void) initAndConnectSql;


@end

#endif /* SQL_h */
