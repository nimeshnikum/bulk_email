$(function(){
    $("#account_last_invoice_date").datepicker({ dateFormat: "yy-mm-dd" });
    $("#account_current_balance_date").datepicker({ dateFormat: "yy-mm-dd" });

    $("#payment_cycle_box").hide();

    toggle_payment_term($("#account_payment_term").val());

    $("#account_payment_term").change(function(){
        toggle_payment_term(this.value);
    });

    function toggle_payment_term(value){
        if (value == 'post')
            $("#payment_cycle_box").show('highlight', 1000);
        else
            $("#payment_cycle_box").hide();
    }
})