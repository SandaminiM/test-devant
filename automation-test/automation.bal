import ballerina/log;

# An automation whose runtime arguments exercise every field type a Ballerina
# `main` can surface on the Devant/ICP Test page:
# - `name`      -> text field       (string)
# - `retries`   -> number field     (int; whole numbers only)
# - `threshold` -> number field     (float; accepts a decimal point)
# - `budget`    -> number field     (decimal; accepts a decimal point)
# - `tags`      -> multi-text field  (rest parameter -> repeatable string)
#
# A REST parameter cannot be combined with defaultable parameters, so every
# fixed parameter here is required. boolean and enum are rejected as `main` operands
# by the compiler, so dropdown/checkbox fields are not achievable from Ballerina —
# they only appear for image/Docker automations that declare CLI args manually.
#
# + name - Name to greet (required)
# + retries - Number of retries (whole number)
# + threshold - Threshold ratio (accepts decimals)
# + budget - Budget amount (accepts decimals)
# + tags - Zero or more free-form tags
# + return - An `error` if the run fails, otherwise `()`
public function main(string name, int retries, float threshold, decimal budget, string... tags) returns error? {
    do {
        log:printInfo(string `Running for ${name}: retries=${retries}, threshold=${threshold}, budget=${budget}`);
        if tags.length() > 0 {
            log:printInfo(string `Tags: ${tags.toString()}`);
        }
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
