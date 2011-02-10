package triplab

class Trip {

    String name
    Date startDate
    Date endDate

    static constraints = {
    }

    String toString() {
        return "${name}"
    }

}
