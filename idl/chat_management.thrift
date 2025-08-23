namespace go coach.chat.manageservice

include "common_base.thrift"

struct ChatItem {
    1: i64 id;
    2: string session_id;  // 改为session_id
    3: string role;
    4: string content;
    5: string message_id;  // 新增：唯一标识每个对话内容
    6: optional list<string> file_ids;  // 新增：绑定的文件ID列表
    7: optional string object_id; // 新增：关联的聊天对象ID
    8: optional string title; // 新增：会话标题
}

struct ChatObject {
    1: string id;
    2: string name;
    3: string avatar;
    4: string position;
    5: string relation;
    6: optional string core_needs;
    7: optional string personality;
    8: optional list<string> tags;
    9: required string userId;
    10: bool has_history;
}

// cos桶文件链接
struct FileItem {
    1: string file_id
    2: string file_url
    3: string file_name
    4: string file_type
    5: i64 file_size
}

// 获取聊天对象列表请求
struct GetChatObjectListReq {
    1: required string user_id
}

// 获取聊天对象列表响应
struct GetChatObjectListResp {
    1: list<ChatObject> chat_object_list
    255: common_base.BaseResp baseResp
}

// 获取聊天内容列表请求
struct GetChatListByIdReq {
    1: required string session_id  // 改为session_id
}

// 获取聊天内容列表响应
struct GetChatListByIdResp {
    1: list<ChatItem> chat_list
    255: common_base.BaseResp baseResp
}

// 新增聊天内容响应
struct CreateChatItemRsp {
    1: string session_id;  // 改为session_id
    2: string message_id;  // 新增：返回生成的message_id
    255: common_base.BaseResp baseResp
}

// 会话数据结构
struct ChatSessionDTO {
    1: i64 id
    2: string session_id
    3: string title
    4: string status
    5: string created_at
    6: string updated_at
}

// 创建会话请求
struct CreateChatSessionReq {
    1: required string title
    2: required string object_id
    3: optional string persona_name
    4: optional string goal
    5: optional string user_query
    6: optional string personality
    7: optional string relationship
    8: optional list<string> file_ids
}

// 创建会话响应
struct CreateChatSessionResp {
    1: string session_id
    2: string title
    3: string object_id
    4: string created_at
    255: common_base.BaseResp baseResp
}

// 获取会话列表请求/响应
struct GetChatSessionListReq {
    1: optional string object_id
}

struct GetChatSessionListResp {
    1: list<ChatSessionDTO> sessions
    255: common_base.BaseResp baseResp
}

// 上传文件请求(文件流形式上传)
struct UploadFileReq {
    1: required binary file_data
    2: required string file_name
    3: required string file_type
}

// 上传文件响应
struct UploadFileResp {
    1: string file_id
    255: common_base.BaseResp baseResp
}

// 获取文件列表请求
struct GetFileListByMessageIdReq {
    1: required string message_id
}

// 获取文件列表响应
struct GetFileListByMessageIdResp {
    1: list<FileItem> file_list
    255: common_base.BaseResp baseResp
}

// 删除聊天对象请求
struct DeleteChatObjectReq {
    1: required string id;
    2: required string user_id;
}

// 删除聊天对象响应
struct DeleteChatObjectResp {
    1: bool success
    255: common_base.BaseResp baseResp
}


service ChatManagementService {
    // 获取聊天对象列表
    GetChatObjectListResp GetChatObjectList(1: GetChatObjectListReq req)
    // 新增（编辑）聊天对象
    common_base.BaseResp EditChatObject(1: ChatObject req)
    // 获取聊天内容列表
    GetChatListByIdResp GetChatListById(1: GetChatListByIdReq req)
    // 新增聊天内容
    CreateChatItemRsp CreateChatItem(1: ChatItem req)
    // 创建新会话
    CreateChatSessionResp CreateChatSession(1: CreateChatSessionReq req)
    // 上传文件（图片、文档）
    UploadFileResp UploadFile(1: UploadFileReq req)
    // 获取文件列表
    GetFileListByMessageIdResp GetFileListByMessageId(1: GetFileListByMessageIdReq req)
    // 删除聊天对象
    DeleteChatObjectResp DeleteChatObject(1: DeleteChatObjectReq req)
    // 获取会话列表
    GetChatSessionListResp GetChatSessionList(1: GetChatSessionListReq req)
}
