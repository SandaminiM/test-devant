import ballerina/log;

public function main() returns error? {
    do {
        log:printInfo("This is test log [sandamini]");
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
