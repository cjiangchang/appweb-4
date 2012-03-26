#
#   build.sh -- Build It Shell Script to build Embedthis Appweb
#

PLATFORM="solaris-i686-debug"
CC="cc"
CFLAGS="-Wall -fPIC -g -mcpu=i686"
DFLAGS="-D_REENTRANT -DCPU=i686 -DPIC"
IFLAGS="-Isolaris-i686-debug/inc"
LDFLAGS="-L${PLATFORM}/lib -g"
LIBS="-llxnet -lrt -lsocket -lpthread -lm"

[ ! -x ${PLATFORM}/inc ] && mkdir -p ${PLATFORM}/inc ${PLATFORM}/obj ${PLATFORM}/lib ${PLATFORM}/bin
[ ! -f ${PLATFORM}/inc/buildConfig.h ] && cp projects/buildConfig.${PLATFORM} ${PLATFORM}/inc/buildConfig.h

rm -rf solaris-i686-debug/inc/mpr.h
cp -r src/deps/mpr/mpr.h solaris-i686-debug/inc/mpr.h

${CC} -c -o ${PLATFORM}/obj/mprLib.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/deps/mpr/mprLib.c

${CC} -shared -o ${PLATFORM}/lib/libmpr.so -L${PLATFORM}/lib -g ${PLATFORM}/obj/mprLib.o ${LIBS}

${CC} -c -o ${PLATFORM}/obj/manager.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/deps/mpr/manager.c

${CC} -o ${PLATFORM}/bin/appman -L${PLATFORM}/lib -g -L${PLATFORM}/lib ${PLATFORM}/obj/manager.o ${LIBS} -lmpr -L${PLATFORM}/lib -g

${CC} -c -o ${PLATFORM}/obj/makerom.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/deps/mpr/makerom.c

${CC} -o ${PLATFORM}/bin/makerom -L${PLATFORM}/lib -g -L${PLATFORM}/lib ${PLATFORM}/obj/makerom.o ${LIBS} -lmpr -L${PLATFORM}/lib -g

rm -rf solaris-i686-debug/inc/pcre.h
cp -r src/deps/pcre/pcre.h solaris-i686-debug/inc/pcre.h

${CC} -c -o ${PLATFORM}/obj/pcre.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/deps/pcre/pcre.c

${CC} -shared -o ${PLATFORM}/lib/libpcre.so -L${PLATFORM}/lib -g ${PLATFORM}/obj/pcre.o ${LIBS}

rm -rf solaris-i686-debug/inc/http.h
cp -r src/deps/http/http.h solaris-i686-debug/inc/http.h

${CC} -c -o ${PLATFORM}/obj/httpLib.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/deps/http/httpLib.c

${CC} -shared -o ${PLATFORM}/lib/libhttp.so -L${PLATFORM}/lib -g ${PLATFORM}/obj/httpLib.o ${LIBS} -lmpr -lpcre

${CC} -c -o ${PLATFORM}/obj/http.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/deps/http/http.c

${CC} -o ${PLATFORM}/bin/http -L${PLATFORM}/lib -g -L${PLATFORM}/lib ${PLATFORM}/obj/http.o ${LIBS} -lhttp -lmpr -lpcre -L${PLATFORM}/lib -g

rm -rf solaris-i686-debug/inc/sqlite3.h
cp -r src/deps/sqlite/sqlite3.h solaris-i686-debug/inc/sqlite3.h

${CC} -c -o ${PLATFORM}/obj/sqlite3.o -fPIC -g -mcpu=i686 ${DFLAGS} -I${PLATFORM}/inc src/deps/sqlite/sqlite3.c

${CC} -shared -o ${PLATFORM}/lib/libsqlite3.so -L${PLATFORM}/lib -g ${PLATFORM}/obj/sqlite3.o ${LIBS}

rm -rf solaris-i686-debug/inc/appweb.h
cp -r src/appweb.h solaris-i686-debug/inc/appweb.h

rm -rf solaris-i686-debug/inc/customize.h
cp -r src/customize.h solaris-i686-debug/inc/customize.h

