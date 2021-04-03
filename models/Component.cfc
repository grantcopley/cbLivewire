component {

    property name="wirebox" inject="wirebox";

    function getId() {
        return createUUID().replace( "-", "", "all" ).left( 21 );
    }

    function getInitialData() {
        return {
            "fingerprint": {
                "id": "#getID()#",
                "name": "counter",
                "locale": "en",
                "path": "/",
                "method": "GET"
            },
            "effects": {
                "listeners": []
            },
            "serverMemo": {
                "children": [],
                "errors": [],
                "htmlHash": "ac82b577",
                "data": {
                    "count": 0
                },
                "dataMeta": [],
                "checksum": "2731fee42e720ea86ae36f5f076eca0943c885857c098a55592662729341e9cb"
            }
        };
    }

    function renderView() {
        var renderer = wirebox.getInstance( "Renderer@coldbox" );
        // Pass the properties of the Livewire component as variables to the view
        arguments.args = getMetaData( this ).properties.reduce( function ( agg, prop ){
            agg[ prop.name ] = this[ "get" & prop.name ]();
            return agg;
        }, {} );

        var rendering = renderer.renderView( argumentCollection=arguments );

        // Add livewire properties to top element to make livewire actually work
        // We will need to make this work with more than just <div>s of course
        rendering = rendering.replaceNoCase( "<div ", "<div wire:id=""#getId()#"" wire:initial-data=""#serializeJson( getInitialData() ).replace('"', '&quot;', 'all')#"" ", "once" );

        return rendering;
    }    

}