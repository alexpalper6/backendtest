package app.teralco.testing.backendtest.runners.petstore.put;

import com.privalia.qa.utils.BaseGTest;
import io.cucumber.testng.CucumberOptions;


/**
 * This is the runner class responsible of running the included *.feature files in the project.
 * Glue files can be specified in the {@link CucumberOptions} annotation
 *
 * Here you can also create your own TestNG hooks or even configure parallel tests execution.
 * For more info on these topics check:
 * https://testng.org/doc/documentation-main.html#annotations
 * https://cucumber.io/docs/guides/parallel-execution/#testng
 */
@CucumberOptions(plugin = {
                "json:target/UpdatePetIT.json",
                "html:target/UpdatePetIT.html",
                "junit:target/UpdatePetIT.xml"
        }, features =
        {
                "src/test/resources/features/petstore/put/update_pet.feature"
        },
        glue = "classpath:app.teralco.testing.backendtest.glue")
public class UpdatePetIT extends BaseGTest {


}
