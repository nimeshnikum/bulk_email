$(function(){
//    $("form#top_routes_upload_form").submit(function(){
    $("button[name='full_upload_button']").click(function(){
        return confirm("Proceeding with 'Full Upload' will DELETE all existing records. Do you really want to proceed?");
    })
})