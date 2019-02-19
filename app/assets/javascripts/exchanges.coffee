$(document).ready ->
  $('#amount').on 'change keyup', ->
    if $('form').attr('action') == '/convert'
      $.ajax '/convert',
        type: 'GET'
        dataType: 'json'
        data: {
                source_currency: $("#source_currency").val(),
                target_currency: $("#target_currency").val(),
                amount: $("#amount").val()
              }
        error: (jqXHR, textStatus, errorThrown) ->
          alert textStatus
        success: (data, textStatus, jqXHR) ->
          $('#result').val(data.value)
          return false;

  $('#change-currencies').click ->
    currency_val = $('#source_currency').val()
    target_val = $('#target_currency').val()
    $('#source_currency').val(target_val)
    $('#target_currency').val(currency_val).change()


# JS
# function invert() {
#  	currency = $('#source_currency'); 
#  	target = $('#target_currency');
#  	currency_val = currency.val(); 
#  	target_val = target.val(); 

#  	target.val(currency_val); 
#  	currency.val(target_val);

#  }
#  $( document ).ready(function() {
#      $("#inverter").on("click", invert);
#  });  