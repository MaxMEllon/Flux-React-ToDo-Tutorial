gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
glob        = require 'glob'
cjsx        = require 'gulp-cjsx'
sass        = require 'gulp-sass'
concat      = require 'gulp-concat'
plumber     = require 'gulp-plumber'
runSequence = require 'run-sequence'
browserify  = require 'browserify'
reactify    = require 'coffee-reactify'
source      = require 'vinyl-source-stream'

gulp.task 'default', ->
  srcFiles = glob.sync('./src/scripts/**/*.coffee')
  return browserify
          entries: srcFiles
          transform: ['coffee-reactify']
      .bundle()
      .pipe source('bundle.js')
      .pipe gulp.dest('./build')

gulp.task 'webserver', ->
  gulp.src ''
    .pipe webserver
      livereload: true,
      host: '0.0.0.0'
      port: '8000'

gulp.task 'watch', ->
    gulp.watch './src/*.coffee', ['default', 'webserver']
