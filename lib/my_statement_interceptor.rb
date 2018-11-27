require 'java'
require 'jdbc/mysql'
Jdbc::MySQL.load_driver(:require)

java_import "com.mysql.jdbc.StatementInterceptorV2"

java_import "com.mysql.jdbc.ResultSetInternalMethods"
java_import "com.mysql.jdbc.Statement"
java_import "com.mysql.jdbc.Connection"
java_import "java.util.Properties"
java_import "java.sql.SQLException"

java_package "com.example.mysql"
class MyStatementInterceptor
    java_implements com.mysql.jdbc.StatementInterceptorV2

    java_signature 'void init( Connection connection, Properties properties )'
    def init _, _
        nil
    end

    java_signature 'void destroy()'
    def destroy
    end

    java_signature 'boolean executeTopLevelOnly()'
    def executeTopLevelOnly
        true
    end

    java_signature 'ResultSetInternalMethods preProcess( String sql, Statement interceptedStatement, Connection connection ) throws SQLException'
    def preProcess _, _, _
        nil
    end

    java_signature 'ResultSetInternalMethods postProcess( String sql, Statement interceptedStatement, ResultSetInternalMethods originalResultSet,
            Connection connection, int warningCount, boolean noIndexUsed, boolean noGoodIndexUsed, SQLException statementException ) throws SQLException'
    def postProcess _, _, _, _, _, _, _, _
        nil
    end

    become_java!
end
