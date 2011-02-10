package triplab

class Rating {

    User user
    Activity activity
    Integer vote

    static constraints = {
        vote(min: 1, max: 10)
    }
}
