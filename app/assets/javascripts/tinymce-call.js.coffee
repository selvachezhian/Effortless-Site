$ ->

  $.each($(".tiny_mce"), (index, value) ->

    tinymce.init(
        selector: "textarea#" + $(this).attr("id")
        theme: "modern"
        width: 500
        height: 500
        menubar : true
        entity_encoding : "raw"
        plugins: [
          "advlist autolink link lists charmap print preview hr anchor spellchecker",
          "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime nonbreaking",
          "table contextmenu directionality emoticons template paste textcolor"
        ]
#        plugins: [
#          "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
#          "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
#          "save table contextmenu directionality emoticons template paste textcolor"
#        ]
        theme_advanced_path : false
        content_css: "/tinymce/custom_theme_content.css"
#        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons"
        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink | print preview fullpage | forecolor backcolor emoticons"
        style_formats: [
          {title: 'Bold text', inline: 'b'}
          {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}}
          {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}}
          {title: 'Example 1', inline: 'span', classes: 'example1'}
          {title: 'Example 2', inline: 'span', classes: 'example2'}
          {title: 'Table styles'}
          {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
        ]
    );
  );