${CC} -c -o ${PLATFORM}/obj/config.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/config.c

${CC} -c -o ${PLATFORM}/obj/convenience.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/convenience.c

${CC} -c -o ${PLATFORM}/obj/dirHandler.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/dirHandler.c

${CC} -c -o ${PLATFORM}/obj/fileHandler.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/fileHandler.c

${CC} -c -o ${PLATFORM}/obj/log.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/log.c

${CC} -c -o ${PLATFORM}/obj/server.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/server.c

${CC} -shared -o ${PLATFORM}/lib/libappweb.so -L${PLATFORM}/lib -g ${PLATFORM}/obj/config.o ${PLATFORM}/obj/convenience.o ${PLATFORM}/obj/dirHandler.o ${PLATFORM}/obj/fileHandler.o ${PLATFORM}/obj/log.o ${PLATFORM}/obj/server.o ${LIBS} -lmpr -lhttp -lpcre -lpcre

rm -rf solaris-i686-debug/inc/edi.h
cp -r src/esp/edi.h solaris-i686-debug/inc/edi.h

rm -rf solaris-i686-debug/inc/esp-app.h
cp -r src/esp/esp-app.h solaris-i686-debug/inc/esp-app.h

rm -rf solaris-i686-debug/inc/esp.h
cp -r src/esp/esp.h solaris-i686-debug/inc/esp.h

rm -rf solaris-i686-debug/inc/mdb.h
cp -r src/esp/mdb.h solaris-i686-debug/inc/mdb.h

${CC} -c -o ${PLATFORM}/obj/edi.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/esp/edi.c

${CC} -c -o ${PLATFORM}/obj/espAbbrev.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/esp/espAbbrev.c

${CC} -c -o ${PLATFORM}/obj/espFramework.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/esp/espFramework.c

${CC} -c -o ${PLATFORM}/obj/espHandler.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/esp/espHandler.c

${CC} -c -o ${PLATFORM}/obj/espHtml.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/esp/espHtml.c

${CC} -c -o ${PLATFORM}/obj/espSession.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/esp/espSession.c

${CC} -c -o ${PLATFORM}/obj/espTemplate.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/esp/espTemplate.c

${CC} -c -o ${PLATFORM}/obj/mdb.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/esp/mdb.c

${CC} -c -o ${PLATFORM}/obj/sdb.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/esp/sdb.c

${CC} -shared -o ${PLATFORM}/lib/mod_esp.so -L${PLATFORM}/lib -g ${PLATFORM}/obj/edi.o ${PLATFORM}/obj/espAbbrev.o ${PLATFORM}/obj/espFramework.o ${PLATFORM}/obj/espHandler.o ${PLATFORM}/obj/espHtml.o ${PLATFORM}/obj/espSession.o ${PLATFORM}/obj/espTemplate.o ${PLATFORM}/obj/mdb.o ${PLATFORM}/obj/sdb.o ${LIBS} -lappweb -lmpr -lhttp -lpcre

${CC} -c -o ${PLATFORM}/obj/esp.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/esp/esp.c

${CC} -o ${PLATFORM}/bin/esp -L${PLATFORM}/lib -g -L${PLATFORM}/lib ${PLATFORM}/obj/edi.o ${PLATFORM}/obj/esp.o ${PLATFORM}/obj/espAbbrev.o ${PLATFORM}/obj/espFramework.o ${PLATFORM}/obj/espHandler.o ${PLATFORM}/obj/espHtml.o ${PLATFORM}/obj/espSession.o ${PLATFORM}/obj/espTemplate.o ${PLATFORM}/obj/mdb.o ${PLATFORM}/obj/sdb.o ${LIBS} -lappweb -lmpr -lhttp -lpcre -L${PLATFORM}/lib -g

rm -rf solaris-i686-debug/lib/esp.conf
cp -r src/esp/esp.conf solaris-i686-debug/lib/esp.conf

rm -rf solaris-i686-debug/lib/esp-www
cp -r src/esp/www solaris-i686-debug/lib/esp-www

