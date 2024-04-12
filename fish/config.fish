if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux fish_user_paths /home/eduardo/.cargo/bin $fish_user_paths

set -Ux JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
set -Ux JRE_HOME /usr/local/java/jdk1.8.0_202/jre/bin
set -Ux CLASSPATH /usr/local/java/jdk1.8.0_202/lib

set -Ux PATH $PATH:$HOME/bin:$JAVA_HOME:$JRE_HOME:$CLASSPATH

set -x _PENTAHO_JAVA $JRE_HOME


set -Ux STARSHIP_CONFIG /home/eduardo/.config/starship/starship.toml
starship init fish | source

neofetch
