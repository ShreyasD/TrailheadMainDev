@isTest
public class AnimalLocatorMock implements HttpCalloutMock {

    protected AnimalLocator.Animal animalInstance;

    public AnimalLocatorMock() {
        Integer id = 12345;
        String name = 'Horse';
        String eats = 'Hay';
        String says = 'Neigh';
        animalInstance = new AnimalLocator.Animal(12345, 'Horse', 'Hay', 'Neigh');
    }

    public AnimalLocatorMock(String eats, Integer id, String name, String says) {
        animalInstance = new AnimalLocator.Animal(id, name, eats, says);
    }

    // Implement this interface method
    public HTTPResponse respond(HTTPRequest request) {
        String body = '{"animal":' + JSON.serialize(animalInstance) + '}';

        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody(body);
        response.setStatusCode(200);
        return response; 
    }

}