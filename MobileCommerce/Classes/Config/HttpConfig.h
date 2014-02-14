//
//  HttpConfig.h
//  MobileCommerce
//
//  Created by 谢家欣 on 14-2-12.
//  Copyright (c) 2014年 谢家欣. All rights reserved.
//

#define APIBase @"http://api.6q.cn/"




#define RET_CODE @"rt"
#define RET_DATA @"data"


#define ERROR 0
#define SUCCESS 1
#define ParamsMissing 10000
#define SDKERROR 10008
#define Username_is_Exist 12001
#define Username_OR_Password_Error 12003
#define Oldpassword_Is_Not_Correct 12004



#define UserErrorDomain @"org.basechem.user"

typedef enum {
    kParamsMissing = -10000,
    kSDKError,
} SystemError;

typedef enum {
    kUserNameIsExist = -12001,
    kUserNameOrPasswdError,
    kOldPasswdIsNotCorrect,
} UserActrionError;