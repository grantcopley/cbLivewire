component {

    property name="wirebox" inject="wirebox";

    /**
    * Returns the styles to be placed in HTML head
    */
    function getStyles() {
        return fileRead( "../helpers/styles.html" ).trim();
    }

    /**
    * Returns the JS to be placed in HTML body
    */
    function getScripts() {
        return fileRead( "../helpers/scripts.html" ).trim();
    }

    /**
    * Renders a livewire component
    */
    function render( componentName ) {
        var livewireComponent = wirebox.getInstance( componentName );
        return livewireComponent.render();
    }

}