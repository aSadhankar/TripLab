package triplab

class ActivityController {

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
        [activityInstanceList: Activity.list(params), activityInstanceTotal: Activity.count()]
    }

    def create = {
        def activityInstance = new Activity()
        activityInstance.properties = params
        activityInstance.author = session.user
        return [activityInstance: activityInstance]
    }

    def save = {
        def activityInstance = new Activity(params)
        if (activityInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'activity.label', default: 'Activity'), activityInstance.id])}"
            redirect(action: "show", id: activityInstance.id)
        }
        else {
            render(view: "create", model: [activityInstance: activityInstance])
        }
    }

    def show = {
        def activityInstance = Activity.get(params.id)
        if (!activityInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])}"
            redirect(action: "list")
        }
        else {
            [activityInstance: activityInstance]
        }
    }

    def edit = {
        def activityInstance = Activity.get(params.id)
        if (!activityInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [activityInstance: activityInstance]
        }
    }

    def update = {
        def activityInstance = Activity.get(params.id)
        if (activityInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (activityInstance.version > version) {
                    
                    activityInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'activity.label', default: 'Activity')] as Object[], "Another user has updated this Activity while you were editing")
                    render(view: "edit", model: [activityInstance: activityInstance])
                    return
                }
            }
            activityInstance.properties = params
            if (!activityInstance.hasErrors() && activityInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'activity.label', default: 'Activity'), activityInstance.id])}"
                redirect(action: "show", id: activityInstance.id)
            }
            else {
                render(view: "edit", model: [activityInstance: activityInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def activityInstance = Activity.get(params.id)
        if (activityInstance) {
            try {
                activityInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), params.id])}"
            redirect(action: "list")
        }
    }
}
