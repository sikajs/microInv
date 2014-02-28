# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# space between jQuery and () is necessary 
$(document).ready ->
  iNum = 0
  tList = $('#order_item_list')
  tList.find("input[name*='barcode']").keypress( (e) ->
    if e.which == 13
      #need to check barcode existed in list or not
      tNode = $(this).parents('tr')
      code = $(this).val()
      $.ajax(
        url: 'items/getByBarcode',
        data: { barcode: code },
        dataType: 'json'
      ).done (data) ->
      	tNode.find('td.name').html(data.item_name)
      	tNode.find('td.color').html(data.color)
      	tNode.find("input[name*='price']").val(data.unit_price)
      	tQty = tNode.find("input[name*='qty']")
      	if isNaN( parseInt( tQty.val(), 10 ) )
      	  tQty.val('1')
      	else
      	  tQty.val( parseInt( tQty.val(), 10 ) + 1 )
      	tNode.find('td.subTotal').html(data.unit_price * tQty.val())
      	#need to calculate new total and update the text
      	#need to add one new item
      	iNum += 1
      e.preventDefault() 
  )
    
  
