/*
	for formPage, submit button disabled until form is completed
*/

$(document).ready(function (){
    validate();
    $('#wifi, #password, #email, #proxy').change(validate);
});

function validate(){
    if ($('#wifi').val().length   >   0   &&
        $('#email').val().length  >   0   &&
        $('#proxy').val().length  >   0) {
        $("input[type=submit]").prop("disabled", false);
    }
    else {
        $("input[type=submit]").prop("disabled", true);
    }
}
