package triplab

class DayActivity {

    DayDistrict dayDistrict
    Activity activity
    Integer priority

    static constraints = {
        priority(min: 1, max: 10)
    }
}
