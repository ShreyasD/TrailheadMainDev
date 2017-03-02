public with sharing class StringArrayTest {
	public static String[] generateStringArray(Integer size) {
		List<String> stringArray = new List<String>();
		for(Integer i=0; i < size; i++) {
			stringArray.add('Test ' + i);
		}
		return stringArray;
	}
}