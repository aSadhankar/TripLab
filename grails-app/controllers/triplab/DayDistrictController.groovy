package triplab

class DayDistrictController {

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
        [dayDistrictInstanceList: DayDistrict.list(params), dayDistrictInstanceTotal: DayDistrict.count()]
    }

    def create = {
        def dayDistrictInstance = new DayDistrict()
        dayDistrictInstance.properties = params
        return [dayDistrictInstance: dayDistrictInstance]
    }

    def save = {
        def dayDistrictInstance = new DayDistrict(params)
        if (dayDistrictInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dayDistrict.label', default: 'DayDistrict'), dayDistrictInstance.id])}"
            redirect(action: "show", id: dayDistrictInstance.id)
        }
        else {
            render(view: "create", model: [dayDistrictInstance: dayDistrictInstance])
        }
    }

    def show = {
        def dayDistrictInstance = DayDistrict.get(params.id)
        if (!dayDistrictInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dayDistrict.label', default: 'DayDistrict'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dayDistrictInstance: dayDistrictInstance]
        }
    }

    def edit = {
        def dayDistrictInstance = DayDistrict.get(params.id)
        if (!dayDistrictInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dayDistrict.label', default: 'DayDistrict'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dayDistrictInstance: dayDistrictInstance]
        }
    }

    def update = {
        def dayDistrictInstance = DayDistrict.get(params.id)
        if (dayDistrictInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dayDistrictInstance.version > version) {
                    
                    dayDistrictInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dayDistrict.label', default: 'DayDistrict')] as Object[], "Another user has updated this DayDistrict while you were editing")
                    render(view: "edit", model: [dayDistrictInstance: dayDistrictInstance])
                    return
                }
            }
            dayDistrictInstance.properties = params
            if (!dayDistrictInstance.hasErrors() && dayDistrictInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dayDistrict.label', default: 'DayDistrict'), dayDistrictInstance.id])}"
                redirect(action: "show", id: dayDistrictInstance.id)
            }
            else {
                render(view: "edit", model: [dayDistrictInstance: dayDistrictInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dayDistrict.label', default: 'DayDistrict'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dayDistrictInstance = DayDistrict.get(params.id)
        if (dayDistrictInstance) {
            try {
                dayDistrictInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dayDistrict.label', default: 'DayDistrict'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dayDistrict.label', default: 'DayDistrict'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dayDistrict.label', default: 'DayDistrict'), params.id])}"
            redirect(action: "list")
        }
    }
}
