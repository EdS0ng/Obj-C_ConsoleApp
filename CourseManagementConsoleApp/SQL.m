//
//  SQL.m
//  CourseManagementConsoleApp
//
//  Created by Edward Song on 1/22/16.
//  Copyright © 2016 Edward Song. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <my_global.h>
#import <mysql.h>
#import "SQL.h"
#import "SQLprivate.h"


@implementation SQL : NSObject

-(void) printListFrom:(MYSQL_RES *) res
{
    MYSQL_ROW row;
    MYSQL_FIELD * fields;
    unsigned long *lengths;
    int i;
    unsigned int num = mysql_num_fields(res);
    fields = mysql_fetch_fields(res);
    for (i=0; i<num; i++){
        printf("| %.*s |", (int) fields[i].name_length, fields[i].name);
    }
    printf("\n");
    while((row=mysql_fetch_row(res))!=NULL){
        lengths = mysql_fetch_lengths(res);
        for (i=0; i<num;i++){
            printf("| %.*s |", (int) lengths[i], row[i]);
        }
        printf("\n");
    }
}

-(void)initAndConnectSql
{
    if (mysql_init(&_mysql)==NULL){
        printf("failed to init");
        exit(1);
    }
    if (!mysql_real_connect(&_mysql, "192.168.1.193", "edward", "edward1", "courseschedule", 3306, NULL, 0)){
        printf("connection error:  %s\n",mysql_error(&_mysql) );
        exit(1);
    }
}


-(void) deleteOne:(int) num
{
    [self initAndConnectSql];
    char copy[30] = "call delete";
    strncat(copy, _name, 15);
    strncat(copy, "(?)", 4);
    MYSQL_STMT * prepared = mysql_stmt_init(&_mysql);
    mysql_stmt_prepare(prepared, copy, strlen(copy));
    MYSQL_BIND bind[1];
    bind[0].buffer_type = MYSQL_TYPE_LONG;
    bind[0].buffer = &num;
    bind[0].is_null=0;
    bind[0].length= 0;
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
    mysql_close(&_mysql);
}

-(void) getAll
{
    MYSQL_RES *resSet;
    [self initAndConnectSql];
    char copy[20] = "call get";
    strncat(copy, _name, 15);
    strncat(copy, "s()", 5);
    mysql_query(&_mysql, copy);
    resSet = mysql_store_result(&_mysql);
    if (resSet==NULL){
        printf("couldn't get result set");
        exit(1);
    }else{
        [self printListFrom:resSet];
    }
    mysql_free_result(resSet);
    mysql_close(&_mysql);

}

-(id)initWithGroupName:(char *) name
{
    self = [super init];
    if (self){
        _name=name;
    }
    return self;
}

@end