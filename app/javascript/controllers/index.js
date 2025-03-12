// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import { AbymeController } from 'abyme';
application.register('abyme', AbymeController);

import HideFormController from "./hide_form.js"
application.register("visibility", HideFormController)
