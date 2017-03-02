public class AnimalLocator {
	
	//Get Animal Name By Id
	public static String getAnimalNameById(Integer pId) {
		Http http = new Http();
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + pId);
        
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        Map<String, Object> animal = (Map<String, Object>) results.get('animal');
        return (String)animal.get('name');
	}

	public class Animal {
		public Integer id;
		public String name;
		public String eats;
		public String says;

		public Animal(Integer id, String name, String eats, String says) {
			this.id = id;
			this.name = name;
			this.eats = eats;
			this.says = says;
		}
	}
}