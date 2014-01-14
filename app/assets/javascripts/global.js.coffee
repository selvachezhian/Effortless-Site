$('#loader').hide()
$(document).ajaxStart ->
  $('#loader').show();

$(document).ajaxError ->
  alert("Something went wrong...");
  $('#loader').hide();

$(document).ajaxStop ->
  $('#loader').hide();

$.ajaxSetup(
#  data:
#    site_id: $("#current_site_id").val()
  beforeSend: (xhr) ->
    xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));

);