//
//  RequestHead.h
//  Neptunus
//
//  Created by niuhenglei on 15/10/30.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#ifndef RequestHead_h
#define RequestHead_h

#define BaseUrl @"http://192.168.19.132:8080/api"
#define FILE_URL  @""



/**
 controller
 */


#define CONTROLLER_ACCOUNT @"account"
#define CONTROLLER_CONTACT @"contact"
#define CONTROLLER_MESSAGE @"message"
#define CONTROLLER_POST @"post"
#define CONTROLLER_COLLECTION @"collection"



/**
 action
 */

//account

#define ACTION_LOGIN @"login"

//chatMe http://192.168.19.132:8080/api/Message/GetChartList





/**
 KEY WORLD
 */
#define KEY_SESSIONID @"userId"
#define KEY_PAGEINDEX @"pageindex"
#define KEY_PAGESIZE @"pagesize"
#define KEY_TYPE @"type"





/**
 
 VALUE
 
 */

#define VALUE_PAGESIZE @"20"
#define VALUE_ANALYSE @"1"
#endif /* RequestHead_h */
