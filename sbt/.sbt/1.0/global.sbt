//valid for at least sbt.version=1.4

Global / bspEnabled := false         //disable generation of .bsp folder in the project
Global / autoStartServer := false    //disable starting of sbt server

addCommandAlias("ls", "projects")
addCommandAlias("cd", "project")
