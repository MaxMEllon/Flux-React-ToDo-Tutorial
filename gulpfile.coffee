gulp         = require 'gulp'
coffee       = require 'gulp-coffee'
coffeex      = require 'gulp-coffee-react'
concat       = require 'gulp-concat'
compass      = require 'gulp-compass'
browserSync  = require 'browser-sync'
autoprefixer = require 'gulp-autoprefixer'
webserver    = require 'gulp-webserver'

gulp.task 'coffeex', ->
  gulp.src './src/coffee/**/*.coffee'
    .pipe coffeex bare: true
    .pipe gulp.dest './build'
    .pipe browserSync.stream()

gulp.task 'compass', ->
  gulp.src './src'
    .pipe compass
      css: '.sass-cache/compass-cache/'
      sass: './src/sass/'
    .pipe autoprefixer()
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
  gulp.watch './src/sass/**/*.sass', ['compass']
  gulp.src 'gulpfile.coffee'

gulp.task 'default', ['compass', 'coffeex', 'concat', 'webserver', 'watch']
