component {

    this.name = "cbLivewire";
    this.version = "1.0.0";
    this.author = "Grant Copley";
    this.webUrl = "https://github.com/grantcopley/cbLivewire";
    this.dependencies = [];
    this.entryPoint = "livewire";
    this.layoutParentLookup = false;
    this.viewParentLookup = false;
    this.cfmapping = "cbLivewire";
	this.applicationHelper = [
		"helpers/helpers.cfm"
	];


    function configure() {
        routes = [
            { pattern = "message/:livewireComponent", handler = "Livewire", action = "handleRequest" },
            { pattern = "welcome/index", handler = "Welcome", action = "index" }
        ];
    }

}
