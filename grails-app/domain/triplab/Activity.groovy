package triplab

class Activity {

    String title
    String description
    User author
    String category
    String url

    District district

    static constraints = {
        title(nullable: false)
    }

    String toString() {
        return "${title}"
    }

}
