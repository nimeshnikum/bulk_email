$(function(){
    $(".top_routes_box").show();

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

//        if($(this).val()=='3')
//            $(".top_routes_box").show();
//        else
//            $(".top_routes_box").hide();
    })


    $("#select_all").click(function(){
        if (this.checked == true)
            $("input:not(:disabled)[type=checkbox][name='email[account_ids][]']").each(function(){
                this.checked = true;
            })
        else
            $("input:not(:disabled)[type=checkbox][name='email[account_ids][]']").each(function(){
                this.checked = false;
            })
    })

})