${CC} -c -o ${PLATFORM}/obj/cgiHandler.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/modules/cgiHandler.c

${CC} -shared -o ${PLATFORM}/lib/mod_cgi.so -L${PLATFORM}/lib -g ${PLATFORM}/obj/cgiHandler.o ${LIBS} -lappweb -lmpr -lhttp -lpcre

${CC} -c -o ${PLATFORM}/obj/auth.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/utils/auth.c

${CC} -o ${PLATFORM}/bin/auth -L${PLATFORM}/lib -g -L${PLATFORM}/lib ${PLATFORM}/obj/auth.o ${LIBS} -lmpr -L${PLATFORM}/lib -g

${CC} -c -o ${PLATFORM}/obj/cgiProgram.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/utils/cgiProgram.c

${CC} -o ${PLATFORM}/bin/cgiProgram -L${PLATFORM}/lib -g -L${PLATFORM}/lib ${PLATFORM}/obj/cgiProgram.o ${LIBS} -L${PLATFORM}/lib -g

${CC} -c -o ${PLATFORM}/obj/setConfig.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/utils/setConfig.c

${CC} -o ${PLATFORM}/bin/setConfig -L${PLATFORM}/lib -g -L${PLATFORM}/lib ${PLATFORM}/obj/setConfig.o ${LIBS} -lmpr -L${PLATFORM}/lib -g

rm -rf solaris-i686-debug/inc/appwebMonitor.h
cp -r src/server/appwebMonitor.h solaris-i686-debug/inc/appwebMonitor.h

${CC} -c -o ${PLATFORM}/obj/appweb.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc src/server/appweb.c

${CC} -o ${PLATFORM}/bin/appweb -L${PLATFORM}/lib -g -L${PLATFORM}/lib ${PLATFORM}/obj/appweb.o ${LIBS} -lappweb -lmpr -lhttp -lpcre -L${PLATFORM}/lib -g

rm -rf solaris-i686-debug/inc/testAppweb.h
cp -r test/testAppweb.h solaris-i686-debug/inc/testAppweb.h

${CC} -c -o ${PLATFORM}/obj/testAppweb.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc test/testAppweb.c

${CC} -c -o ${PLATFORM}/obj/testHttp.o ${CFLAGS} ${DFLAGS} -I${PLATFORM}/inc test/testHttp.c

${CC} -o ${PLATFORM}/bin/testAppweb -L${PLATFORM}/lib -g -L${PLATFORM}/lib ${PLATFORM}/obj/testAppweb.o ${PLATFORM}/obj/testHttp.o ${LIBS} -lappweb -lmpr -lhttp -lpcre -L${PLATFORM}/lib -g

echo '#!${PLATFORM}/bin/cgiProgram' >test/cgi-bin/testScript ; chmod +x test/cgi-bin/testScript
echo -e '#!`type -p sh`' >test/web/caching/cache.cgi
echo -e '' >>test/web/caching/cache.cgi
echo -e 'echo HTTP/1.0 200 OK' >>test/web/caching/cache.cgi
echo -e 'echo Content-Type: text/plain' >>test/web/caching/cache.cgi
echo -e 'date' >>test/web/caching/cache.cgi
chmod +x test/web/caching/cache.cgi
echo -e '#!`type -p sh`' >test/web/basic/basic.cgi
echo -e '' >>test/web/basic/basic.cgi
echo -e 'echo Content-Type: text/plain' >>test/web/basic/basic.cgi
echo -e '/usr/bin/env' >>test/web/basic/basic.cgi
chmod +x test/web/basic/basic.cgi
cp ${PLATFORM}/bin/cgiProgram test/cgi-bin/cgiProgram
cp ${PLATFORM}/bin/cgiProgram test/cgi-bin/nph-cgiProgram
cp ${PLATFORM}/bin/cgiProgram 'test/cgi-bin/cgi Program'
cp ${PLATFORM}/bin/cgiProgram test/web/cgiProgram.cgi
chmod +x test/cgi-bin/* test/web/cgiProgram.cgi