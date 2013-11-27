# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#post_serialized_receiver_ids').select2
    multiple: true,
    minimumInputLength: 2,
    placeholder: 'Search for Foobar'

    initSelection: (inputField, callback) ->
      currentValue = inputField.val()
      inputField.val("")
      callback($.parseJSON(currentValue).map (element) -> { id: "#{element.type}-#{element.id}", text: element.name })

    ajax:
      url: '/search.json'
      data: (term) ->
        return { query: term }
      results: (data) ->
        return {
          results: data.map (element) ->
            { id: "#{element.type}-#{element.id}", text: element.name }
          }

  $('#new_post [type="submit"]').click ->
    receivers = []
    $('#post_serialized_receiver_ids').select2('data').forEach (element) ->
      id = element.id.split('-')
      receivers.push({ type: id[0], id: parseInt(id[1]) })
    $('#post_serialized_receiver_ids').val(JSON.stringify(receivers))