function get_rights_bibliographic_citation() {
  var rights_first_part = "Permission to publish material from the ";
  var rights_second_part = " must be obtained from University Libraries Special Collections, Virginia Tech.";
  var b_c_first_part = "Researchers wishing to cite this collection should include the following information: ";
  var b_c_second_part = " - Special Collections, Virginia Polytechnic Institute and State University, Blacksburg, Va. Available from [DOI]";
  $("#collection_title").bind('mouseover keyup', function(){
    $("#collection_rights").val(rights_first_part + this.value.replace("The ", "") + rights_second_part);
    $("#collection_bibliographic_citation").val(b_c_first_part + this.value.replace("The ", "") + b_c_second_part);
    });
  $("#item_title").bind('mouseover keyup', function(){
    $("#item_rights").val(rights_first_part + this.value + rights_second_part);
    $("#item_bibliographic_citation").val(b_c_first_part + this.value + b_c_second_part);
  });
}

Blacklight.onLoad(function() {
  get_rights_bibliographic_citation();
  // This javascript modifies the collection form's CSRF token if it does not match the page's CSRF token.
  // It is a work-around for issue https://github.com/samvera/hyrax/issues/1191

  $('[data-behavior="updates-collection"]').on('click', function() {
    var form = $(this).closest("form");
    var form_authenticity_token = form.find(":input[name='authenticity_token']");
    var header_authenticity_token = $("meta[name='csrf-token']").attr('content');
    if (form_authenticity_token.attr('value') != header_authenticity_token) {
        form_authenticity_token.attr('value', header_authenticity_token);
    }
  });
});
