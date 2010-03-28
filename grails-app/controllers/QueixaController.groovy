class QueixaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [queixaInstanceList: Queixa.list(params), queixaInstanceTotal: Queixa.count()]
    }

    def create = {
        def queixaInstance = new Queixa()
        queixaInstance.properties = params
        return [queixaInstance: queixaInstance]
    }

    def save = {
        def queixaInstance = new Queixa(params)
        if (queixaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'queixa.label', default: 'Queixa'), queixaInstance.id])}"
            redirect(action: "show", id: queixaInstance.id)
        }
        else {
            render(view: "create", model: [queixaInstance: queixaInstance])
        }
    }

    def show = {
        def queixaInstance = Queixa.get(params.id)
        if (!queixaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'queixa.label', default: 'Queixa'), params.id])}"
            redirect(action: "list")
        }
        else {
            [queixaInstance: queixaInstance]
        }
    }

    def edit = {
        def queixaInstance = Queixa.get(params.id)
        if (!queixaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'queixa.label', default: 'Queixa'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [queixaInstance: queixaInstance]
        }
    }

    def update = {
        def queixaInstance = Queixa.get(params.id)
        if (queixaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (queixaInstance.version > version) {
                    
                    queixaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'queixa.label', default: 'Queixa')] as Object[], "Another user has updated this Queixa while you were editing")
                    render(view: "edit", model: [queixaInstance: queixaInstance])
                    return
                }
            }
            queixaInstance.properties = params
            if (!queixaInstance.hasErrors() && queixaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'queixa.label', default: 'Queixa'), queixaInstance.id])}"
                redirect(action: "show", id: queixaInstance.id)
            }
            else {
                render(view: "edit", model: [queixaInstance: queixaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'queixa.label', default: 'Queixa'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def queixaInstance = Queixa.get(params.id)
        if (queixaInstance) {
            try {
                queixaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'queixa.label', default: 'Queixa'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'queixa.label', default: 'Queixa'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'queixa.label', default: 'Queixa'), params.id])}"
            redirect(action: "list")
        }
    }
}
