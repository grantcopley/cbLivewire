component {

    property name="wirebox" inject="wirebox";

    /**
    * Returns the styles to be placed in HTML head
    */
    function getStyles( event, rc, prc ) {
        return fileRead( expandPath("../helpers/styles.html") ).trim();
    }

    /**
    * Returns the JS to be placed in HTML body
    */
    function getScripts( event, rc, prc ) {
        return fileRead( expandPath("../helpers/scripts.html") ).trim();
    }

    /**
    * Renders a livewire component
    */
    function render( componentName ) {
        var livewireComponent = wirebox.getInstance( "handlers.cblivewire.#componentName#" );
        return livewireComponent.render();
    }

    function handleRequest( event, rc, prc ) {
        var livewireComponent = wirebox.getInstance( rc.livewireComponent );
        livewireComponent.hydrate( rc );
        return livewireComponent.getSubsequentPayload();
    }

}