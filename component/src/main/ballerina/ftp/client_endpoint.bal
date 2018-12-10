// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
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

////////////////////////////
/// FTP Client Endpoint ///
///////////////////////////

# Represents an FTP client that intracts with an FTP server.
public type Client client object {
    private ClientEndpointConfig config;

    # Gets invoked during object initialization.
    #
    # + clientConfig - Configurations for FTP client endpoint
    public function __init(ClientEndpointConfig clientConfig) {
        self.config = clientConfig;
        self.initEndpoint();
    }

    extern function initEndpoint();

    # The `get()` function can be used to retrieve file content from a remote resource.
    #
    # + path - The resource path
    # + return - A ReadableByteChannel that represents the data source to the resource or
    # an `error` if failed to establish communication with the FTP server or read the resource
    public remote extern function get(string path) returns io:ReadableByteChannel|error;

    # The `delete()` function can be used to delete a file from an FTP server.
    #
    # + path - The resource path
    # + return -  An `error` if failed to establish communication with the FTP server
    public remote extern function delete(string path) returns error?;

    # The `put()` function can be used to add a file to an FTP server.
    #
    # + path - The resource path
    # + byteChannel - A ReadableByteChannel that represents the local data source
    # + return - An `error` if failed to establish communication with the FTP server
    public remote extern function put(string path, io:ReadableByteChannel byteChannel) returns error?;

    # The `append()` function can be used to append content to an existing file in an FTP server.
    # A new file is created if the file does not exist.
    #
    # + path - The resource path
    # + byteChannel - A ReadableByteChannel that represents the local data source
    # + return - An `error` if failed to establish communication with the FTP server
    public remote extern function append(string path, io:ReadableByteChannel byteChannel) returns error?;

    # The `mkdir()` function can be used to create a new direcotry in an FTP server.
    #
    # + path - The directory path
    # + return - An `error` if failed to establish communication with the FTP server
    public remote extern function mkdir(string path) returns error?;

    # The `rmdir()` function can be used to delete an empty directory in an FTP server.
    #
    # + path - The directory path
    # + return - An `error` if failed to establish communication with the FTP server
    public remote extern function rmdir(string path) returns error?;

    # The `rename()` function can be used to rename a file or move to a new location within the same FTP server.
    #
    # + origin - The source file location
    # + destination - The destination file location
    # + return - An `error` if failed to establish communication with the FTP server
    public remote extern function rename(string origin, string destination) returns error?;

    # The `size()` function can be used to get the size of a file resource.
    #
    # + path - The resource path
    # + return - The file size in bytes or an `error` if failed to establish communication with the FTP server
    public remote extern function size(string path) returns int|error;

    # The `list()` function can be used to get the file name list in a given folder.
    #
    # + path - The direcotry path
    # + return - An array of file names or an `error` if failed to establish communication with the FTP server
    public remote extern function list(string path) returns string[]|error;

    # The `isDirectory()` function can be used to check if a given resource is a direcotry.
    #
    # + path - The resource path
    # + return - true if given resource is a direcotry or an `error` if failed to establish communication with the FTP server
    public remote extern function isDirectory(string path) returns boolean|error;
};

# Configuration for FTP client endpoint.
#
# + protocol - Supported FTP protocols
# + host - Target service URL
# + port - Port number of the remote service
# + secureSocket - Authenthication options
public type ClientEndpointConfig record {
    Protocol protocol = FTP;
    string host = "";
    int? port = -1;
    SecureSocket? secureSocket = ();
    !...
};
