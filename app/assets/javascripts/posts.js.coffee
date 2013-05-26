#= require jquery.ui.autocomplete

# Proof of concept of autocompletion of tags (and other stuff) in posts
# Needs testing and refactoring

_leftMatch = (string, area) ->
  string.substring(0, area.selectionStart).match /#[\wäöüÄÖÜß]{2,}$/

_setCursorPosition = (area, pos) ->
  if area.setSelectionRange
    area.setSelectionRange pos, pos
  else if area.createTextRange
    range = area.createTextRange()
    range.collapse true
    range.moveEnd "character", pos
    range.moveStart "character", pos
    range.select()

$ ->
  $('#post_text').autocomplete
    minLength: 0
    source: (input, callback) ->
      currentWord = _leftMatch(input.term, $("#post_text")[0])
      if currentWord != null
        currentWord = currentWord[0].substring(1)
        $.ajax
          url: "/search/tags.json"
          dataType: "json"
          data:
            query: currentWord
          success: (data) ->
            results = $.ui.autocomplete.filter(data.map((tag) -> tag.name), currentWord)
            if results
              results.unshift(currentWord) if $.inArray(currentWord, results) == -1
            else
              results = [currentWord]
            callback(results)

    focus: ->
      false # prevent value inserted on focus
    select: (event, ui) ->
      m = _leftMatch(this.value, this)[0]
      beg = this.value.substring(0, this.selectionStart - m.length)
      this.value = beg + '#' + ui.item.value + " " + this.value.substring(this.selectionStart, this.value.length)
      pos = beg.length + ui.item.value.length + 2
      _setCursorPosition(this, pos)
      return false
    search: (event, ui) ->
      m = _leftMatch(this.value, this)
      return m != null
    #close: (event, ui) ->
      # TODO adding stuff

  $('#post_text').keypress (event) ->
    if event.which == 32 || (event.which == 8 && $('#post_text').val()[$('#post_text')[0].selectionStart - 1]) == "#"
      $('#post_text').autocomplete('close')