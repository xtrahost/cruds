require('nodetime').profile({
    accountKey: 'fcbefada60a1e0ef8046863970740120377c8df9'
    appName: 'Node.js Application'
  });
###
Simple test server 
###
express = require "express"
http = require "http"
path = require "path"
app = express()

app.set "port", process.env.PORT or 3000
app.use express.logger("dev")
app.use express.errorHandler()
app.use express.urlencoded()
app.use express.json()
app.use express.static(path.join(__dirname, "browser"))

server = http.createServer(app).listen app.get("port"), ->
    console.log "Express server listening on port " + app.get("port")

#CRUDS SETUP
cruds = require("../lib/cruds")({'server': server, 'name': 'entity'})
app.use '/entity', cruds.route
app.use '/entity/:id', cruds.route


