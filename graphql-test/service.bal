import ballerina/graphql;

# A user in the system.
public type User record {|
    # Unique identifier.
    int id;
    # Display name.
    string name;
    # Email address.
    string email;
|};

# Fields required to create a new user.
public type NewUser record {|
    # Display name.
    string name;
    # Email address.
    string email;
|};

listener graphql:Listener graphqlListener = new (9090);

service /graphql on graphqlListener {

    # A simple greeting.
    # + return - a greeting string
    resource function get greeting() returns string {
        return "Hello, GraphQL!";
    }

    # Fetch a user profile by id.
    # + id - the user id to look up
    # + return - the matching user
    resource function get profile(int id) returns User {
        return {id, name: "Ada Lovelace", email: "ada@example.com"};
    }

    # Create a new user.
    # + user - the details of the user to create
    # + return - the created user
    remote function addUser(NewUser user) returns User {
        return {id: 42, name: user.name, email: user.email};
    }
}
