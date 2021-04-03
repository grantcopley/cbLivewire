component {

    function index( event, rc, prc ) {
        prc.welcomeMessage = "whatever";
        event.setView( view = "welcome/index" );
    }

}
