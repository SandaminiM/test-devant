import ballerina/io;
import ballerina/log;

public function main() returns error? {
    do {
        io:println("Hello Sandamini");
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
