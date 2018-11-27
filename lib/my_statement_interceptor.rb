require 'java'
require 'jdbc/mysql'
Jdbc::MySQL.load_driver(:require)

require 'jruby/core_ext'

class MyStatementInterceptor
    include com.mysql.jdbc.StatementInterceptorV2

    java_signature 'void init( com.mysql.jdbc.Connection connection, java.util.Properties properties )'
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

    java_signature 'com.mysql.jdbc.ResultSetInternalMethods preProcess(
        java.lang.String sql, com.mysql.jdbc.Statement interceptedStatement, com.mysql.jdbc.Connection connection
      ) throws java.sql.SQLException'
    def preProcess sql, _, _
        $stderr.puts "=================== " + sql
        nil
    end

    java_signature 'com.mysql.jdbc.ResultSetInternalMethods postProcess(
        java.lang.String sql, com.mysql.jdbc.Statement interceptedStatement, com.mysql.jdbc.ResultSetInternalMethods originalResultSet,
        com.mysql.jdbc.Connection connection, int warningCount, boolean noIndexUsed, boolean noGoodIndexUsed,
        java.sql.SQLException statementException
      ) throws java.sql.SQLException'
    def postProcess _, _, _, _, _, _, _, _
        nil
    end
end

jclass = MyStatementInterceptor.become_java! false
$stderr.puts jclass.getName()
