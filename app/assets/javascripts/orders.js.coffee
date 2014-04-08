# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# space between jQuery and () is necessary 
$(document).ready ->
  iNum = 0
  $(document).on("keydown", "input[name*='barcode']", (e) ->
    if e.which == 13
      code = $(this).val()
      #need to check barcode existed in list or not, if existed then only add qty
      #attr selector didn't work
      barcodeExist(code)
      tNode = $(this).parents('tr.eachProduct')
      $.ajax(
        url: '../items/getByBarcode',
        data: { barcode: code },
        dataType: 'json'
      ).done (data) ->
      	#report error if item not found
      	if data.error == 'Item not found'
      	  alert data.error
      	else
      	  addNewProduct()
      	  tNode.find("input[name*='item_id']").val(data.item_id)
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
      	  calculateTotal()
      	  updateItemNum(1)
      e.preventDefault() 
  )
  
  # calculate the discount
  $('#order_discount').keydown( (event)->
    if event.which == 13 
      discounted = 0
      discounted = Number($('span.totalAmount').text()-$(this).val());
      $('span.totalAmount').text(discounted)
      event.preventDefault()
  )
  
  # calculate the change
  $('#order_cash_received').keydown( (event)->
    if event.which == 13
      change = Number($(this).val()-$('span.totalAmount').text());
      $('#order_change').val(change)
      event.preventDefault()
  )
  
  # when click, remove the product
  $('tr.eachProduct').find("a:contains('Remove')").click( (event)->
    $(this).closest('tr.eachProduct').remove()
    calculateTotal()
    updateItemNum(-1)    
    event.preventDefault()
  )
  
  # calculate the total amount in the order and update context
  calculateTotal = ->
    untaxTotal = 0
    $('tr.eachProduct').find('td.subTotal').each( ()->
      untaxTotal = untaxTotal + Number($(this).text())
    )
    $('span.totalAmount').text(untaxTotal)
  
  # check if barcode existed
  barcodeExist = (code)->
    $('.eachProduct').find("input[name*='barcode']").each( ()->
      #if $(this).val() == code and is new product 
      #  alert $(this).parents('tr.eachProduct').find("input[name*='qty']")
      #else
      #	alert "no"
    )
    
  # add new product input to wait for new item
  addNewProduct = ()->
    newProduct = $('tr.eachProduct').last().clone()
    #use regular expression to find last id, add 1 up to make new id then use to change id and name for input fields
    patt = new RegExp("[0-9]+")
    oldID = parseInt(patt.exec(newProduct.find("input[name*='barcode']").attr('id')))
    newID = oldID + 1
    newProductBarcode = newProduct.find("input[name*='barcode']")
    newProductItemID = newProduct.find("input[name*='item_id']")
    newProductPrice = newProduct.find("input[name*='price']")
    newProductQty = newProduct.find("input[name*='qty']")
    content = newProductBarcode.attr('id')
    newProductBarcode.attr('id',content.replace(patt.exec(content) ,newID))
    content = newProductItemID.attr('id')
    newProductItemID.attr('id',content.replace(patt.exec(content) ,newID))
    content = newProductPrice.attr('id')
    newProductPrice.attr('id',content.replace(patt.exec(content) ,newID))
    content = newProductQty.attr('id')
    newProductQty.attr('id',content.replace(patt.exec(content) ,newID))
    content = newProductBarcode.attr('name')
    newProductBarcode.attr('name',content.replace(patt.exec(content) ,newID))
    content = newProductItemID.attr('name')
    newProductItemID.attr('name',content.replace(patt.exec(content) ,newID))
    content = newProductPrice.attr('name')
    newProductPrice.attr('name',content.replace(patt.exec(content) ,newID))
    content = newProductQty.attr('name')
    newProductQty.attr('name',content.replace(patt.exec(content) ,newID))
    newProductBarcode.val("")
    newProduct.insertAfter($('tr.eachProduct').last())
    $('tr.eachProduct').last().find("input[name*='barcode']").focus()
    
  # update the number of item(s) in order  
  updateItemNum = (number) ->
    iNum += number
    if iNum < 0
      iNum = 0
    $('span#iNum').html(iNum)
    
