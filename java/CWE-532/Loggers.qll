import java
import semmle.code.java.dataflow.DataFlow
import semmle.code.java.dataflow.FlowSources
import semmle.code.java.dataflow.TaintTracking2

// Ref :: https://github.com/github/codeql/blob/main/java/ql/src/experimental/Security/CWE/CWE-532/SensitiveInfoLog.ql
// Ref :: https://github.com/github/codeql/blob/main/java/ql/src/experimental/semmle/code/java/Logging.qll#L34

class LoggerType extends RefType {
  LoggerType() {
    this.hasQualifiedName("org.apache.log4j", "Category") or // Log4j 1
    this.hasQualifiedName("org.apache.logging.log4j", ["Logger", "LogBuilder"]) or // Log4j 2
    this.hasQualifiedName("org.apache.commons.logging", "Log") or
    // JBoss Logging (`org.jboss.logging.Logger` in some implementations like JBoss Application Server 4.0.4 did not implement `BasicLogger`)
    this.hasQualifiedName("org.jboss.logging", ["BasicLogger", "Logger"]) or
    this.hasQualifiedName("org.slf4j.spi", "LoggingEventBuilder") or
    this.hasQualifiedName("org.slf4j", "Logger") or
    this.hasQualifiedName("org.scijava.log", "Logger") or
    this.hasQualifiedName("com.google.common.flogger", "LoggingApi") or
    this.hasQualifiedName("java.lang", "System$Logger") or
    this.hasQualifiedName("java.util.logging", "Logger") or
    this.hasQualifiedName("android.util", "Log")
  }
}
