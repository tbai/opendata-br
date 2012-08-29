modules = {
    application {
        resource url:'js/application.js'
    }

    base {
        resource url:'yaml/core/base.min.css'
    }

    jit {
        dependsOn "jquery"
        resource "Jit/jit-yc.js"
    }
}