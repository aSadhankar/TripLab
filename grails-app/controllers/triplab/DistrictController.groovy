package triplab

class DistrictController {

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
        [districtInstanceList: District.list(params), districtInstanceTotal: District.count()]
    }

    def create = {
        def districtInstance = new District()
        districtInstance.properties = params
        return [districtInstance: districtInstance]
    }

    def save = {
        def districtInstance = new District(params)
        if (districtInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'district.label', default: 'District'), districtInstance.id])}"
            redirect(action: "show", id: districtInstance.id)
        }
        else {
            render(view: "create", model: [districtInstance: districtInstance])
        }
    }

    def show = {
        def districtInstance = District.get(params.id)
        if (!districtInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'district.label', default: 'District'), params.id])}"
            redirect(action: "list")
        }
        else {
            [districtInstance: districtInstance]
        }
    }

    def edit = {
        def districtInstance = District.get(params.id)
        if (!districtInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'district.label', default: 'District'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [districtInstance: districtInstance]
        }
    }

    def update = {
        def districtInstance = District.get(params.id)
        if (districtInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (districtInstance.version > version) {
                    
                    districtInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'district.label', default: 'District')] as Object[], "Another user has updated this District while you were editing")
                    render(view: "edit", model: [districtInstance: districtInstance])
                    return
                }
            }
            districtInstance.properties = params
            if (!districtInstance.hasErrors() && districtInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'district.label', default: 'District'), districtInstance.id])}"
                redirect(action: "show", id: districtInstance.id)
            }
            else {
                render(view: "edit", model: [districtInstance: districtInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'district.label', default: 'District'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def districtInstance = District.get(params.id)
        if (districtInstance) {
            try {
                districtInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'district.label', default: 'District'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'district.label', default: 'District'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'district.label', default: 'District'), params.id])}"
            redirect(action: "list")
        }
    }
}
