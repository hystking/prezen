$ = require "jquery"
combokeys = new (require "combokeys") document

openPage = ($page) ->
  $page.addClass "show"
  $inner = $page.find ">.inner"
  $inner.css top: (window.innerHeight - $inner.height())/2

closePage = ($page) ->
  $page.removeClass "show"

togglePage = ($page) ->
  return if $page.length is 0
  closePage $ ".page.show"
  openPage $page

next = ->
  togglePage ($ ".page.show").next()

prev = ->
  togglePage ($ ".page.show").prev()

window.addEventListener "resize", ->
  console.log "resize"
  openPage $ ".page.show"

combokeys.bind "right", next
combokeys.bind "left", prev
combokeys.bind "down", next
combokeys.bind "up", prev
combokeys.bind "shift+right", -> togglePage $ ".page:last-child"
combokeys.bind "shift+left", -> togglePage $ ".page:first-child"
combokeys.bind "shift+down", -> togglePage $ ".page:last-child"
combokeys.bind "shift+up", -> togglePage $ ".page:first-child"

togglePage ($ ".page").first()
