//
//  sqlStudents.m
//  CourseManagementConsoleApp
//
//  Created by Edward Song on 1/24/16.
//  Copyright © 2016 Edward Song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <my_global.h>
#import <mysql.h>
#import "SQL.h"
#import "SQLprivate.h"
#import "sqlStudents.h"

@implementation sqlStudents : SQL

unsigned long strlength1;
unsigned long strlength2;
unsigned long strlength3;
unsigned long strlength4;

-(void)addStudentGivenLastname:(char *)lastname Firstname:(char *)firstname Gender:(char *)gender AndMajor:(char *)major
{
    strlength1 = strlen(lastname);
    strlength2 = strlen(firstname);
    strlength3 = strlen(gender);
    strlength4 = strlen(major);
    char * query = "call addStudent(?,?,?,?)";
    [self initAndConnectSql];
    MYSQL mysql = self.mysql;
    MYSQL_BIND bind[4];
    memset(bind, 0, sizeof(bind));
    MYSQL_STMT * prepared = mysql_stmt_init(&mysql);
    mysql_stmt_prepare(prepared, query, strlen(query));
    //bind last name
    bind[0].buffer = lastname;
    bind[0].buffer_type = MYSQL_TYPE_STRING;
    bind[0].buffer_length = strlen(lastname)*sizeof(char);
    bind[0].length = &strlength1;
    bind[0].is_null = 0;
    //bind first name
    bind[1].buffer = firstname;
    bind[1].buffer_type = MYSQL_TYPE_STRING;
    bind[1].buffer_length = strlen(firstname)*sizeof(char);
    bind[1].length = &strlength2;
    bind[1].is_null = 0;
    //bind gender
    bind[2].buffer = gender;
    bind[2].buffer_type = MYSQL_TYPE_STRING;
    bind[2].buffer_length = strlen(gender)*sizeof(char);
    bind[2].length = &strlength3;
    bind[2].is_null = 0;
    //bind major
    bind[3].buffer = major;
    bind[3].buffer_type = MYSQL_TYPE_STRING;
    bind[3].buffer_length = strlen(major)*sizeof(char);
    bind[3].length = &strlength4;
    bind[3].is_null = 0;
    if (mysql_stmt_bind_param(prepared, bind))
    {
        printf("error in binding params");
        exit(1);
    }
    if (mysql_stmt_execute(prepared))
    {
        printf("Error executing prepared statement");
        exit(1);
    }
    mysql_stmt_close(prepared);
    mysql_close(&mysql);
}

-(void)editStudentNum:(int)num WithLastname:(char *)lastname Firstname:(char *)firstname Gender:(char *)gender Major:(char *)major
{
    strlength1 = strlen(lastname);
    strlength2 = strlen(firstname);
    strlength3 = strlen(gender);
    strlength4 = strlen(major);
    [self initAndConnectSql];
    MYSQL mysql = self.mysql;
    char * query = "call editStudent(?,?,?,?,?)";
    MYSQL_BIND bind[5];
    memset(bind, 0, sizeof(bind));
    MYSQL_STMT * prepared = mysql_stmt_init(&mysql);
    mysql_stmt_prepare(prepared, query, strlen(query));
    //bind last name
    bind[0].buffer = lastname;
    bind[0].buffer_type = MYSQL_TYPE_STRING;
    bind[0].buffer_length = strlen(lastname)*sizeof(char);
    bind[0].length = &strlength1;
    bind[0].is_null = 0;
    //bind first name
    bind[1].buffer = firstname;
    bind[1].buffer_type = MYSQL_TYPE_STRING;
    bind[1].buffer_length = strlen(firstname)*sizeof(char);
    bind[1].length = &strlength2;
    bind[1].is_null = 0;
    //bind gender
    bind[2].buffer = gender;
    bind[2].buffer_type = MYSQL_TYPE_STRING;
    bind[2].buffer_length = strlen(gender)*sizeof(char);
    bind[2].length = &strlength3;
    bind[2].is_null = 0;
    //bind major
    bind[3].buffer = major;
    bind[3].buffer_type = MYSQL_TYPE_STRING;
    bind[3].buffer_length = strlen(major)*sizeof(char);
    bind[3].length = &strlength4;
    bind[3].is_null = 0;
    //bind studentNum
    bind[4].buffer = &num;
    bind[4].buffer_type = MYSQL_TYPE_LONG;
    bind[4].is_null=0;
    bind[4].length= 0;
    if (mysql_stmt_bind_param(prepared, bind))
    {
        printf("error in binding params");
        exit(1);
    }
    if (mysql_stmt_execute(prepared))
    {
        printf("Error executing prepared statement");
        exit(1);
    }
    mysql_stmt_close(prepared);
    mysql_close(&mysql);

}

-(instancetype) init{
    self = [super initWithGroupName:"Student"];
    return self;
}

@end