# mod_oauth2 for Windows

This fork of the module is used to build a dll version of the module for use on Windows. This library has the dependency of liboauth2. In order to build it the expectations of the scripts is such that the liboath2 and mod_oauth2 projects both share the same parent folder.  

Once the projects are both cloned, you can build both projects by running the following command from a command prompt.

```cmd
setup_and_build.cmd
```

This will call the bootstrap script in the liboauth2 project, as well as download all the necessary vcpkg libraries and apache.  In the end you will have a compiled dll in the x64/release folder.

NOTE: It only builds a 64bit version of the dll.