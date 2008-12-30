
module Jdtc
  VERSION = '0.0.1'
  CURRENT_JDT_COMPILER = '3.4.1'
  
  def java_home
    @home ||= ENV['JAVA_HOME']
  end
  
  def ecj_location
    File.expand_path File.dirname(__FILE__) + "/../compiler/ecj-#{CURRENT_JDT_COMPILER}.jar"
  end
  
  def jdtc(args = [])
    java_call = "java"
    if (!java_home)
      warn 'JAVA_HOME not set, defaulting on the java executable in the path if there is one.'
    else
      java_call = "$JAVA_HOME/bin/java"
    end
    trace "#{java_call} -classpath #{ecj_location} org.eclipse.jdt.internal.compiler.batch.Main #{args.join(" ")}"
    system("#{java_call} -classpath #{ecj_location} org.eclipse.jdt.internal.compiler.batch.Main #{args.join(" ")}") or fail "Compilation failed"
  end
end