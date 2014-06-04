$(function(){
    $(".top_routes_box").hide();

    $("#email_email_template_id").change(function(){
        if($(this).val()=='')
        {
            $("#email_subject").val('')
            $("#email_body").val('')
        }
        else
        {
            $.ajax({
                url: "/emails/" + $(this).val() + "/select_template"
            }).done(function(data){
                $("#email_subject").val(data.subject)
                $("#email_body").val(data.body)
            })
        }

        if($(this).val()=='3')
            $(".top_routes_box").show();
        else
            $(".top_routes_box").hide();
    })

})