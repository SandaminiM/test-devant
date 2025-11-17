import ballerina/http;

service / on new http:Listener(8000) {

    // GET /hello
    resource function get hello() returns json {
        return { message: "Hello from my test API!" };
    }

    // GET /greet/{name}
    resource function get greet(string name) returns json {
        return { message: "Hello, " + name + "! Welcome to Devant testing." };
    }
}
