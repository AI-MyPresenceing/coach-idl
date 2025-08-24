namespace go coach.basic.manageservice

include "common_base.thrift"

// 用户结构
struct User {
    1: string userId
    2: string nickname
    3: string phone
    4: string position
    5: string industry
    6: i32 status
    7: optional string teamRole
}

// 积分交易记录结构
struct PointsTransaction {
    1: string transactionId
    2: string userId
    3: i32 type
    4: i64 amount
    5: i64 balance
    6: string description
    7: i32 status
    8: i64 createdAt
}

// 用户注册请求
struct RegisterUserReq {
    1: required string nickname
    2: required string phone
    3: optional string position
    4: optional string industry
    5: optional string teamRole
}

// 用户注册响应
struct RegisterUserResp {
    1: string userId
    255: common_base.BaseResp baseResp
}

// 获取用户信息请求
struct GetUserByIDReq {
    1: required string userId
}

// 获取用户信息响应
struct GetUserByIDResp {
    1: User user
    255: common_base.BaseResp baseResp
}

// 更新用户信息请求
struct UpdateUserReq {
    1: required string userId
    2: optional string nickname
    3: optional string position
    4: optional string industry
    5: optional string teamRole
}

// 获取积分余额请求
struct GetPointsBalanceReq {
    1: required string userId
}

// 获取积分余额响应
struct GetPointsBalanceResp {
    1: i64 balance
    255: common_base.BaseResp baseResp
}

// 下发积分请求
struct GrantPointsReq {
    1: required string userId
    2: required i64 amount
    3: optional string description
}

// 扣减积分请求
struct DeductPointsReq {
    1: required string userId
    2: required i64 amount
    3: optional string description
}

// 获取积分交易历史请求
struct GetTransactionHistoryReq {
    1: required string userId
    2: optional i32 page = 1
    3: optional i32 size = 10
}

// 获取积分交易历史响应
struct GetTransactionHistoryResp {
    1: list<PointsTransaction> transactions
    2: i32 total
    255: common_base.BaseResp baseResp
}

// 手机号登录或注册请求
struct LoginOrRegisterByPhoneReq {
    1: required string phone
    2: optional string nickname
    3: optional string teamRole
}

// 手机号登录或注册响应
struct LoginOrRegisterByPhoneResp {
    1: User user
    2: string token
    3: bool isNewUser  // 是否为新用户（注册）
    255: common_base.BaseResp baseResp
}

// 根据手机号获取用户请求
struct GetUserByPhoneReq {
    1: required string phone
}

// 根据手机号获取用户响应
struct GetUserByPhoneResp {
    1: User user
    255: common_base.BaseResp baseResp
}

// 基础管理服务接口
service BasicManagementService {
    // 用户注册
    RegisterUserResp RegisterUser(1: RegisterUserReq req)
    
    // 获取用户信息
    GetUserByIDResp GetUserByID(1: GetUserByIDReq req)
    
    // 更新用户信息
    common_base.BaseResp UpdateUser(1: UpdateUserReq req)
    
    // 手机号登录或注册
    LoginOrRegisterByPhoneResp LoginOrRegisterByPhone(1: LoginOrRegisterByPhoneReq req)
    
    // 根据手机号获取用户
    GetUserByPhoneResp GetUserByPhone(1: GetUserByPhoneReq req)
    
    // 获取积分余额
    GetPointsBalanceResp GetPointsBalance(1: GetPointsBalanceReq req)
    
    // 下发积分
    common_base.BaseResp GrantPoints(1: GrantPointsReq req)
    
    // 扣减积分
    common_base.BaseResp DeductPoints(1: DeductPointsReq req)
    
    // 获取积分交易历史
    GetTransactionHistoryResp GetTransactionHistory(1: GetTransactionHistoryReq req)
}
