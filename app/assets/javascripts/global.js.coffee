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

$ ->
  $(document).on('click', '.menu_status_change', ->
    menu_id = @value;
    site_id = $('#site_id').val();
    status = if $(this).is(':checked') is true then 'active' else 'in-active';
    $.ajax(
      type: 'POST'
      url: '/site/' + site_id + '/menu/' + menu_id + '/change_status_to/' + status
      dataType: 'json'
      success: (data) ->
        if status is 'active' then alert('Menu activated') else alert('Menu de activated');
    );
  );

$ ->
  $( '#menu_sort' ).sortable(
    revert: true
    cursor: "move"
    update: ( event, ui ) ->
      menu_reorder();
  );

menu_reorder = ->
  menu_order = $( "#menu_sort" ).sortable( "toArray");
  site_id = $('#site_id').val();
  $.ajax(
    type: 'POST'
    url: '/site/' + site_id + '/menu/change_menu_order/' + menu_order
    dataType: 'json'
    success: (data) ->
      if data.status is 'success' then alert('Menu order changed') else alert('Please re order menu after refreshing the page');
  );