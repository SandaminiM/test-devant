import ballerina/log;

# A simple automation with runtime arguments, used to exercise the Test page.
#
# Each parameter of `main` surfaces as a runtime argument on Devant/ICP:
# - `name`     -> required text field (no default value)
# - `greeting` -> optional text field (has a default)
# - `count`    -> optional number field (has a default)
#
# Note: this Ballerina distribution accepts only string/int/float/decimal as
# `main` operands; boolean and enum/named types are rejected by the compiler,
# so a Ballerina automation's Test form shows text/number fields.
#
# + name - Name to greet (required)
# + greeting - Greeting word to use
# + count - Number of times to repeat the greeting
# + return - An `error` if the run fails, otherwise `()`
public function main(string name, string greeting = "Hello", int count = 1) returns error? {
    do {
        int i = 1;
        while i <= count {
            log:printInfo(string `${greeting}, ${name}! (#${i})`);
            i += 1;
        }
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
