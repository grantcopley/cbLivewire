component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function run() {
        describe( "Bolt", function() {
            describe( "Tests run", function() {
                it( "passes", function() {
                    expect( true ).toBeTrue();
                } );
            } );
        } );
    }

}
