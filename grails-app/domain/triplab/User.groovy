package triplab

class User {

    static hasMany = [rating:Rating, activity:Activity]

    String email
    String pass

    String toString()
        { "$email" }

    static constraints = {
        email(email:true)
        pass(blank:false, pass:true)
    }
}
