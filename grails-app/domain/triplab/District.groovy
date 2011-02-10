package triplab

class District {

    String name
    String url

    static constraints = {
        name(nullable: false)
    }

    String toString() {
        return "${name}"
    }
}
