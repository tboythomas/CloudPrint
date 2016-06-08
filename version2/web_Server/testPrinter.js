/*
FILE_DETAILS
    Description: Disable submit button for testPrinter page until required 
    fields are completed. Requires Jquery.
FILE_DETAILS
*/

$(document).ready(function (){
    validate();
    $('#printer').change(validate);
});

function validate(){
    if ($('#printer').val().length >  0) {
        $("input[type=submit]").prop("disabled", false);
    }
    else {
        $("input[type=submit]").prop("disabled", true);
    }
}
