// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.    

# Defines the common error type for the module.
public type Error distinct error;

isolated function createError(string|error|Error errorOrMessage) returns Error {
    if errorOrMessage is Error {
        // input is a ASB 'error' value
        return errorOrMessage;
    } else if errorOrMessage is error {
        // input is a Ballerina 'error' value
        return error Error(errorOrMessage.message(), detail = errorOrMessage.detail(), cause = errorOrMessage.cause());
    } else {
        // input is the error message
        return error Error(errorOrMessage);
    }
}
