package triplab

class DayController {

    def beforeInterceptor = [ action:this.&checkUser]

    def checkUser() {
        //System.out.print(session.user)
        if(!session.user) {
            // i.e. user not logged in
            redirect(controller:'user',action:'login')
            return false;
        }
    }  

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [dayInstanceList: Day.list(params), dayInstanceTotal: Day.count()]
    }

    def create = {
        def dayInstance = new Day()
        dayInstance.properties = params
        return [dayInstance: dayInstance]
    }

    def save = {
        def dayInstance = new Day(params)
        if (dayInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'day.label', default: 'Day'), dayInstance.id])}"
            redirect(action: "show", id: dayInstance.id)
        }
        else {
            render(view: "create", model: [dayInstance: dayInstance])
        }
    }

    def show = {
        def dayInstance = Day.get(params.id)
        if (!dayInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'day.label', default: 'Day'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dayInstance: dayInstance]
        }
    }

    def edit = {
        def dayInstance = Day.get(params.id)
        if (!dayInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'day.label', default: 'Day'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dayInstance: dayInstance]
        }
    }

    def update = {
        def dayInstance = Day.get(params.id)
        if (dayInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dayInstance.version > version) {
                    
                    dayInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'day.label', default: 'Day')] as Object[], "Another user has updated this Day while you were editing")
                    render(view: "edit", model: [dayInstance: dayInstance])
                    return
                }
            }
            dayInstance.properties = params
            if (!dayInstance.hasErrors() && dayInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'day.label', default: 'Day'), dayInstance.id])}"
                redirect(action: "show", id: dayInstance.id)
            }
            else {
                render(view: "edit", model: [dayInstance: dayInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'day.label', default: 'Day'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dayInstance = Day.get(params.id)
        if (dayInstance) {
            try {
                dayInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'day.label', default: 'Day'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'day.label', default: 'Day'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'day.label', default: 'Day'), params.id])}"
            redirect(action: "list")
        }
    }
}
