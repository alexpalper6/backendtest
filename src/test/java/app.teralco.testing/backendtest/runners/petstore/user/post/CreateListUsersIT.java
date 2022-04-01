package app.teralco.testing.backendtest.runners.petstore.user.post;

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
                "json:target/CreateListUsersIT.json",
                "html:target/CreateListUsersIT.html",
                "junit:target/CreateListUsersT.xml"
        }, features =
        {
                "src/test/resources/features/petstore/user/post/create_list_users.feature"
        },
        glue = "classpath:app.teralco.testing.backendtest.glue")
public class CreateListUsersIT extends BaseGTest {


}
