import triplab.*

class BootStrap {

    def init = { servletContext ->
        new User(email:"aaron@goingafk.com",pass:"gafk6030").save()
    }
    def destroy = {
    }
}