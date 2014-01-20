#The below code will show ajax loader for each ajax request and will hide the loader after the response
#And this will add csrf meta keyword in each request
->
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

$ ->
  $(document).on('change', '#site_html_template_id', ->
    template_id = @value;
    $.ajax(
      type: 'GET'
      url: '/sites/get_themes/' + template_id
      dataType: 'html'
      success: (data) ->
        if data is 'invalid' then alert('Record Not Found') else $('#dynamic_theme').html(data);
    );
  );