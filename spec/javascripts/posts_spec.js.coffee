# use require to load any .js file available to the asset pipeline
#= require posts

#http://forum.jquery.com/topic/how-to-make-jquery-autocomplete-to-work-for-a-contenteditable-div-instead-of-just-input-textarea-fields
#https://forum.jquery.com/topic/how-to-make-jquery-autocomplete-to-work-for-a-contenteditable-div-instead-of-just-input-textarea-fields#14737000003414037
describe "Tagging", ->
  field = null
  beforeEach ->
    loadFixtures 'tagging'
    field = $('#post')

  it "does not react on plain text", ->
    field.tagcompletion
      source: ["foobar"]

    field.html('foo')
    field.autocomplete("search")
    expect($('body')).not.toContainText('foobar')


  it "reacts on # char", ->
    field.tagcompletion
      source: ["foobar"]
    field.html('#foo')
    field.autocomplete("search")
    expect($('body')).toContainText('foobar')

  it "has an option for the symbol to react on", ->
    field.tagcompletion
      source: ["foobar"]
      triggerCharacter: '@'

    field.html('@foo')
    field.autocomplete("search")
    expect($('body')).toContainText('foobar')

  it "only completes the last word", ->
    field.tagcompletion
      source: ["foobar"]
    field.html('#bla bla #foo')
    field.autocomplete("search")
    expect($('body')).toContainText('foobar')

  xit "completes the word where the caret is", ->
    field.tagcompletion
      source: ["foobar"]
    field.html('bla #foo bla')
    _setCursorPosition(field, 8)
    field.autocomplete("search")
    expect($('body')).toContainText('foobar')

  xit 'completes the current word', ->
    field.tagcompletion
      source: ["foobar"]
    field.html('#foo')
    field.focus()
    _setCursorPosition(field, 4)
    field.autocomplete("search")
    expect($('body')).toContainText('foobar')
    $('li').click()
    expect(field).toHaveText('#foobar ')

  xit 'only completes the current word', ->
    field.tagcompletion
      source: ["foobar"]
    field.html('bla #foo')
    field.focus()
    _setCursorPosition(field, 8)
    field.autocomplete("search")
    expect($('body')).toContainText('foobar')
    $('li').click()
    expect(field).toContainText('#foobar')
    expect(field).toContainText('bla')