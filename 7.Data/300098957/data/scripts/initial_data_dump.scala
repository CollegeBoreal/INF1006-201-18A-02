
import org.apache.spark.sql.SQLContext

val sqlContext = new SQLContext(sc)
val driver = "com.mysql.jdbc.Driver"

// ANY MYSQL DB
val userSrcDB = "root"
val passSrcDB = "password"

val urlSource = "jdbc:mysql://src-mysql:3306/sakila?useSSL=false"

// Prepare destination parameters
val prop = new java.util.Properties
prop.setProperty("user", "root")
prop.setProperty("password", "password")

val urlDest = s"jdbc:mysql://dst-mysql:3306/myDB?useSSL=false"

// Importing countries
val country = sqlContext.read.
              format("jdbc").
              option("url", urlSource).
              option("driver", driver).
              option("user", userSrcDB).
              option("password", passSrcDB).
              option("dbtable", "country").
              load()

country.select($"country_id", $"country").write.mode("append").jdbc(urlDest,"COUNTRIES",prop)

System.exit(0)
