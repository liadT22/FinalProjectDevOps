
import scala.concurrent.duration._

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import io.gatling.jdbc.Predef._

class RecordedSimulation extends Simulation {

  private val httpProtocol = http
    .baseUrl("http://localhost")
    .inferHtmlResources(AllowList(), DenyList(""".*\.js""", """.*\.css""", """.*\.gif""", """.*\.jpeg""", """.*\.jpg""", """.*\.ico""", """.*\.woff""", """.*\.woff2""", """.*\.(t|o)tf""", """.*\.png""", """.*\.svg""", """.*detectportal\.firefox\.com.*"""))
    .acceptHeader("text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7")
    .acceptEncodingHeader("gzip, deflate, br")
    .acceptLanguageHeader("en-US,en;q=0.9,he-IL;q=0.8,he;q=0.7")
    .upgradeInsecureRequestsHeader("1")
    .userAgentHeader("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36")
  
  private val headers_0 = Map(
  		"Cache-Control" -> "max-age=0",
  		"Sec-Fetch-Dest" -> "document",
  		"Sec-Fetch-Mode" -> "navigate",
  		"Sec-Fetch-Site" -> "none",
  		"Sec-Fetch-User" -> "?1",
  		"sec-ch-ua" -> """Chromium";v="116", "Not)A;Brand";v="24", "Google Chrome";v="116""",
  		"sec-ch-ua-mobile" -> "?0",
  		"sec-ch-ua-platform" -> "Windows"
  )


  private val scn = scenario("RecordedSimulation")
    .exec(
      http("request_0")
        .get("/LiadAyalDanielShimon/")
        .headers(headers_0)
    )

	setUp(
    scn.inject(
      rampUsersPerSec(10) to 63 during (30 seconds), // Ramp up to 70 users in 10 seconds
      constantUsersPerSec(63) during (1 minutes), // Maintain 70 users for 5 seconds
	  rampUsersPerSec(63) to 0 during (30 seconds) // Ramp up to 70 users in 10 seconds
    )
  )
  .protocols(httpProtocol)
  .maxDuration(2 minutes) // Set the max duration to 2 minutes
}
