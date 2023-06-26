package org.kosta.semiproject.test.store.v1;

public class TestDistance {

	public static void main(String[] args) {
		String distance = "863.2849";
		double distance2 = Double.parseDouble(distance);
		System.out.println(distance2/1000);
		
		double distance3 = distance2/1000;
		
		double distance4 = Math.round(distance3*10)/10.0;
		System.out.println(distance4);
	}

}		
