#= require jquery.ui.autocomplete
#= require rangy-1.2.3/rangy-core

_getCursorOffset = ->
  if (window.getSelection && window.getSelection().rangeCount > 0) #FF,Chrome,Opera,Safari,IE9+
    return window.getSelection().getRangeAt(0).cloneRange().startOffset
  else if (document.selection) #IE 8 and lower
    return document.selection.createRange().startOffset

_setCursorPosition = (area, position) ->
  if (document.selection)
    sel = document.selection.createRange();
    sel.moveStart('character', position)
    sel.moveEnd('character', position)
    sel.select()
  else
    sel = window.getSelection()
    sel.collapse(area.firstChild, position)

$.fn.tagcompletion = (args) ->
  _field = this
  _trigger = '#'
  _trigger = args.triggerCharacter if args.triggerCharacter

  _source = args.source
  if $.isArray args.source
    _sourceArray = args.source
    _source = (input, callback) -> callback($.ui.autocomplete.filter(_sourceArray, input))

  _currentWord = ->
    word = _field.html().substring(0, _getCursorOffset()).match(new RegExp(_trigger + "[\\wäöüÄÖÜß]+$"))
    console.log word + _getCursorOffset()
    if word == null
      return null
    else
      return word[0].substring(1)

  this.keypress (event) ->
    if event.which == 32 || (event.which == 8 && _field.html()[_getCursorOffset() - 1]) == _trigger
      _field.autocomplete('close')

  this.autocomplete
    source: (input, callback) ->
      word = _currentWord()
      if word != null
        _source(word, callback)

    search: (event, ui) ->
      return _currentWord() != null

    focus: -> false # prevent value inserted on focus

    select: (event, ui) ->
      begin = this.innerHTML.substring(0, _getCursorOffset() - _currentWord().length - 1)
      value = ui.item.value
      if args.select
        value = args.select(ui.item)
      this.innerHTML = begin + _trigger + value + " " + this.innerHTML.substring(_getCursorOffset())
      _setCursorPosition(this, begin.length + value.length + 2)
      return false


$ ->
  $('#text').tagcompletion
    source: (input, callback) ->
      $.ajax
        url: "/search/tags.json"
        dataType: "json"
        data:
          query: input
        success: (data) ->
          results = $.ui.autocomplete.filter(data.map((tag) -> tag.name), input)
          if results
            results.unshift(input) if $.inArray(input, results) == -1
          else
            results = [input]
          callback(results)
