$(document).ready(function (){
    validate();
    $('#wifi, #password, #email, #printer').change(validate);
});

function validate(){
    if ($('#wifi').val().length   >   0   &&
        $('#email').val().length  >   0   &&
        $('#printer').val().length >  0   &&
        $('#password').val().length    >   0) {
        $("input[type=submit]").prop("disabled", false);
    }
    else {
        $("input[type=submit]").prop("disabled", true);
    }
}
