  component {

    this.name = "cbWire";
    this.version = "1.0.0";
    this.author = "Grant Copley";
    this.webUrl = "https://github.com/grantcopley/cbWire";
    this.dependencies = [];
    this.entryPoint = "/livewire";

    function configure() {
        settings = {
            "register": {
                "interceptor": true,
                "helper": true,
                "controllerMethods": true
            },
            "defaultViewArgs": { "view": "main/index", "module": "cbbolt" },
            "version": function() {
                return "";
            }
        };
    }

    function onLoad() {
        if ( settings.register.interceptor ) {
            controller
                .getInterceptorService()
                .registerInterceptor(
                    interceptorName = "LivewireLifecycleInterceptor",
                    interceptorClass = "#moduleMapping#.interceptors.BoltLifecycle"
                );
        }

        if ( settings.register.helper ) {
            var helpers = controller.getSetting( "applicationHelper" );
            arrayAppend( helpers, "#moduleMapping#/helpers/Livewire.cfm" );
            controller.setSetting( "applicationHelper", helpers );
        }

        if ( settings.register.controllerMethods ) {
            if (
                controller.getSetting(
                    name = "controllerDecorator",
                    defaultValue = ""
                ) != ""
            ) {
                throw(
                    "Cannot auto-register the `BoltControllerDecorator` when a `controllerDecorator` is already set."
                );
            }
            controller.setSetting(
                "controllerDecorator",
                "#moduleMapping#.models.BoltControllerDecorator"
            );
            controller.getLoaderService().createControllerDecorator();
        }
    }

    function onUnload() {
        if ( settings.register.helper ) {
            controller.setSetting(
                "applicationHelper",
                arrayFilter( controller.getSetting( "applicationHelper" ), function( helper ) {
                    return helper != "#moduleMapping#/helpers/Livewire.cfm";
                } )
            );
        }

        if ( settings.register.interceptor ) {
            controller
                .getInterceptorService()
                .unregister( interceptorName = "LivewireLifecycleInterceptor" );
        }

        if ( settings.register.controllerMethods ) {
            controller.setSetting( "controllerDecorator", "" );
        }
    }

}
