# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
if (/Mac OS X|Linux|FreeBSD/.test(navigator.userAgent)) 
  document.documentElement.className += ' plat_osx'
else 
  document.documentElement.className += ' plat_win'