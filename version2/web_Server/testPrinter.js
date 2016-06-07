// Submit Button disabled until required fields are completed
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
