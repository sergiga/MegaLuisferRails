order = $('<%= "#order-item-#{@repair.id}" %>')

order.children().remove()
order.append("<%= escape_javascript(render partial: 'repairs/repair_edit', object: @repair) %>")

$.ajax({
  type: "GET",
  url: "/repairs/new"
});
