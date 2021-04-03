component extends="cblivewire.handlers.Component" accessors="true" {

    property name="count" default="0";

    public function increment() {
       this.setCount( this.getCount() + 1 );
    }

    function render() {
        return renderView( "cblivewire/counter" );
    }
}