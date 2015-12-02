gulp        = require 'gulp'
coffee      = require 'gulp-coffee'
coffeex     = require 'gulp-coffee-react'
concat      = require 'gulp-concat'
sass        = require 'gulp-sass'
browserSync = require 'browser-sync'
webserver   = require 'gulp-webserver'

gulp.task 'coffeex', ->
  gulp.src './src/coffee/**/*.coffee'
    .pipe coffeex bare: true
    .pipe gulp.dest './build'
    .pipe browserSync.stream()

gulp.task 'concat', ->
  gulp.src ['./build/**/*.js', './build/app.js']
    .pipe concat 'all.js'
    .pipe gulp.dest './dist'

gulp.task 'webserver', ->
  gulp.src ''
    .pipe webserver
      livereload: true
      host: '0.0.0.0'
      port: '8000'

gulp.task 'watch', ->
  gulp.watch './src/coffee/**/*.coffee', ['coffeex', 'concat']

gulp.task 'default', ['coffeex', 'concat',  'webserver', 'watch']
