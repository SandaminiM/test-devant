import ballerina/http;
import ballerina/log;
import ballerina/observe;
import ballerina/otel as _;

# The site the automation reads; the HTTP client call is traced as a span of its own.
configurable string targetUrl = "https://jsonplaceholder.typicode.com";

# An automation that publishes traces through ballerina/otel. Each run opens a
# root span, fetches a post inside a child span, and logs its title.
#
# + postId - The post to fetch
# + return - An `error` if the run fails, otherwise `()`
public function main(int postId = 1) returns error? {
    // Spans are opened only while tracing is on: with it off there is no root span to parent them.
    boolean traced = observe:isTracingEnabled();
    int runSpan = traced ? observe:startRootSpan("otel-automation-run", {"postId": postId.toString()}) : -1;
    string|error title = fetchTitle(postId, runSpan);
    if traced {
        check observe:finishSpan(runSpan);
    }
    if title is error {
        log:printError("The run failed", 'error = title);
        return title;
    }
    log:printInfo("Fetched the post", postId = postId, title = title);
}

function fetchTitle(int postId, int parentSpan) returns string|error {
    int? span = parentSpan == -1 ? () : check observe:startSpan("fetch-post", {"postId": postId.toString()}, parentSpan);
    http:Client posts = check new (targetUrl);
    record {string title;}|error post = posts->get(string `/posts/${postId}`);
    if span is int {
        check observe:finishSpan(span);
    }
    if post is error {
        return post;
    }
    return post.title;
}
