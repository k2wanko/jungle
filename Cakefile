###

  # setting

###

src_dir = "./src"

app_dir = "./app"

manifest_yml = "manifest.yml"


###


###

#private
fs = require 'fs'
path = require 'path'

{ exec, spawn } = require 'child_process'

isOld = (f1, f2)->
  return true unless fs.existsSync f1
  (fs.statSync f1).mtime < (fs.statSync f2).mtime

toExt = (base, ext)->
  path.basename(base, path.extname(base)) + ext

getList = (reg)->
  list = []
  for f in fs.readdirSync src_dir
    list.push f if reg.test f 
  return list
  
task 'build', 'project build.', (o)->
  invoke 'manifest'
  invoke 'html'
  invoke 'js'

task 'clean', 'dist clean', (o)->
  exec "rm -rf #{app_dir}/manifest.json #{app_dir}/*.js #{app_dir}/*.html"

task 'watch', 'file watch.', (o)->

  invoke 'build'
      
  watch = require 'watch'
  colors = require 'colors'
  
  watch.createMonitor src_dir, (monitor)->
    monitor.on 'created', (f, stat)->
      return if /^\.#/.test path.basename(f)
      console.log 'created'.yellow, f
      invoke 'build'
      
    monitor.on 'changed', (f, curr, prev)->
      return if /^\.#/.test f
      
      console.log 'changed'.green, f

      #manifest compile
      invoke 'manifest' if  manifest_yml is path.basename(f)

      #html compile
      invoke 'html' if /\.jade$/.test f

      #js compile
      invoke 'js' if /\.coffee$/.test f
      
    monitor.on 'removed', (f, stat)->
      return if /^\.#/.test f
      console.log 'removed'.red, f
      #invoke 'build' 

task 'manifest', "manifest build (yaml to json)", (o)->
  yaml = require 'js-yaml'
  src_name = path.join src_dir, manifest_yml
  
  dist_name = path.join app_dir, toExt(manifest_yml, '.json')

  if isOld dist_name, src_name

    doc = yaml.safeLoad fs.readFileSync src_name, 'utf8'
  
    fs.writeFile dist_name, JSON.stringify doc

task 'html', "html build (#{src_dir}/*.jade to #{app_dir}/*.html", (o)->
  jade = require 'jade'
  
  jadeList = getList /\.jade$/

  for jadefile in jadeList
    src_name = path.join src_dir, jadefile
    dist_name = path.join app_dir, toExt(jadefile, '.html')

    if isOld dist_name, src_name
      fs.writeFile dist_name, jade.renderFile src_name, {}

  
task "js", "js build (#{src_dir}/*.coffee to #{app_dir}/*.js)", (o)->
  Snockets = require 'snockets'
  snockets = new Snockets

  coffee = require 'coffee-script'
  
  coffeeList = getList /\.coffee$/

  for coffeeFile in coffeeList

    new ->
      
      @src_name = path.join src_dir, coffeeFile

      @dist_name = path.join app_dir, toExt coffeeFile, '.js'

      snockets.getCompiledChain @src_name, (err, jsList) =>
        #return console.error err if err
        compileFlag = false
        list = []
        for js in jsList
          name = js.filename.replace /\.js$/, '.coffee'
          compileFlag = true if isOld @dist_name, name
          list.push name

        if compileFlag

          codeList = []
          for file in list
            codeList.push fs.readFileSync file, 'utf8'
          fs.writeFile @dist_name, coffee.compile codeList.join "\n"

option '-p', '--port[V]', 'Server port'    
  
task 'server', (options)->
  process.env.PORT = process.env.PORT || options.port || 3000
  node = 'node'
  server = spawn node, ['./server/bin/www']
  server.stdout.on 'data', (data)->
    process.stdout.write data

  server.stderr.on 'data', (data)->
    process.stderr.write data

  server.on 'close', (code)->
    console.log('server process exited with code ', code);
