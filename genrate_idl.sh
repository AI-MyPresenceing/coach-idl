#!/bin/bash

# 生成common_base的代码
kitex -module github.com/AI-MyPresenceing/coach-idl idl/common_base.thrift

# 生成basic_management的代码
kitex -module github.com/AI-MyPresenceing/coach-idl idl/basic_management.thrift

# 生成chat_management的代码
kitex -module github.com/AI-MyPresenceing/coach-idl idl/chat_management.thrift

echo "所有IDL代码生成完成"
