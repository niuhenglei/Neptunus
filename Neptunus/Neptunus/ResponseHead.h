//
//  ResponseHead.h
//  Neptunus
//
//  Created by niuhenglei on 15/10/30.
//  Copyright © 2015年 niuhenglei. All rights reserved.
//

#ifndef ResponseHead_h
#define ResponseHead_h

//user response key

/**
 common keys
 */

#define COMMON_ISSUCCESS @"IsSuccess"
#define COMMON_ERRORCODE @"Code"
#define COMMON_RESULT @"Result"
#define COMMON_ERRORMSG @"Message"

/**
 user infomation
 */
#define USER_CONCERNS @"Concerns"                     //关注数
#define USER_DEPARTMENT @"Department"                 //科室
#define USER_FANS @"Fans"                             //粉丝数
#define USER_GENDER @"Gender"                         //性别
#define USER_HOSPITAL @"Hospital"                     //医院
#define USER_ICONID @"IconId"                         //头像id
#define USER_ID @"Id"                                 //用户id
#define USER_INTEGRAL @"Integral"                     //积分
#define USER_INTRODUCE @"Introduce"                   //自我介绍
#define USER_NAME @"Name"                             //姓名
#define USER_REGION @"Region"                         //地区
#define USER_SIGNATURE @"Signature"                   //签名
#define USER_TITLE @"Title"                           //职称
#define USER_SESSIONID @"UserId"                      //会话id

/**
 my posts
 */

#define USER_MESSAGE_POSTID @"PostId"                   //帖子id
#define USER_MESSAGE_POSTTITLE @"PostTitle"             //帖子标题
#define USER_MESSGAE_CONTENT @"Content"                 //帖子内容
#define USER_MESSGAE_SUPPORTS @"Supports"               //点赞数
#define USER_MESSGAE_ISCOLLECTION @"IsCollection"       //是否已收藏
#define USER_MESSAGE_REPLYID @"ReplyId"                 //回复id
#define USER_MESSAGE_ISSUPPORT @"IsSupport"             //是否已点赞
#define USER_MESSAGE_ISCOURSE @"IsCourse"               //是否为课程学习
#define USER_MESSAGE_SENDER @"Sender"                 //发送人姓名
#define USER_MESSAGE_SENDERID @"SendId"                 //发送人id
#define USER_MESSAGE_ICONID @"IconId"                   //发送人头像id
#define USER_MESSAGE_POSTTIME @"PostTime"               //发送时间


#endif /* ResponseHead_h */
