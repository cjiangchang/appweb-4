/*
    customize.h -- Place to override standard product defintions
 */

#ifndef _h_CUSTOMIZE_h
#define _h_CUSTOMIZE_h 1

/*
    Override definitions here. This file is included after all other headers are parsed.

    Use this to define the default appweb.conf file
        #define BLD_CONFIG_FILE     "/path/to/default/appweb.conf"

    Use this to define the default server root directory
        #define BLD_SERVER_ROOT     "/var/spool/chroot/jail"

    Use this to add define a function to initialize staticaly linked modules
        #define BLD_MODULE_NAME     "myHandler"
        #define BLD_MODULE_ENTRY    "MyHandlerInit"
 */

#endif /* _h_CUSTOMIZE_h */