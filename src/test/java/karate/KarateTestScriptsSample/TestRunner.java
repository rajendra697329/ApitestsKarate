package karate.KarateTestScriptsSample;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.Results;
import com.intuit.karate.Runner; 
import static org.junit.jupiter.api.Assertions.*; 
import org.junit.jupiter.api.Test; 

public class TestRunner {

	@Karate.Test
	Karate featuresTest() {
		return Karate.run("Getusingqueryparams").relativeTo(getClass());
}
	
	@Karate.Test
	Karate tagsTest() {
		return Karate.run("tagstest").tags("POST").relativeTo(getClass());
}
}
