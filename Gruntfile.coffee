
src_dir = "./src"
app_dir = "./app"

path = require 'path'

exec = (cmd)->
  { exec } = require 'child_process'
  exec cmd, (err, s_out, s_err)->
    process.stdout.write s_out if s_out
    process.stderr.write s_err if s_err
    

module.exports = (grunt)->

  jsFiles = [path.join(src_dir, '*.coffee'), path.join(src_dir, 'game', '*.coffee')];
      
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    watch:
      js:
        files: jsFiles
        tasks: ['js']
      html:
        files: [path.join(src_dir, '*.jade')]
        tasks: ['jade']

      manifest:
        files: [path.join(src_dir, 'manifest.yml')]
        tasks: ['manifest']

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.registerTask 'js', 'coffee compile', -> exec "cake js"
  grunt.registerTask 'html', 'html compile', -> exec "cake js"
  grunt.registerTask 'manifest', 'manifest compile', -> exec "cake js"

  return
