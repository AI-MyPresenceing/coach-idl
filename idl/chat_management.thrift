namespace go coach.chat.manageservice

include "base.thrift"

struct ChatItem {
    1: i64 id;
    2: string chat_id;
    3: string role;
    4: string content;
}

struct ChatObject {
    1: i64 id;
    2: string name;
    3: string avatar;
    4: string position;
    5: string relation;
}

// cos桶文件链接
struct FileItem {
    1: string file_id
    2: string file_url
    3: string file_name
    4: string file_type
}

// 获取聊天对象列表请求
struct GetChatObjectListReq {
    1: required string user_id
}

// 获取聊天对象列表响应
struct GetChatObjectListResp {
    1: list<ChatObject> chat_object_list
    255: base.BaseResp baseResp
}

// 获取聊天内容列表请求
struct GetChatListByIdReq {
    1: required string chat_id
}

// 获取聊天内容列表响应
struct GetChatListByIdResp {
    1: list<ChatItem> chat_list
    255: base.BaseResp baseResp
}

// 新增聊天内容响应
struct CreateChatItemRsp {
    1: string chat_id;
    255: base.BaseResp baseResp
}

// 上传文件请求(文件流形式上传)
struct UploadFileReq {
    1: required string message_id
    2: required binary file_data
    3: required string file_name
    4: required string file_type
}

// 上传文件响应
struct UploadFileResp {
    1: string file_id
    255: base.BaseResp baseResp
}

// 获取文件列表请求
struct GetFileListByMessageIdReq {
    1: required string message_id
}

// 获取文件列表响应
struct GetFileListByMessageIdResp {
    1: list<FileItem> file_list
    255: base.BaseResp baseResp
}


service ChatManagementService {
    // 获取聊天对象列表
    GetChatObjectListResp GetChatObjectList(1: GetChatObjectListReq req)
    // 新增（编辑）聊天对象
    base.BaseResp EditChatObject(1: ChatObject req)
    // 获取聊天内容列表
    GetChatListByIdResp GetChatListById(1: GetChatListByIdReq req)
    // 新增聊天内容
    CreateChatItemRsp CreateChatItem(1: ChatItem req)
    // 上传文件（图片、文档）
    UploadFileResp UploadFile(1: UploadFileReq req)
    // 获取文件列表
    GetFileListByMessageIdResp GetFileListByMessageId(1: GetFileListByMessageIdReq req)
}