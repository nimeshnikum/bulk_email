$(function(){
  toggle_customer_role($("input[name='email_template[target]']:radio:checked").val());

  $("input[name='email_template[target]']:radio").change(function(){
      toggle_customer_role(this.value);
  })

  function toggle_customer_role(value)
  {
      if(value == 'C')
          $(".customer_role_box").show();
      else
          $(".customer_role_box").hide();
  }
})