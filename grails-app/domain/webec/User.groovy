package webec

class User {
    String name
    String lastname

    static constraints = {
        name blank: false
        lastname blank: false
    }
}
