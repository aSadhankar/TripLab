dataSource {
    pooled = false
    //driverClassName = "org.hsqldb.jdbcDriver"
    //username = "sa"
    //password = ""
    //driverClassName = "com.mysql.jdbc.Driver"
    //username = "grails"
    //password = "gafk1234"
    //url = "jdbc:mysql://localhost:3306/spyami?autoreconnect=true"
    //url = "jdbc:mysql://localhost:7777/spyami?autoreconnect=true" //test db connection

}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            pooled = true
            driverClassName = "com.mysql.jdbc.Driver"
            username = "grails"
            password = "real1234"
            dbCreate = "update"// "update" //"create-drop" // one of 'create', 'create-drop','update'
            //url = "jdbc:hsqldb:mem:devDB"
            url = "jdbc:mysql://localhost:7777/triplab?autoreconnect=true"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            //url = "jdbc:hsqldb:mem:testDb"
            url = "jdbc:mysql://localhost:3306/triplab?autoreconnect=true"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            //url = "jdbc:hsqldb:file:prodDb;shutdown=true"
            //url = "jdbc:mysql://localhost:3306/spyami?autoreconnect=true"
            jndiName = "jdbc/triplab"
        }
    }
}
