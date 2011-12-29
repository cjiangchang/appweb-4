/*
    secure.tst - SSL http tests
 */

if (!Config.SSL) {
    test.skip("SSL not enabled in ejs")

} else if (App.config.bld_ssl) {
    const HTTP = App.config.uris.http || "127.0.0.1:4100"
    const HTTPS = App.config.uris.ssl || "https://127.0.0.1:4110"
    let http: Http = new Http

    http.get(HTTP + "/index.html")
    assert(!http.isSecure)
    http.close()

    http.get(HTTPS + "/index.html")
    assert(http.isSecure)
    http.close()

    http.get(HTTPS + "/index.html")
    assert(http.readString(12) == "<html><head>")
    assert(http.readString(7) == "<title>")
    http.close()

    //  Validate get contents
    http.get(HTTPS + "/index.html?a=b")
    assert(http.response.endsWith("</html>\n"))
    assert(http.response.endsWith("</html>\n"))
    http.close()

    http.post(HTTPS + "/index.html", "Some data")
    assert(http.status == 200)
    http.close()

} else {
    test.skip("SSL not enabled")
}
