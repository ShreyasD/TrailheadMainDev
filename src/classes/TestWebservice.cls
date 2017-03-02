global class TestWebservice {

	webservice String parameter { get; set; }

	public TestWebservice() {
		this.parameter = 'value';
	}

	webservice static String serviceName(){
		return '';
	}
}