package triplab

class DayActivityController {

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
        [dayActivityInstanceList: DayActivity.list(params), dayActivityInstanceTotal: DayActivity.count()]
    }

    def create = {
        def dayActivityInstance = new DayActivity()
        dayActivityInstance.properties = params
        return [dayActivityInstance: dayActivityInstance]
    }

    def save = {
        def dayActivityInstance = new DayActivity(params)
        if (dayActivityInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dayActivity.label', default: 'DayActivity'), dayActivityInstance.id])}"
            redirect(action: "show", id: dayActivityInstance.id)
        }
        else {
            render(view: "create", model: [dayActivityInstance: dayActivityInstance])
        }
    }

    def show = {
        def dayActivityInstance = DayActivity.get(params.id)
        if (!dayActivityInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dayActivity.label', default: 'DayActivity'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dayActivityInstance: dayActivityInstance]
        }
    }

    def edit = {
        def dayActivityInstance = DayActivity.get(params.id)
        if (!dayActivityInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dayActivity.label', default: 'DayActivity'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dayActivityInstance: dayActivityInstance]
        }
    }

    def update = {
        def dayActivityInstance = DayActivity.get(params.id)
        if (dayActivityInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dayActivityInstance.version > version) {
                    
                    dayActivityInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dayActivity.label', default: 'DayActivity')] as Object[], "Another user has updated this DayActivity while you were editing")
                    render(view: "edit", model: [dayActivityInstance: dayActivityInstance])
                    return
                }
            }
            dayActivityInstance.properties = params
            if (!dayActivityInstance.hasErrors() && dayActivityInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dayActivity.label', default: 'DayActivity'), dayActivityInstance.id])}"
                redirect(action: "show", id: dayActivityInstance.id)
            }
            else {
                render(view: "edit", model: [dayActivityInstance: dayActivityInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dayActivity.label', default: 'DayActivity'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dayActivityInstance = DayActivity.get(params.id)
        if (dayActivityInstance) {
            try {
                dayActivityInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dayActivity.label', default: 'DayActivity'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dayActivity.label', default: 'DayActivity'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dayActivity.label', default: 'DayActivity'), params.id])}"
            redirect(action: "list")
        }
    }
}
