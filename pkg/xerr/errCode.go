package xerr

//成功返回
const OK uint32 = 200

/**(前3位代表业务,后三位代表具体功能)**/

//全局错误码
const ServerCommonError uint32 = 1001
const ReuqestParamError uint32 = 1002
const TokenExpireError uint32 = 1003
const TokenGenerateError uint32 = 1004
const DbError uint32 = 1005
const DbUpdateAffectedZeroError uint32 = 1006

//用户服务

//订单服务

//商品服务

//支付服务
